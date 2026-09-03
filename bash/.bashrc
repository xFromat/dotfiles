# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
	PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi
unset rc

[[ $- == *i* ]] && source -- "$HOME/.local/share/blesh/ble.sh" --attach=none

if [[ -z "$SSH_AUTH_SOCK" ]]; then
	eval "$(ssh-agent -s)" &>/dev/null
fi

tmx () {
  local SESSION_NAME="${1:-SessionName}"
  tmux new-session -d -s "$SESSION_NAME"
  tmux rename-window -t "$SESSION_NAME:0" project
  tmux new-window -d -t "$SESSION_NAME" -n spare
  tmux new-window -d -t "$SESSION_NAME" -n ssh
  tmux new-window -d -t "$SESSION_NAME" -n LP_1
  tmux new-window -d -t "$SESSION_NAME" -n LP_2
  tmux attach-session -t "$SESSION_NAME"
}

hrx () {
  local SESSION_NAME="${1:-SessionName}"
  local sock running ws tab name i created existing
  sock="$HOME/.config/herdr/sessions/$SESSION_NAME/herdr.sock"
  [[ $SESSION_NAME == default ]] && sock="$HOME/.config/herdr/herdr.sock"
  hrx_cmd() { env -u HERDR_SOCKET_PATH herdr --session "$SESSION_NAME" "$@"; }

  running=$(herdr session list --json | jq -r --arg n "$SESSION_NAME" \
    '.sessions[] | select(.name == $n) | .running')
  if [[ $running != true ]]; then
    herdr --session "$SESSION_NAME" server </dev/null >/dev/null 2>&1 &
    disown $! 2>/dev/null || true
    i=0
    while [[ ! -S $sock ]] && ((i < 40)); do
      i=$((i + 1))
      sleep 0.05
    done
    if [[ ! -S $sock ]]; then
      echo "hrx: herdr session '$SESSION_NAME' did not start" >&2
      unset -f hrx_cmd
      return 1
    fi
  fi

  ws=$(hrx_cmd workspace list 2>/dev/null |
    jq -r '.result.workspaces[0].workspace_id // empty')
  if [[ -z $ws ]]; then
    created=$(hrx_cmd workspace create --label "$SESSION_NAME" --no-focus)
    ws=$(printf '%s\n' "$created" | jq -r '.result.workspace.workspace_id // empty')
    tab=$(printf '%s\n' "$created" | jq -r '.result.tab.tab_id // empty')
  else
    hrx_cmd workspace rename "$ws" "$SESSION_NAME" >/dev/null
    tab=$(hrx_cmd tab list --workspace "$ws" 2>/dev/null |
      jq -r '.result.tabs[0].tab_id // empty')
  fi
  if [[ -z $ws || -z $tab ]]; then
    echo "hrx: could not create workspace in '$SESSION_NAME'" >&2
    unset -f hrx_cmd
    return 1
  fi

  existing=$(hrx_cmd tab list --workspace "$ws" 2>/dev/null |
    jq -r '.result.tabs[] | .label')
  if ! grep -qx "1 project" <<<"$existing"; then
    hrx_cmd tab rename "$tab" "1 project" >/dev/null
    existing=$(printf '%s\n' "$existing" | sed '1s/.*/project/')
  fi
  for name in "2 spare" "3 ssh" "4 LP_1" "5 LP_2"; do
    grep -qx "$name" <<<"$existing" && continue
    hrx_cmd tab create --workspace "$ws" --label "$name" --no-focus >/dev/null
  done
  hrx_cmd tab focus "$tab" >/dev/null
  unset -f hrx_cmd
  herdr session attach "$SESSION_NAME"
}

alias lll='lsd -lt'
alias la='lsd -a'
alias ll='lsd -Alt'

alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'
alias lzg='lazygit'

alias hls='herdr session list'
alias hsa='herdr session attach'

# Pretifying bash
eval "$(starship init bash)"

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME/bin:"*) ;;
  *) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac
# pnpm end

[[ ! ${BLE_VERSION-} ]] || ble-attach
shopt -s autocd
shopt -s cdspell
export PATH=$PATH:$HOME/.local/opt/go/bin
