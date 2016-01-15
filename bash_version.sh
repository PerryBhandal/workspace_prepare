WORK_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export WORK_PATH

# Takes in two integers representing x and y coordinate.
function mouse_move() {
xdotool mousemove $1 $2
sleep 0.1
}

function init() {
if [ ! -d "venv" ]; then
    echo "ERROR: venv not found. Did you run init_env yet?"
    exit 1
fi

xdotool type "cd ${WORK_PATH}"; xdotool key "Return"; xdotool type "source venv/bin/activate"; xdotool key "Return"
sleep 0.1
}

function goto_workpath() {
cd ${WORK_PATH}
sleep 0.1

}

function create_tab() {
xdotool key "ctrl+shift+t"   
init
goto_workpath
sleep 0.1

}

function create_terminal() {
xdotool key "ctrl+alt+t"   
init
goto_workpath
sleep 0.1

}

function next_tab() {
xdotool key "ctrl+Page_Down"   
sleep 0.1

}

mouse_move 0 0
create_terminal

# Server
python server.py

# Guard
create_tab
guard

# Return to server
next_tab
