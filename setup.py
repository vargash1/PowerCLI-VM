#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Author: Hector Vargas
# @Date:   2016-01-20 13:29:33
# @Email:  vargash1@wit.edu
# @Name :  Vargas, Hector
# @Last modified by:   vargash1
# @Last modified time: Tuesday, April 12th 2016, 3:41:28 pm
import os
from setuptools import setup

# Utility function to read the README file.
def read(fname):
    return open(os.path.join(os.path.dirname(__file__), fname)).read()

setup(
    name = "powercliVM",
    version = "2.0.0",
    author = "Hector Vargas",
    author_email = "vargash1@wit.edu",
    description = ("powercliVM"),
    license = "MIT",
    url = "https://github.com/vargash1/PowerCLI-VM",
    packages = ['powercliVM'],
    package_dir = {'powercli':'powercli'},
    package_data = {'powercli': ['data/*.ps1']},
    long_description = read('README.md'),
    # entry_points = {
    # 'console_scripts': [
    #     'arithcli=arithmos.arithcli:main',
    # ],
# },
)
