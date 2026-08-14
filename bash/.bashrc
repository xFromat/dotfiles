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

alias lll='lsd -lt'
alias la='lsd -a'
alias ll='lsd -Alt'

alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'
alias lzg='lazygit'

# Pretifying bash
eval "$(starship init bash)"

