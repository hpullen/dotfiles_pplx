# source global definitions
###do not remove the following lines###
if [ -f /etc/zshrc ]; then
    . /etc/zshrc
else
   echo "**system default start-up file: /etc/zshrc unreadable!  contact"
   echo -e "\tpp_unix_admin@physics.ox.ac.uk"
  
fi

# Setup for LHCb
if echo "$-" | grep i > /dev/null; then                                             
    source /data/lhcb/sw/scripts/lbsetup-cvmfs.sh
fi

# Source correct root
#cd /cvmfs/lhcb.cern.ch/lib/lcg/releases/LCG_84/ROOT/6.06.02/x86_64-slc6-gcc49-opt/bin
#source thisroot.sh
#cd
#source /cvmfs/lhcb.cern.ch/lib/lcg/releases/LCG_84/ROOT/6.06.02/x86_64-slc6-gcc49-opt/bin/thisroot.sh

# Export environment variables
export TERM="xterm-256color"
export EDITOR='vim'

# Path to your oh-my-zsh installation.
export ZSH=/home/pullen/.oh-my-zsh

# Add analysis code directory to CDPATH
export CDPATH=/home/pullen/analysis/tuple_scripts/analysis_code/

# Current working directory
alias cwd=~/analysis/tuple_scripts/plot_histos/partially_reconstructed_background/Code
hash cwd=~/analysis/data_HT/tuple_scripts/plot_histos/partially_reconstructed_background

# Set name of the theme to load.
POWERLEVEL9K_MODE='awesome-fontconfig'
ZSH_THEME="powerlevel9k/powerlevel9k"

# PowerLevel9k settings
# Shorten dir and status
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_beginning"
POWERLEVEL9K_STATUS_VERBOSE="FALSE"
# Colours for dir
POWERLEVEL9K_DIR_HOME_BACKGROUND="cyan"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="cyan"
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="cyan"
# Colours for OS icon
POWERLEVEL9K_OS_ICON_BACKGROUND="white"
POWERLEVEL9K_OS_ICON_FOREGROUND="black"
# Battery symbols and colours
POWERLEVEL9K_BATTERY_CHARGING='yellow'
POWERLEVEL9K_BATTERY_CHARGED='green'
POWERLEVEL9K_BATTERY_DISCONNECTED='$DEFAULT_COLOR'
POWERLEVEL9K_BATTERY_LOW_THRESHOLD='10'
POWERLEVEL9K_BATTERY_LOW_COLOR='red'
POWERLEVEL9K_BATTERY_ICON='\uf1e6 '
# Time format
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M}"
# Left prompt: os icon, current directory
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon dir)
# Right prompt: return status of last command, battery level, time
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(time)	

# Display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Change the command execution time stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd/mm/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(common-aliases git python pip zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Turn off autocorrection
unsetopt correct

# Stop sharing history between tmux panes
setopt nosharehistory

# GNU ls colours
eval `dircolors ~/clone/dircolors-solarized/dircolors.ansi-dark`
# Use in tab completion in zsh
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# General aliases
alias zshrc="vim ~/.zshrc"
alias sourcez="source ~/.zshrc"
alias vimrc="vim ~/.vimrc"
alias ls="ls --color=auto"
alias la="ls -a --color=auto"
alias ll="ls -l --color=auto"
alias c="clear"
alias cls="clear && ls --color=auto"	
alias del="rmtrash"
alias logout="exit"
alias make="make -j 10"
alias open="gnome-open"

# Unalias rm -i from common-aliases plugin
unalias rm

# Get rid of history printing funciton
unalias h

# LHCb aliases
alias root="root -l"
alias proxyinit="lb-run LHCbDIRAC lhcb-proxy-init"
alias getfile="lb-run LHCbDIRAC dirac-dms-get-file"
export GANGADIR="/data/lhcb/users/pullen/gangadir"
alias gangadir=/data/lhcb/users/pullen/gangadir
hash -d gangadir=/data/lhcb/users/pullen/gangadir
alias dvg="lb-run DaVinci/v41r2 gaudirun.py"
alias dvi="lb-run DaVinci/v41r2 ipython -i"
alias bender="lb-run Bender/latest bender"
alias dstdump="lb-run Bender/latest dst-dump -f -n 100"

# tmux aliases
alias ks="tmux kill-session"
alias kw="tmux kill-window"
alias kp="tmux kill-pane"

# CDPATH contains places to look for directories
export CDPATH=/home/pullen/analysis/tuple_scripts/analysis_code/:/data/lhcb/users/pullen/gangadir/ntuples/reduced_ntuples/

# General functions
# cd and cls
function cdl { cd "$@" && clear && ls; }
# Move contents of dir into a new subdir
function mvToDir {
    DIRNAME="$1"
    mkdir ../$DIRNAME
    mv * ../$DIRNAME
    mv ../$DIRNAME .
}
# Delete all files in directory except one
function delAllExcept {
    FILENAME="$1"
    mv $FILENAME ..
    del *
    mv ../$FILENAME .
}
# Mark the location of a directory to return to later
function mark { export $1="`pwd`"; }
# Reload directory if it has broken (e.g. due to closed ssh connection)
function reloadDir { 
    cwd="`pwd`"
    cd 
    cd $cwd
    clear && ls
}
# Copy contents of a directory to another directory
function copyContents {
    OLDDIR='$1'
    NEWDIR='$2'
    cp -r "$OLDDIR/*" $NEWDIR
}
alias cpc='copyContents'

# If in tmux, detach rather than exit
#function exit {
    #if [[ -z $TMUX ]]; then
        #builtin exit
    #else
        #tmux detach
    #fi
#}

# LD_LIBRARY_PATH should include my libraries
export LD_LIBRARY_PATH=/home/pullen/Library:$LD_LIBRARY_PATH

# Path to Linuxbrew
export PATH="$HOME/.linuxbrew/bin:$PATH"

# SimpleTools
SIMPLETOOLS=$HOME/simpletools_2.0u 
export LD_LIBRARY_PATH=$SIMPLETOOLS/lib:$LD_LIBRARY_PATH
export PATH=$SIMPLETOOLS/bin:$PATH

# Clear screen
clear && ls
