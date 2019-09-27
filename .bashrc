# .bashrc

# Source global definitions
###Do Not remove the following lines###
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
else
   echo "**System default start-up file: /etc/bashrc unreadable!  Contact"
   echo -e "\tpp_unix_admin@physics.ox.ac.uk"
  
fi

# Source group login
if echo "$-" | grep i > /dev/null; then
# source /data/lhcb/sw/scripts/lbsetup-cvmfs.sh -c x86_64-slc6-gcc49-opt
	echo "Sourcing LHCb login"
	source /cvmfs/lhcb.cern.ch/group_login.sh
	echo "Done"
fi

# # Setup ROOT
# echo "Sourcing ROOT setup script"
# # source /cvmfs/lhcb.cern.ch/lib/lcg/releases/LCG_88/ROOT/6.08.06/x86_64-slc6-gcc49-opt/bin/thisroot.sh
# source /cvmfs/lhcb.cern.ch/lib/lcg/releases/LCG_88/ROOT/6.08.06/x86_64-slc6-gcc62-opt/bin/thisroot.sh
# alias root="root -l"

# --------------
# Setup LHCb GCC
# --------------
echo "Setting up correct GCC version"
# export GCCROOT=/cvmfs/lhcb.cern.ch/lib/lcg/releases/LCG_88/gcc/4.9.3/x86_64-slc6
export GCCROOT=/cvmfs/lhcb.cern.ch/lib/lcg/releases/LCG_88/gcc/6.2.0/x86_64-slc6/
export PATH="$HOME/.local/bin:/cvmfs/lhcb.cern.ch/lib/lcg/releases/LCG_88/gcc/6.2.0/x86_64-slc6/bin/:$PATH"
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$GCCROOT/lib:$GCCROOT/lib64
# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/cvmfs/lhcb.cern.ch/lib/lcg/releases/LCG_88/GSL/2.1/x86_64-slc6-gcc49-opt/lib/
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/cvmfs/lhcb.cern.ch/lib/lcg/releases/LCG_88/GSL/2.1/x86_64-slc6-gcc62-opt/lib/
export CXX=$GCCROOT/bin/g++

# ----------
# Setup ROOT
# ----------
echo "Sourcing ROOT setup script"
# source /cvmfs/lhcb.cern.ch/lib/lcg/releases/LCG_88/ROOT/6.08.06/x86_64-slc6-gcc49-opt/bin/thisroot.sh
source /cvmfs/lhcb.cern.ch/lib/lcg/releases/LCG_88/ROOT/6.08.06/x86_64-slc6-gcc62-opt/bin/thisroot.sh
alias root="root -l"

# Source correct root
# CURRENT_DIR=$(pwd)
# # source /cvmfs/lhcb.cern.ch/lib/lcg/releases/LCG_88/ROOT/6.08.06/x86_64-slc6-gcc62-opt/bin/thisroot.sh
# cd /cvmfs/lhcb.cern.ch/lib/lcg/releases/LCG_84/ROOT/6.06.02/x86_64-slc6-gcc49-opt/bin/
# source thisroot.sh
# cd $CURRENT_DIR
  # . /cvmfs/lhcb.cern.ch/lib/lcg/releases/LCG_88/ROOT/6.08.06/x86_64-slc6-gcc49-opt/bin/thisroot.sh

# Setup for LHCb
#if echo "$-" | grep i > /dev/null; then
    #source /data/lhcb/sw/scripts/lbsetup-cvmfs.sh
#fi

# Source correct root
# source /cvmfs/lhcb.cern.ch/lib/lcg/releases/LCG_84/ROOT/6.06.02/x86_64-slc6-gcc49-opt/bin/thisroot.sh

# Disable autocomplete hidden files
#bind 'set match-hidden-files off'

# Powerline
#powerline-daemon -q
#POWERLINE_BASH_CONTINUATION=1
#POWERLINE_BASH_SELECT=1
#. $HOME/.local/lib/python2.6/site-packages/powerline/bindings/bash/powerline.sh
##if [ -d "$HOME/.local/python/2.6/site-packages" ]; then
        #PATH="$HOME/.local/python/2.6/site-packages"
#fi
#. /home/pullen/.local/lib/python2.6/site-packages/powerline/bindings/bash/powerline.sh
#powerline-daemon -q
#POWERLINE_BASH_CONTINUATION=1
#POWERLINE_BASH_SELECT=1

# # General aliases
# alias la="ls -a"
# alias c="clear"
# alias lt="ls -l -t"
# alias ll="ls -l"
# alias cls="clear && ls"
# alias cd..="cd .."
# alias ..="cd .."
# alias grep="grep --color"

# # Bash/vim file aliases
# alias vimrc="vim ~/.vimrc"
# alias bashp="vim ~/.bashrc"
# alias sourceb="source ~/.bashrc"

# # Set gangadir to variable
# GANGADIR='/data/lhcb/users/pullen/gangadir'

# # General functions
# # Change directory and print contents
# function cdl { cd "$@" && clear && ls; }
# alias cd="cdl"
# # Move contents of dir into a new subdir
# function mvToDir {
    # DIRNAME="$1"
    # mkdir ../$DIRNAME
    # mv * ../$DIRNAME
    # mv ../$DIRNAME .
# }
# # Delete all files in directory except one
# function delAllExcept {
    # FILENAME="$1"
    # mv $FILENAME ..
    # del *
    # mv ../$FILENAME .
# }
# # Mark the location of a directory to return to later
# function mark { export $1="`pwd`"; }

# # LHCb aliases
# alias dvi="lb-run DaVinci/v41r2 ipython -i"
# alias dvg="lb-run DaVinci/v41r2 gaudirun.py"
# alias root="root -l"
# alias proxyinit="lb-run LHCbDIRAC lhcb-proxy-init"
# alias getfile="lb-run LHCbDIRAC dirac-dms-get-file"
# alias cdganga="cd /data/lhcb/users/pullen/gangadir"

# # If in tmux, detach rather than exit
# function exit {
    # if [[ -z $TMUX ]]; then
        # builtin exit
    # else
        # tmux detach
    # fi
# }

# Use zsh
# exec zsh

#[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# added by Miniconda3 installer
#export PATH="/home/pullen/miniconda3/bin:$PATH"
