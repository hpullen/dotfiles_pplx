function get_entries {

FILENAME=$1
MACRO=$HOME/.root_macros/getEntries.C
if [[ $# == 3 ]]; then
    TREENAME=$2
    root -b -q "$MACRO(\"$FILENAME\", \"$TREENAME\")" | tail -1
else 
    root -b -q "$MACRO(\"$FILENAME\")" | tail -1
fi


}
