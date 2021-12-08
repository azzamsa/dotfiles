#!/bin/python
# -*- coding: utf-8 -*-

"""
Simple Fetch (sfetch)
~~~~~~~~~~~~~~~~~~~~~
It is a simple fetch that written in pure Python without any external dependencies.

I tend to use it to copy and paste my sistem information for bug reporting.

Usage:

Just run it as normal executable file:

.. code-block:: console
   ./sfetch

Example output:
    ❯ ./sfetch
    OS: Debian GNU/Linux 11 (bullseye)
    CPU: Intel(R) Core(TM) i7-8565U CPU @ 1.80GHz
    Memory: 15893512 kB
    Emacs version: GNU Emacs 29.0.50 (build 1, x86_64-pc-linux-gnu, GTK+ Version 3.24.24, cairo version 1.16.0) of 2021-11-30

"""

import subprocess


def shell(command):

    process = subprocess.Popen(command, stdout=subprocess.PIPE)
    # output, error = process.communicate()
    return process.communicate()


def read_lines(filename):
    with open(filename) as f:
        content = f.readlines()
    return content


def emacs_version():
    command = ["emacs", "--quick", "--batch", "--eval", "(print (version))"]
    raw_output, _ = shell(command)
    output = raw_output.decode("utf-8").replace('"', "").split()
    return f"Emacs version: {' '.join(output)}"


def os_version():
    command = ["lsb_release", "-d"]
    raw_output, _ = shell(command)
    output = raw_output.decode("utf-8").replace('"', "").split()[1:]
    return f"OS: {' '.join(output)}"


def cpu():
    content = read_lines("/proc/cpuinfo")
    for line in content:
        if "model name" in line:
            model_name = line
            break
    model_name_list = model_name.split()[3:]
    return f"CPU: {' '.join(model_name_list)}"


def memory():
    content = read_lines("/proc/meminfo")
    for line in content:
        if "MemTotal" in line:
            memory_total = line
            break
    memory_total_list = memory_total.split()[1:]
    return f"Memory: {' '.join(memory_total_list)}"


print(os_version())
print(cpu())
print(memory())
print(emacs_version())
