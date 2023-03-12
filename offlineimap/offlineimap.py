#!/usr/bin/python3

import os


def get_password(name):
    val = os.popen(
        "/usr/bin/op item get \"{}\" --fields label=password".format(name)).read()
    val = val[:-1]  # remove trailing newline
    return val


def get_username(name):
    val = os.popen(
        "/usr/bin/op item get \"{}\" --fields label=username".format(name)).read()
    val = val[:-1]  # remove trailing newline
    return val


def get_hostname(name):
    val = os.popen(
        "/usr/bin/op item get \"{}\" --fields label=host".format(name)).read()
    val = val[:-1]  # remove trailing newline
    return val
