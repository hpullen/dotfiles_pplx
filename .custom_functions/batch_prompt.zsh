function batch_prompt_precmd() {
    local BATCHINFO=""
    local SURNAME="pullen"
    if [[ $(qstat -ans | grep $SURNAME | wc -l) -ne 0 ]]; then
        local N_TESTING=$(qstat -ans | grep $SURNAME | grep testing | wc -l)
        local N_SHORT_RUNNING=$(qstat -ans | grep $SURNAME | grep shor | awk '{print $10}' | grep R | wc -l)
        local N_SHORT_QUEUEING=$(qstat -ans | grep $SURNAME | grep shor | awk '{print $10}' | grep Q | wc -l)
        local N_NORMAL=$(qstat -ans | grep $SURNAME | grep normal | wc -l)
        if [[ ${N_TESTING} -ne 0 ]]; then
            BATCHINFO="%{$fg[cyan]%} ${N_TESTING}"
        fi
        if [[ $((${N_SHORT_RUNNING} + ${N_SHORT_QUEUEING})) -ne 0 ]]; then
            BATCHINFO="${BATCHINFO} %{$fg[green]%} "
        fi
        if [[ ${N_SHORT_RUNNING} -ne 0 ]]; then 
            BATCHINFO="${BATCHINFO}${N_SHORT_RUNNING}" 
        fi
        if [[ ${N_SHORT_QUEUEING} -ne 0 ]]; then
            BATCHINFO="${BATCHINFO}(${N_SHORT_QUEUEING})"
        fi
        if [[ ${N_NORMAL} -ne 0 ]]; then
            BATCHINFO="${BATCHINFO} %{$fg[yellow]%} ${N_NORMAL}"
        fi
        echo $BATCHINFO
    fi
}

function batch_prompt {

    if [[ -z $BATCH_PROMPT ]]; then
        POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status custom_batch background_jobs anaconda)
        source $ZSH/oh-my-zsh.sh
        export BATCH_PROMPT="1"
    else 
        POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status background_jobs anaconda)
        source $ZSH/oh-my-zsh.sh
        export BATCH_PROMPT=""
    fi

}
