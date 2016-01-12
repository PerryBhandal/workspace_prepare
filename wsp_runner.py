import os
import sys
import time
import subprocess

PREP_SCRIPT_NAME = "wsprepare.py"
SLEEP_TIME = 1 # Time in seconds to sleep after a command, mouse move or key press.

SNAP_MAPS = {"left": "alt+Left",
             "right": "alt+Right",
             "top": "alt+Up",
             "bottom": "alt+Down",
             "top-left": "shift+alt+f1",
             "bottom-left": "shift+alt+f2",
             "top-right": "shift+alt+f3",
             "bottom-right": "shift+alt+f4"
             }

def exit_with_error(error_msg):
    sys.stderr.write("ERROR: %s\n" % error_msg)
    sys.exit(1)

def move_mouse(x, y):
    run_command("xdotool mousemove %d, %d" % (x, y))

def create_terminal():
    send_keys("ctrl+alt+t")

def create_tab():
    send_keys("ctrl+shift+t")

def send_keys(to_send):
    run_command("xdotool key \"%s\"" % to_send)

def type_in(to_type):
    run_command("xdotool type %s" % to_type)

def type_in_enter(to_type):
    type_in(to_type)
    send_keys("Return")

def run_command(to_run):
    print("Sending command: %s" % to_run)
    split_command = to_run.split(" ")

    assert len(split_command) >= 1

    if len(split_command) > 1:
        subprocess.call(to_run)
    else:
        subprocess.call(split_command)

    time.sleep(SLEEP_TIME)

def snap_window(place):
    assert place in SNAP_MAPS.keys()
    send_keys(place)
