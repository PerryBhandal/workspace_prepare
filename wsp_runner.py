import os
import sys
import time

PREP_SCRIPT_NAME = "wsprepare.py"
SLEEP_TIME = 1 # Time in seconds to sleep after a command, mouse move or key press.

def action_sleep():
    time.sleep(SLEEP_TIME)

def exit_with_error(error_msg):
    sys.stderr.write("ERROR: %s\n" % error_msg)
    sys.exit(1)

def move_mouse(x, y):
    type_keys("xdotool mousemove %d %d" % (x, y))

def create_terminal():
    send_keys("ctrl+alt+t")

def create_tab():
    send_keys("ctrl+shift+t")

def send_keys():
    # TODO
    pass

def type_keys():
    # TODO
    pass

if __name__ == "__main__":
    # Verify that prepare script exists
    if not os.path.isfile(PREP_SCRIPT_NAME):
        exit_with_error("%s not found." % PREP_SCRIPT_NAME)

    cwd = os.getcwd()

    input("Close all unnecessary windows in this workspace then press RETURN to begin workspace setup.")

    eval("import %s" % PREP_SCRIPT_NAME)
