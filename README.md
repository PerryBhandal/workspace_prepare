# workspace_prepare

Motivation: Currently I manually prepare my workspace when I begin coding. I tend to switch between my desktop and laptop a lot, and it takes me a minute or two each time I make that swich to prepare my terminal and window layout. WorkspacePrepare is a DSL that allows the process to be scripted.

Usage
---

After installing WorkspacePrepare create a wsprepare.py file in the directory from which you wish to prepare your workspace. Call wsprepare from that directory and it will run through the preparation tasks specified in prepare.wsp (examples below).

Requirements
---
- Python (should work on both Python 2 and Python 3).
- xdotool

Example 1: Flask Development
---

When developing in Flask I keep two terminals open, one terminal has three tabs which run without interruption (Flask, sniffer and guard) and the other is a terminal I use for doing commits which should begin with its cwd set to the project's root. All terminals in this case exist within a virtualenv, so the virtualenv needs to be activated before calling Flask, sniffer, etc. Here is what wsprepare.py looks like for the above case:

prep_tasks = ["source venv/bin/activate"] # Commands contained within are run each time a new terminal window or terminal tab is opened. The cwd of the terminal is set to the location of wsprepare.py, so you only need to set the cwd if you need a different behavior.

move_mouse(0,0) # Moves the mouse to 0,0 so the terminal is spawned in my leftmost window.

create_terminal()
send_command("python server.py")

create_tab()
send_command("guard")

create_tab()
send_command("sniffer")

send_keys("shift+alt+F3") # Snaps window to top right of containing screen with its height and width set to 50%.

next_tab() # Returns focus to the first terminal tab as that's what has the most important feedback as I develop.

create_terminal() # Creating a second, separate terminal.

send_keys("shift+alt+F4") # Snaps window to bottom right of containing screen with its height and width set to 50%.

Example 2: Java Development (Console application using Maven)
---

move_mouse(0, 0)

create_terminal()
send_command("./run_app.sh")

create_tab()
send_command("sniffer")

next_tab()
send_keys("shift+alt+F3")

create_terminal()
send_keys("shift+alt+F4")
