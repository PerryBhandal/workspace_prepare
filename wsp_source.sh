WORK_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export WORK_PATH

SLEEP_TIME=0.5

# Takes in two integers representing x and y coordinate.
function mouse_move() {
xdotool mousemove $1 $2
sleep $SLEEP_TIME
}

function init() {
xdotool type "cd ${WORK_PATH}"; xdotool key "Return"; 
sleep $SLEEP_TIME
}

function activate_venv() {

if [ ! -d "venv" ]; then
    echo "ERROR: venv not found. Did you run init_env yet?"
    exit 1
fi

xdotool type "source venv/bin/activate"; xdotool key "Return"

}

function goto_workpath() {
cd ${WORK_PATH}
sleep $SLEEP_TIME

}

function create_tab() {
xdotool key "ctrl+shift+t"   
init
sleep $SLEEP_TIME

}

function next_tab() {
xdotool key "ctrl+Page_Down"   
sleep $SLEEP_TIME
}

function run_command() {
xdotool type "$1"; xdotool key "Return"

}

# Server
activate_venv
run_command "python server.py"

# Guard
create_tab
activate_venv
run_command "guard"
