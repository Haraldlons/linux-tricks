#!/bin/bash
# Will set the sensitivity of your razer mouse

sensitivity=7

xinput --list | grep Razer
read -p "Id of Razer mouse? (If no print, do it manually): " id

xinput set-prop $id "Device Accel Constant Deceleration" $sensitivity
echo "Set Razer mouse sensitivity to: '"$sensitivity"'"
