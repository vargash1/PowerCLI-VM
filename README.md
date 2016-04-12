<!--
@Author: Vargas Hector <vargash1>
@Date:   Tuesday, April 12th 2016, 3:35:35 pm
@Email:  vargash1@wit.edu
@Last modified by:   vargash1
@Last modified time: Tuesday, April 12th 2016, 6:48:30 pm
-->

#Launching VM's using PowerShell Scripts
This was a project for my data center class. The idea was to use a curses interface made in python and be able to use it in PowerShell. The user will be able to pass parameters such as
ip address, datacenter, hostname, e.t.c.


###Requirements
It's best to install this script under a directory owned by the user, in order for it to have access to the scripts without having to use sudo.

```bash
    mkdir ~/lib/python
    # Add this line to your ~/.bashrc
    # Replace user with your username
    export PYTHONPATH="/home/user/lib/python"
    source ~/.bashrc
```

###Install
```bash
    git clone git@github.com:vargash1/PowerCLI-VM.git
    python setup.py install --home=~

```
