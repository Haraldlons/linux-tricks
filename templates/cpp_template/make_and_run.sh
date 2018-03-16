#!/bin/bash

if g++ -o execute.out  main.cpp; then
    echo "========== Compilation successfull =========="
    echo "==========    Running program      =========="
    echo
    ./execute.out
else
    echo "Compilation failed. Please resolve issues"
fi
