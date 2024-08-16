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
alias ls='eza -1  --icons -a'
alias ll='eza -1 --icons -alh'
alias yt-dlp-muzik='yt-dlp --extract-audio --audio-format mp3'
alias yt='yt-dlp -f "bestvideo[ext=mp4][height=1080][fps=60]+bestaudio"'
alias cv-pdf='libreoffice --headless --convert-to pdf'
alias py='python'
alias fnc='joshuto'
alias rs='rustc'
alias vim='nvim'
alias cat='bat'
alias ps='procs'
alias cd='z'
alias du='dust'
alias fd='fd -uuu'
alias t='touch'
alias gallery-dl='gallery-dl -o skip=true'

# Display Random gifs
#kitten icat --align left $(find $HOME/.config/neofetch/gifs/ -name "*.gif" | sort -R | head


source $ZSH/oh-my-zsh.sh
eval "$(zoxide init zsh)"

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
