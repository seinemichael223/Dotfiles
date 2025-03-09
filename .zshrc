if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
    git
    zsh-syntax-highlighting
    zsh-autosuggestions
)

# Aliases
alias ls='eza -a'
alias ll='eza -alh'
alias yt-dlp-muzik='yt-dlp --extract-audio --audio-format mp3'
alias yt='yt-dlp -f "bestvideo[ext=mp4][height=1080][fps=60]+bestaudio"'
alias cv-pdf='libreoffice --headless --convert-to pdf'
alias py='python'
# alias f='yazi'
alias rs='rustc'
alias vim='nvim'
alias cat='bat'
alias ps='procs'
alias cd='z'
alias du='dust'
alias fd='fd -uuu'
alias t='touch'
alias gallery-dl='gallery-dl -o skip=true'
alias dku='docker-compose up --build -d'
alias dkd='docker-compose down -v'

# Display Random gifs
#kitten icat --align left $(find $HOME/.config/neofetch/gifs/ -name "*.gif" | sort -R | head


source $ZSH/oh-my-zsh.sh
eval "$(zoxide init zsh)"

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Created by `pipx` on 2024-08-19 14:05:16
export PATH="$PATH:/home/ff223/.local/bin"
alias ls='eza -a'
alias ll='eza -alh'

cdx() {
    if zoxide query "$1" > /dev/null 2>&1; then
        cd "$(zoxide query "$1")" && ls
    else
        echo "Error: No match found for '$1'"
    fi
}

function f() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
