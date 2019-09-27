# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

#PATH=$PATH:$HOME/bin
#export PATH

# export PATH="$HOME/.local/bin:/cvmfs/lhcb.cern.ch/lib/lcg/releases/LCG_84/gcc/4.9.3/x86_64-slc6/bin:$PATH"
# export PATH="$HOME/.local/bin:/cvmfs/lhcb.cern.ch/lib/lcg/releases/LCG_88/gcc/6.2.0/x86_64-slc6/bin/:$PATH"
# export PATH="/cvmfs/lhcb.cern.ch/lib/lcg/releases/LCG_88/gcc/6.2.0/x86_64-slc6/bin:$PATH"

# Export gcc to library path
# LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/cvmfs/lhcb.cern.ch/lib/lcg/releases/LCG_88/GSL/2.1/x86_64-slc6-gcc62-opt/lib/
# LD_LIBRARY_PATH="/cvmfs/lhcb.cern.ch/lib/lcg/releases/LCG_84/GSL/1.10/x86_64-slc6-gcc49-opt/lib/:$LD_LIBRARY_PATH"
# LD_LIBRARY_PATH="/cvmfs/lhcb.cern.ch/lib/lcg/releases/LCG_84/gcc/4.9.3/x86_64-slc6/lib64:$LD_LIBRARY_PATH"
# export GCCROOT=/cvmfs/lhcb.cern.ch/lib/lcg/releases/LCG_88/gcc/6.2.0/x86_64-slc6
# LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$GCCROOT/lib:$GCCROOT/lib64
# LD_LIBRARY_PATH="/home/pullen/analysis/tuple_scripts/plot_histos/Library/plotStyle:$LD_LIBRARY_PATH"
# export LD_LIBRARY_PATH

unset USERNAME

exec zsh
