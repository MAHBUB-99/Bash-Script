Bash Scripting Complete Essentials

This file contains essential Bash scripting commands, logic, and tools for writing effective shell scripts.

----------------------------------------

1. Basics

```bash
#!/bin/bash        # Shebang: defines the script interpreter

echo "Hello World" # Print text

# Comments start with #
```
----------------------------------------

2. Variables

```bash
name="John Doe"        # Assign variable (no spaces around '=')
echo "$name"           # Use variables with $

readonly PI=3.1415     # Make variable read-only
unset name             # Remove variable
```

----------------------------------------

3. Input / Output

```bash

read -p "Enter your name: " user_name   # Read input

echo -n "Enter your age: "               # Print without newline
read age

echo "Name: $user_name, Age: $age"

printf "Hello, %s. You are %d years old.\n" "$user_name" "$age"  # Formatted output
```

----------------------------------------

4. Control Flow

If-Else:
```bash

if [[ $age -ge 18 ]]; then
  echo "Adult"
elif [[ $age -lt 18 && $age -ge 13 ]]; then
  echo "Teenager"
else
  echo "Child"
fi
```

Case:

```bash

case $choice in
  start) echo "Starting";;
  stop) echo "Stopping";;
  restart) echo "Restarting";;
  *) echo "Invalid option";;
esac
```

----------------------------------------

5. Loops

For loop:
```bash

for i in {1..5}; do
  echo "Number $i"
done

for file in *.sh; do
  echo "Script: $file"
done
```

While loop:
```bash

count=1
while [[ $count -le 5 ]]; do
  echo "Count: $count"
  ((count++))
done
```

Until loop:
```bash

count=1
until [[ $count -gt 5 ]]; do
  echo "Count: $count"
  ((count++))
done
```

----------------------------------------

6. Functions

```bash
function greet() {
  echo "Hello, $1!"
}

greet "Alice"  # Call function with argument
```
Return values from functions using 'return' (status) or 'echo' (output).


----------------------------------------

7. String Operations

```bash
str="Hello, Bash scripting!"
```
Length:
```bash
echo "${#str}"
```
Substring extraction:
```bash
echo "${str:7:4}"         # Outputs "Bash"
```
Replace first occurrence:
```bash
echo "${str/Bash/Shell}"
```
Replace all occurrences:
```bash
echo "${str//i/I}"
```
Check if string contains substring:
```bash
if [[ "$str" == *"Bash"* ]]; then
  echo "Found Bash"
fi
```
Trim whitespace:
```bash
trimmed="$(echo -e "$str" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"
```

----------------------------------------

8. Arrays
```bash

arr=(apple banana cherry)
```
Access:
```bash

echo "${arr[1]}"          # banana
```
Length:
```bash

echo "${#arr[@]}"         # 3
```
Loop over array:
```bash

for item in "${arr[@]}"; do
  echo "$item"
done
```

----------------------------------------

9. File and Directory Handling

Test if file exists and is regular file:
```bash

if [[ -f "file.txt" ]]; then
  echo "File exists"
fi
```
Test if directory exists:
```bash

if [[ -d "/path/to/dir" ]]; then
  echo "Directory exists"
fi
```
Create directory:
```bash

mkdir -p /tmp/mydir
```
Copy, move, remove files:
```bash
cp source.txt destination.txt
mv oldname.txt newname.txt
rm -f file.txt
```
Read file line by line:
```bash

while IFS= read -r line; do
  echo "$line"
done < file.txt
```

----------------------------------------

10. Process Management

Run command in background:

```bash
sleep 60 &

```
Get process ID of last background job:

```bash
pid=$!

```
Wait for process to finish:

```bash
wait $pid

```
Kill process by PID:

```bash
kill -9 $pid
```

----------------------------------------

11. Debugging & Error Handling

Enable debugging:
```bash

set -x
```
Disable debugging:
```bash

set +x
```
Exit script on error:
```bash

set -e
```
Trap signals for cleanup:
```bash

trap 'echo "Script interrupted."; exit 1' SIGINT SIGTERM
```
Check exit status of last command:
```bash

if [[ $? -ne 0 ]]; then
  echo "Previous command failed."
fi
```
Logging function:
```bash

log() {
  echo "$(date +"%F %T") - $*"
}

log "Script started"
```

----------------------------------------

12. Useful Tips & Tricks

- Quote variables: "$var" to prevent word splitting and glob expansion  
- Use [[ ... ]] for safer tests than [ ... ]  
- Use $(...) instead of backticks for command substitution  
- Always start scripts with #!/bin/bash  
- Use chmod +x script.sh to make scripts executable  
- Use getopts for command-line argument parsing  
- Use cron for scheduling tasks  
- Use sed and awk for advanced text processing  
- Write portable scripts but note some Bash features may not work in plain sh  

----------------------------------------

Example: Simple Backup Script

```bash
#!/bin/bash

src_dir="/home/user/documents"
backup_dir="/home/user/backup"
date=$(date +"%Y%m%d_%H%M%S")

mkdir -p "$backup_dir"
tar -czf "$backup_dir/backup_$date.tar.gz" "$src_dir"

echo "Backup created at $backup_dir/backup_$date.tar.gz"
```

----------------------------------------


13.**🔐 Understanding sudo**


***What is sudo?***

sudo stands for "superuser do". It allows a permitted user to run commands with elevated privileges (typically as the root user). This is essential for performing administrative tasks on Unix-like systems.

----------------------------

***Why Use sudo?***

You use sudo to:

- Install or remove software
```bash
  sudo apt install nginx
```
- Modify system configurations
```bash
  sudo nano /etc/hosts
```
- Restart services
```bash
  sudo systemctl restart ssh
```

It’s a safer alternative to logging in directly as root, offering controlled and temporary administrative access.

----------------------------

***How It Works***

When you run a command with sudo:

1. The system checks if your user is allowed to use sudo.
2. You're prompted to enter your own password (not the root password).
3. The command executes with root-level privileges.
4. Your session remains cached for a short time, avoiding repeated prompts.

----------------------------

Example:
```bash
  sudo apt update
  sudo apt install curl
```
----------------------------

***⚠️ Use with Caution***

- sudo gives you complete system access — use it carefully.
- A single mistyped command (e.g. sudo rm -rf /) can destroy your system.

----------------------------

***Tips:***

- To become root temporarily:
```bash
    sudo -i
```
- To check your sudo permissions:
```bash
    sudo -l
```

- To add a user to the sudo group (as root):
```bash
    usermod -aG sudo username
```

----------------------------

***Related File:***

- /etc/sudoers — Configuration file for sudo access  Always edit it using:
```bash
    sudo visudo
```

Happy scripting! 🚀
