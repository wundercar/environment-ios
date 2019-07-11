#!/usr/bin/env python3
# -*- coding: utf-8 -*-


### ---------------------------
### Vicente Crespo Penadés
### 2018
### ---------------------------



### ------------------
### Imports and pipes
### ------------------

import os
import sys
import subprocess
# Make sure to execute in a terminal 
# export PYTHONIOENCODING=UTF-8
import time
import argparse

### ------------------
### Parameters
### ------------------
defaultCodePath = '../Carpool'
defaultConfigFilePath = '../.swiftformat'

parser = argparse.ArgumentParser(description = 'Unifies code style')
parser.add_argument('-p', '--path',
					action = 'store',
					dest = 'codePath',
					default = defaultCodePath,
                    help = 'Path to main code folder')

parser.add_argument('-c', '--config',
					action = 'store',
					dest = 'configFilePath',
					default = defaultConfigFilePath,
                    help = 'File path to configuration file')

args = parser.parse_args()

### ------------------
### Autoformat
### ------------------
print("Autoformatting...")
start = time.time()
command = 'swiftformat %s --config %s' % (args.codePath, args.configFilePath)
os.system(command)
end = time.time()
print("Time to autoformat: %.2f seconds" % (end - start))


### ------------------
### Cleanup if needed
### ------------------
print("Cleaning...")


print("")
print(" The code swag train has arrived ")
print("")

