export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="xiong-chiamiov-plus"

plugins=(git dnf)


export PF_ASCII="Catppuccin"
export PFETCH_PATH="$HOME/scripts/pfetch/pfetch"

fastfetch && echo && ~/scripts/kawaii_welcome.sh && echo

export GTK_THEME="catppuccin-mocha-pink-standard+default"
export XDG_CURRENT_DESKTOP=GTK

export XCURSOR_THEME=Bibata-Modern-Ice
export XCURSOR_SIZE=24

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZSH/oh-my-zsh.sh


export PATH=$PATH:/home/hman/.spicetify
