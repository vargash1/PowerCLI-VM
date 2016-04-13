#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Author: Vargas Hector <vargash1>
# @Date:   Tuesday, April 12th 2016, 3:47:16 pm
# @Email:  vargash1@wit.edu
# @Last modified by:   vargash1
# @Last modified time: Wednesday, April 13th 2016, 11:05:06 am
import os
import sys
import curses
import subprocess
from curses import wrapper

class VMPowerCLI:

    def __init__(self):
        self.stdscr = None

    def initCurses(self):
        wrapper(self.handleCurses)

    """
    Handles curses after initializing
    """
    def handleCurses(self,stdscr):
        sys.stdout.flush()
        self.stdscr = stdscr

        curses.curs_set(0)
        curses.cbreak()
        curses.echo()
        while True:
            self.cursesMenu()
            status = self.getKeystroke()
            if status == "submit":
                break
            elif status == "end":
                sys.exit("User has exited ncurses")
                break
            else:
                continue
        curses.endwin()
        self.powershellTemplate()

    """
    Formats a menu onto the terminal screen
    """
    def cursesMenu(self):
        self.stdscr.clear()
        self.stdscr.border(0)
        self.stdscr.addstr(2, 2, "POWERCLI with Curses FeelsGoodMan")
        # ip, storage size, host name, datastore, storage amount
        self.stdscr.addstr(4, 4, "1 - Configure(Such as IP, OS, Storage Size, Host Name)")
    	self.stdscr.addstr(5, 4, "2 - Launch VM")
    	self.stdscr.addstr(6, 4, "3 - Show current Configuration")
        self.stdscr.addstr(7, 4, "4 - Deploy by predefined template")
        self.stdscr.addstr(8, 4, "5 - Exit")
        self.stdscr.refresh()

    """
    Read a single keystroke from user untill it is a valid menu option
    """
    def getKeystroke(self):
        useropt = self.stdscr.getch()


        if useropt == ord('1'):
            ipnum = self.getConfig("Enter the IP")
            ostype = self.getConfig("Enter the OS type")
            strsize = self.getConfig("Enter the storage size to use")
            hstnme = self.getConfig("Enter the host name to use")
            dstore = self.getConfig("Enter the datastore to use")
            return useropt
        if useropt == ord('3'):
            return "cont"
        if useropt == ord('2'):
            return "submit"
        if useropt == ord('4'):
            return "submit"
        if useropt == ord('5'):
            return "end"

    def powershellTemplate(self):
        scriptpath = os.path.join(os.path.dirname(__file__),"data","launchvm.ps1")
        print scriptpath
        retval = subprocess.call(["powershell.exe",scriptpath])
        print retval


def main():
    print os.getcwd()
    test = VMPowerCLI()
    test.initCurses()




if __name__ == "__main__":
    main()
