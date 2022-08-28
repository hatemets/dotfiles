# ~/.bashrc
#   _               _              
#  | |__   __ _ ___| |__  _ __ ___ 
#  | '_ \ / _` / __| '_ \| '__/ __|
# _| |_) | (_| \__ \ | | | | | (__ 
#(_)_.__/ \__,_|___/_| |_|_|  \___|
#

unset SUDO_UID SUDO_GID SUDO_USER

export NODE_PATH="$HOME/.npm-global/lib/node_modules"
export PATH="$HOME/bin:$NODE_PATH:$PATH"

# ag -g "" | fzf
export FZF_DEFAULT_COMMAND='rg --files --follow --no-ignore-vcs --hidden -g "!{**/dist/*,**/node_modules/*,project/*,**/package-lock.json,target/*,.git/*,**/*.o,**/obj/*,**/images/*,**/fonts/*,**/libs/**/*,**/.expo/*}"'

# Colors
YELLOW="\[$(tput setaf 165)\]"
GREEN="\[$(tput setaf 40)\]"
SEABLUE="\[$(tput setaf 046)\]"
ORANGE="\[$(tput setaf 208)\]"
ROSE="\[$(tput setaf 164)\]"
DEFAULT="\[$(tput sgr0)\]"

alias vi="nvim"
alias npr="npm run build"
alias src="source ~/.bashrc"
alias runserver="browser-sync start --server --files ."
alias ll="ls -lah"

# configuration files
alias nvc="nvim ~/.config/nvim/init.vim"
alias brc="nvim ~/.bashrc"
alias xkc="nvim ~/.config/xkeysnail/config.py"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# prompt design
alias ls="ls -1 --color=auto"
PS1="[$ORANGE\u@\h $SEABLUE\W$DEFAULT]\$ "

# Locations (for reference only)
WORKSPACE="$HOME/workspace-settings" # expected settings folder
CONFIG="$HOME/.config"

# git
alias gs="git status"
alias gc="git checkout"

# open a neovide terminal whilst closing the current one
function nv() {
    # filepath
    fpath=""

    case $1 in
        "nvc")
            fpath="$HOME/.config/nvim/init.vim"
            break
            ;;
        "brc")
            fpath="$HOME/.bashrc"
            break
            ;;
        "xkc")
            fpath="$HOME/.config/xkeysnail/config.py"
            break
            ;;
        *)
            fpath=$1
            ;;
    esac

    neovide --multigrid $fpath && exit
}

# neovidecloseterminal () {
# 	neovide "$@" && alacritty & 
# 	exit
# }


# automatically add, commit, and push updates
function gp() {
	git add .
	git commit -m "$1"
	git push
}

# for running a production server
function psv()
{
	npm run build
	npx serve -s build
}

# Copy files to workspace settings
function set-ws()
{
	echo "This function is empty"
}

# Copy files from workspace to the machine
function apply-ws()
{
	echo "Applying workspace settings..."
	cp -r $WORKSPACE/.config/ $HOME/
	cp $WORKSPACE/.bashrc $HOME
	echo "Requiring root permission for some operations"
	sudo cp -r $WORKSPACE/usr/ /
	sudo cp -r $WORKSPACE/etc/ /
	echo "Workspace settings applied successfully!"
}



# get an ip address with wget
function showip()
{
	wget -qO- http://ipecho.net/plain | xargs echo
}

# set cursor speed
xset r rate 270 50

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
. "$HOME/.cargo/env"
