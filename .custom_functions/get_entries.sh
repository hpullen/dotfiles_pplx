function get_entries {

FILENAME=$1
MACRO=$HOME/.root_macros/getEntries.C
if [[ $# == 2 ]]; then
    CUT=$2
    root -b -q "$MACRO(\"$FILENAME\", \"$CUT\")" | tail -1
else 
    root -b -q "$MACRO(\"$FILENAME\")" | tail -1
fi


}
