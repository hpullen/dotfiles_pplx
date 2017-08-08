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
# # VCS COLOURS
# POWERLEVEL9K_VCS_CLEAN_BACKGROUND="green"
# POWERLEVEL9K_VCS_CLEAN_FOREGROUND="black"
# POWERLEVEL9K_VCS_MODIFIED_BACKGROUND="yellow"
# POWERLEVEL9K_VCS_MODIFIED_FOREGROUND="black"
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
plugins=(common-aliases git python pip tmux zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Turn off autocorrection
unsetopt correct

# Stop sharing history between tmux panes
setopt nosharehistory

# Load zmv and zcalc
autoload -U zmv
autoload -Uz zcalc

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
alias ll="ls -lh --color=auto"
alias c="clear"
alias cls="clear && ls --color=auto"	
alias del="rmtrash"
alias logout="exit"
alias make="make -j 10"
alias open="fix_display && gnome-open"

# Remove all deleted files from git
alias git_rm_all="git ls-files --deleted -z | xargs -0 git rm"

# Unalias rm -i from common-aliases plugin
unalias rm

# Unalias gbd from git plugin (easily confused with gdb)
unalias gbd

# Get rid of history printing funciton
unalias h

# LHCb aliases
alias root="fix_display && root -l"
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

# Colour function for make
make()
{
    pathpat="^.*:[0-9]+"
    # cpppat="<w+\.cpp>"
    cpppat="src.*\.cpp\>"
    objpat="obj.*\.o\>"
    exepat="\<\w*\>"
    incpat="-I[^ ]*\>"
    libpat=" -l[^ ]*\>"
    libpat2=" [^ ]*\.so\>"
    btpat=' `.*`'

    ccred=$(echo -e "\033[0;31m")
    ccyellow=$(echo -e "\033[0;33m")
    ccgreen=$(echo -e "\033[0;32m")
    ccmagenta=$(echo -e "\033[0;35m")
    ccpurple=$(echo -e "\033[0;95m")
    ccblue=$(echo -e "\033[0;34m")
    cccyan=$(echo -e "\033[0;36m")
    ccorange=$(echo -e "\033[0;91m")
    ccend=$(echo -e "\033[0m")

    /usr/bin/make -j 10 "$@" 2>&1 | sed -E -e "/[Ee]rror[: ]/ s%$pathpat%$ccred&$ccend%g" -e "/[Ww]arning[: ]/ s%$pathpat%$ccyellow&$ccend%g" -e "/^g\+\+ -c/ s%$cpppat%$ccgreen&$ccend%g" -e "/^g\+\+/ s%$objpat%$ccpurple&$ccend%g" -e "/^g\+\+ -o/ s%$exepat%$ccmagenta&$ccend%3" -e "s%$libpat%$cccyan&$ccend%g" -e "s%$libpat2%$cccyan&$ccend%g" -e "s%$incpat%$ccblue&$ccend%g" -e "s%$btpat%$ccorange&$ccend%g" -e "/[Ee]rror[: ]/,+2 s%\^%$ccred&$ccend%g" -e "/[Ww]arning[: ]/,+2 s%\^%$ccyellow&$ccend%g"

    return ${PIPESTATUS[0]}
}

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
            SURNAME=".*"
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


# Ignore accidental trailing characters in cd
# cd() {
    # # Deal with default cd to home
    # if [[ $# -eq 0 ]]
    # then
        # builtin cd
        # return ${PIPESTATUS[0]}
    # fi

    # # Deal with cd -
    # if [[ $1 == "-" ]]
    # then
        # echo "cd - was chosen"
        # builtin cd -
    # fi

    # # See if directory exists
    # if [[ -d $1 ]]
    # then
        # builtin cd $1
    # else

        # # If not, see if directory above exists
        # SHORTDIR=$(dirname $1)
        # if [[ -d $SHORTDIR ]] && [[ $SHORTDIR != "./" ]]
        # then
            # echo "I assume you meant \"cd $(echo -e "\033[0;34m")$SHORTDIR/$(echo -e "\033[0m")\"..."
            # builtin cd $SHORTDIR
            # return ${PIPESTATUS[0]}
        # fi

        # # Print message if not found
        # echo "Directory \"$(echo -e "\033[0;33m")$SHORTDIR$(echo -e "\033[0m")\" not found."
    # fi
    # return ${PIPESTATUS[0]}
# }


# Set up for custom completion options
# fpath=(~/.zsh/completion $fpath)
# fpath=$(echo "$fpath" | awk -v RS=':' -v ORS=":" '!a[$1]++')
# export fpath
# autoload -U compinit
# compinit
# zstyle ':completion:*' menu select=2


