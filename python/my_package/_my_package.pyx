from _my_package cimport c_add

def add(a, b):
    return c_add(a, b)
