# Reset zplugs
zplugs=()

# source global definitions
###do not remove the following lines###
if [ -f /etc/zshrc ]; then
    . /etc/zshrc
else
   echo "**system default start-up file: /etc/zshrc unreadable!  contact"
   echo -e "\tpp_unix_admin@physics.ox.ac.uk"
  
fi

## Setup for LHCb
 # if echo "$-" | grep i > /dev/null; then
 #    # source /data/lhcb/sw/scripts/lbsetup-cvmfs.sh
 # fi

# Export environment variables
export TERM="xterm-256color"
export EDITOR='vim'

# Path to your oh-my-zsh installation.
export ZSH=/home/pullen/.oh-my-zsh

# Set name of the theme to load.
IP_ADDRESS=`echo $SSH_CLIENT | awk '{print $1}'`
#if [[ "$IP_ADDRESS" = "128.141.59.8" ]]; then
if [[ 1 = 1 ]]; then
    POWERLEVEL9K_MODE='awesome-fontconfig'
else 
    POWERLEVEL9K_MODE='default'
fi
ZSH_THEME="powerlevel9k/powerlevel9k"
# ZSH_THEME="evan"

# PowerLevel9k settings
# Shorten dir and status
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_beginning"
POWERLEVEL9K_STATUS_VERBOSE="FALSE"

# Colours for dir
POWERLEVEL9K_DIR_HOME_BACKGROUND="none"
POWERLEVEL9K_DIR_HOME_FOREGROUND="cyan"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="none"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="cyan"
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="none"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="cyan"
POWERLEVEL9K_DIR_SHOW_WRITABLE="true"

# Colours for OS icon
POWERLEVEL9K_OS_ICON_BACKGROUND="none"
POWERLEVEL9K_OS_ICON_FOREGROUND="default"

# Separators
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=''
POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR='%F{default}|'
POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR='%F{default}|'

# Time format
POWERLEVEL9K_TIME_FOREGROUND="default"
POWERLEVEL9K_TIME_BACKGROUND="none"

# Conda environent format
POWERLEVEL9K_ANACONDA_BACKGROUND="none"
POWERLEVEL9K_ANACONDA_FOREGROUND="green"
POWERLEVEL9K_ANACONDA_LEFT_DELIMITER=""
POWERLEVEL9K_ANACONDA_RIGHT_DELIMITER=""
POWERLEVEL9K_PYTHON_ICON=""

# Custom VCS prompt
source ~/.custom_functions/git_prompt.zsh
POWERLEVEL9K_CUSTOM_GIT="git_prompt_precmd"
POWERLEVEL9K_CUSTOM_GIT_BACKGROUND="none"
POWERLEVEL9K_CUSTOM_GIT_FOREGROUND="default"

# Custom batch jobs prompt
source ~/.custom_functions/batch_prompt.zsh
POWERLEVEL9K_CUSTOM_BATCH="batch_prompt_precmd"
POWERLEVEL9K_CUSTOM_BATCH_BACKGROUND="none"
POWERLEVEL9K_CUSTOM_BATCH_FOREGROUND="default"

# Left prompt: os icon, current directory
# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon dir custom_git)
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon dir)

# Right prompt: return status of last command, battery level, time
#POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status background_jobs time)
# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status custom_batch background_jobs anaconda)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status background_jobs anaconda)

# Display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="false"

# Change the command execution time stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd/mm/yyyy"

# Fancy font stuff for ssh from laptop only
#if [[ "$IP_ADDRESS" = "128.141.59.8" ]]; then
if [[ 1 = 1 ]]; then
    # End of prompt
    POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR='%F{default}  '
    # Time format with icons
    POWERLEVEL9K_TIME_FORMAT="\uf017 %D{%H:%M}  \uf073 %D{%d/%m/%y}"
else 
    POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR='%F{default} $ '
    POWERLEVEL9K_TIME_FORMAT="%D{%H:%M} | %D{%d/%m/%y}"
fi

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(common-aliases git pip tmux fast-syntax-highlighting solarized-man fancy-ctrl-z)

source $ZSH/oh-my-zsh.sh

# Turn off autocorrection
unsetopt correct

# Stop sharing history between tmux panes
setopt nosharehistory

# Load zmv and zcalc
autoload -U zmv
autoload -Uz zcalc

# GNU ls colours
eval `dircolors ~/.dircolors/dircolors.ansi-dark` 
# Use in tab completion in zsh
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# General aliases
alias zshrc="vim ~/.zshrc"
alias zr="source ~/.zshrc"
alias vimrc="vim ~/.vimrc"
alias vimm="vim -u ~/.vimrc_minimal"
alias ls="ls --color=auto --group-directories-first"
alias la="ls -a --color=auto"
alias ll="ls -lh --color=auto"
alias lt="/bin/ls -ltFh --colo=auto"
alias lth="lt | head"
alias cls="clear && ls --color=auto"	
alias c="clear"
alias del="rmtrash"
alias logout="exit"
alias make="make -j 10"
alias open="fix_display && gnome-open"
alias dirs="dirs -v"
alias untar="tar -xvzf"
alias blame="cd ~/Downloads/from_others && ./qstat_blame.py && cd -"
alias grep="grep -i -I --color"

