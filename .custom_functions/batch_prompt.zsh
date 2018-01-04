function batch_prompt_precmd() {
    local BATCHINFO=""
    local N_TESTING=$(qstat -ans | grep hancock | grep testing | wc -l)
    local N_SHORT=$(qstat -ans | grep hancock | grep shor | wc -l)
    local N_NORMAL=$(qstat -ans | grep hancock | grep normal | wc -l)
    if [[ ${N_TESTING} -ne 0 ]]; then
        BATCHINFO="%{$fg[cyan]%} ${N_TESTING}"
    fi
    if [[ ${N_SHORT} -ne 0 ]]; then
        BATCHINFO="${BATCHINFO} %{$fg[green]%} ${N_SHORT}"
    fi
    if [[ ${N_NORMAL} -ne 0 ]]; then
        BATCHINFO="${BATCHINFO} %{$fg[yellow]%} ${N_NORMAL}"
    fi
    echo $BATCHINFO
}
