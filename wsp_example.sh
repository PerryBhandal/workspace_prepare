# Source the wsp functions
source /home/perry/.scripts/wsp_functions.sh

## Function overview:
# mouse_move x y
# activate_venv
# goto_workpath
# create_tab
# next_tab
# run_command command_string

# Server
activate_venv
run_command "python server.py"

# Guard
create_tab
activate_venv
run_command "guard"

# pyscss
create_tab
activate_venv
run_command "pyscss -w assets/scss/ -o static/gen/"

# Return back to server tab.
next_tab