# Remove all deleted files from git
alias git_rm_all="git ls-files --deleted -z | xargs -0 git rm"

# Unalias rm -i from common-aliases plugin
unalias rm

# Modify/remove git aliases
unalias gbd
alias gst="git status -s"

# Get rid of history printing funciton
unalias h

# Don't use GUI for git push
unset SSH_ASKPASS

# LHCb aliases
alias root="fix_display && root -l"
alias proxyinit="lb-run LHCbDIRAC lhcb-proxy-init"
alias getfile="lb-run LHCbDIRAC dirac-dms-get-file"
export GANGADIR="/data/lhcb/users/pullen/gangadir"
alias gangadir=/data/lhcb/users/pullen/gangadir
hash -d gangadir=/data/lhcb/users/pullen/gangadir
alias dvg="lb-run DaVinci/v44r6 gaudirun.py"
alias dvi="lb-run DaVinci/v44r6 ipython -i"
alias bender="lb-run Bender/latest bender"
alias dstdump="lb-run Bender/latest dst-dump -f -n 100"

# # Root as a function
# function root() {
    # DEFAULT_ROOT=/cvmfs/lhcb.cern.ch/lib/lcg/releases/LCG_84/ROOT/6.06.02/x86_64-slc6-gcc49-opt/bin/root
    # if [ "$1" != "" ]
    # then
        # fix_display && $DEFAULT_ROOT -l
    # else
        # fix_display && $DEFAULT_ROOT -l -b -q $1
    # fi
# }

# tmux aliases
alias ks="tmux kill-session"
alias kw="tmux kill-window"
alias kp="tmux kill-pane"

# CDPATH contains places to look for directories
# export CDPATH=/home/pullen/analysis/tuple_scripts/analysis_code/:/data/lhcb/users/pullen/gangadir/ntuples/reduced_ntuples/

# Write display to file on login to a non-tmux shell
if [ -z "$TMUX" ]
then 
    echo $DISPLAY > ~/.display
fi
# Function to fix display in tmux
function fix_display {
    export DISPLAY=`cat ~/.display`
}

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
#function mark { export $1="`pwd`"; }
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

# LD_LIBRARY_PATH should include my libraries and simpletools
if [[ $LD_LIBRARY_PATH != *"/pullen/Library"* ]]; then
    export LD_LIBRARY_PATH=/home/pullen/Library:$LD_LIBRARY_PATH
fi
SIMPLETOOLS=$HOME/simpletools_2.0u 
if [[ $LD_LIBRARY_PATH != *"simpletools"* ]]; then
    export LD_LIBRARY_PATH=$SIMPLETOOLS/lib:$LD_LIBRARY_PATH
fi

# Paths to local installations
path+=("$HOME/.local/bin")
path+=("$HOME/.linuxbrew/bin")
path+=("$SIMPLETOOLS/bin")
path+=("$HOME/miniconda3/bin")

# Remove duplicate entries and export
typeset -U path
export PATH

# Aliases for locally install tools
alias diff="colordiff"

# Clear screen
clear && ls

# Colour function for running executables
run()
{
    EXECUTABLE=$1
    shift

    errpat="^.*: "
    funcpat="\<\w+\>(::\<\w+\>)+"
    mainpat=" main "
    cpppat="[^ ]*\.[ch][^:]*"
    linepat="[0-9]+$"
    

    ccred=$(echo -e "\033[0;31m")
    ccend=$(echo -e "\033[0m")
    ccblue=$(echo -e "\033[0;34m")
    ccgreen=$(echo -e "\033[0;32m")
    ccmagenta=$(echo -e "\033[0;35m")
    ccyellow=$(echo -e "\033[0;33m")

    ./"$EXECUTABLE" "$@" 2>&1 | sed -E -e "/^Error / s%$errpat%$ccred&$ccend%" -e "/^#[0-9]+/ s%$funcpat%$ccblue&$ccend%" -e "/at $cpppat:[0-9]+$/ s%$cpppat%$ccgreen&$ccend%g" -e "/$cpppat/ s%$linepat%$ccmagenta&$ccend%" -e "/^Info in/ s%$errpat%$ccyellow&$ccend%" -e "/^#[0-9]+ / s%$mainpat%$ccblue&$ccend%" -e "/segmentation violation/ s%.*%$ccred&$ccend%"
    return ${PIPESTATUS[0]}
}

