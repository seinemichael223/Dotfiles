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
alias vi='nvim'
alias cat='bat'
alias ps='procs'
alias cd='z'
alias du='dust'
alias fd='fd -uuu'
alias t='touch'
alias gallery-dl='gallery-dl -o skip=true'
alias dku='docker-compose up --build -d'
alias dkd='docker-compose down -v'
alias fch='macchina'
alias tt='zellij'
alias gt='gophertube'

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

# For yazi to remember folder when exited
function f() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

export EDITOR=nvim

# Frappe
# export FZF_DEFAULT_OPTS=" \
# --color=bg+:#414559,bg:#303446,spinner:#f2d5cf,hl:#e78284 \
# --color=fg:#c6d0f5,header:#e78284,info:#ca9ee6,pointer:#f2d5cf \
# --color=marker:#babbf1,fg+:#c6d0f5,prompt:#ca9ee6,hl+:#e78284 \
# --color=selected-bg:#51576d \
# --color=border:#414559,label:#c6d0f5"

# Mocha
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8 \
--color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC \
--color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \
--color=selected-bg:#45475A \
--color=border:#6C7086,label:#CDD6F4"

export QT_IM_MODULE='fcitx'
export XMODIFIERS='@im=fcitx'
export PATH="$HOME/.pub-cache/bin:$PATH"
