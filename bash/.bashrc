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

alias lll='lsd -lt'
alias la='lsd -a'
alias ll='lsd -Alt'

alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'
alias lzg='lazygit'

# Pretifying bash
eval "$(starship init bash)"

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME/bin:"*) ;;
  *) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac
# pnpm end