# Check jobs
chj()
{
    # Set colour formatting
    ccred=$(echo -e "\033[0;31m")
    ccyellow=$(echo -e "\033[0;33m")
    ccgreen=$(echo -e "\033[0;32m")
    ccmagenta=$(echo -e "\033[0;35m")
    ccpurple=$(echo -e "\033[0;95m")
    ccblue=$(echo -e "\033[0;34m")
    cccyan=$(echo -e "\033[0;36m")
    ccorange=$(echo -e "\033[0;91m")
    ccgrey=$(echo -e "\033[0;39m")
    ccend=$(echo -e "\033[0m")

    # Set surname to search
    if [[ $# -eq 0 ]]
    then
        SURNAME="pullen"
    else
        if [[ $1 == "all" ]]
        then
            SURNAME="."
        else 
            SURNAME=$1
        fi
    fi

    # Check whether jobs exist for the user
    if [[ "$(qstat -ans | grep -c $SURNAME)" -eq 0 ]]
    then
        echo "No active jobs found for user "$ccorange$SURNAME$ccend
        return ${PIPESTATUS[0]}
    fi


    # Print job status
    qstat -ans | sed -n "4,5 p"
    qstat -ans | sed -n "/$SURNAME/p" | sed -n "/^[0-9]/p" | \
    sed -E -e "s/^[0-9]+/$ccmagenta&$ccend/g" | \
    awk '{if (index($3, "test") != 0)
          $3=cccyan $3 ccend; 
          else if (index($3, "verysh") != 0) 
          $3=ccgreen $3 ccend; 
          else if (index($3, "short") != 0) 
          $3=ccgreen $3 ccend; 
          else if (index($3, "normal") != 0)
          $3=ccyellow $3 ccend;
          else if (index($3, "long") != 0)
          $3=ccorange $3 ccend;
          else 
          $3=ccgrey $3 ccend;
          print}' ccgreen="$ccgreen" cccyan="$cccyan" ccyellow="$ccyellow" \
              ccorange="$ccorange" ccgrey="$ccgrey" ccend="$ccend" | \
    awk '{$9=ccpurple $9 ccend; print}' ccpurple="$ccpurple" ccend="$ccend" | \
    awk '{if (index($11, "--") != 0) 
          $11=ccgrey $11 ccend;
          else
          $11=ccblue $11 ccend; 
          print}' ccblue="$ccblue" ccgrey="$ccgrey" ccend="$ccend" |\
    awk '{if (index($10, "R") != 0)
          $10=ccgreen $10 ccend;
          else if (index($10, "Q") != 0)
          $10=ccyellow $10 ccend;
          print}' ccgreen="$ccgreen" ccyellow="$ccyellow" ccend="$ccend" | \
      awk 'BEGIN{nums[1]=30; nums[2]=10; nums[3]=18; nums[4]=15; nums[5]=5; 
          nums[6]=4; nums[7]=5; nums[8]=5; nums[9]=15; nums[10]=1; nums[11]=5;} 
          {for (col = 1; col <= NF; col++) {
              for (sp = length($col); sp <= nums[col]; sp++) {
                  $col = $col " ";
              }
          } print;}' 
    return ${PIPESTATUS[0]}
}


# Kill all batch jobs
kill_all_jobs() {
    for j in $(qstat -ans | grep pullen | grep -o "^[0-9]\+"); do
        qdel $j
    done
}


# Check number of jobs
jobnum() {
    qstat | grep $USER | wc -l
}


# Function to delete job from list 
delj() {
    if [[ $# -eq 0 ]] 
    then
        echo Please provide a number.
        return
    fi

    JOBNUM=$1
    JOBID=$(qstat -ans | grep pullen | sed -n "$JOBNUM p" | grep -o '^[0-9]\+')
    echo Deleting job with ID $JOBID:
    chj | grep $JOBID
}


# Function to run last command with text changed
rep() {
    if [[ $# -ne 2 ]]
    then
        echo "Usage: rep expr1 expr2"
        return
    fi
    LAST_COMMAND=$(echo `history | tail -1` | sed 's/[0-9]* //')
    NEW_COMMAND=$(echo $LAST_COMMAND | sed "s/$1/$2/g")
    eval $NEW_COMMAND
}
alias cdg="cd $GANGADIR"
export DATADIR="/data/lhcb/users/pullen/B02DKstar/"
alias cdd="cd $DATADIR"

# Source custom functions
source ~/.custom_functions/subdir.sh
source ~/.custom_functions/get_entries.sh
source ~/.custom_functions/quick_plot.sh
alias make="colormake"

# Source GGSZ
function ggsz {
    source ~/analysis/GGSZ-Bd2DKst/setenv.sh $*
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS='--color=16'

# EvtGen stuff
export LD_LIBRARY_PATH=/home/pullen/RapidSim/EvtGen/external/HepMC/lib:/home/pullen/RapidSim/EvtGen/external/pythia8230/lib:/home/pullen/RapidSim/EvtGen/external/PHOTOS/lib:/home/pullen/RapidSim/EvtGen/external/TAUOLA/lib:/home/pullen/RapidSim/EvtGen/evtgen/lib:$LD_LIBRARY_PATH
export PYTHIA8DATA=/home/pullen/RapidSim/EvtGen/external/pythia8230/share/Pythia8/xmldoc
