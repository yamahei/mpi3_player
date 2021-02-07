# -*- coding: utf-8 -*-

# 【参考】GPIOエッジ検出コールバック関数
# https://tomosoft.jp/design/?p=8685

import time
import subprocess
import RPi.GPIO as GPIO

GPIOPIN = 14
CMD = 'sudo /opt/mpi3/bin/mpi3_skip.sh /home/pi/Music'

def event_callback(gpio_pin):
    res = subprocess.check_call(CMD) #TODO: handling?

GPIO.setmode(GPIO.BCM)
GPIO.setup(GPIOPIN, GPIO.IN)
GPIO.add_event_detect(GPIOPIN, GPIO.RISING, callback=event_callback, bouncetime=200)

try:
    while True:
        time.sleep(1)
# except KeyboardInterrupt:
#     print '\nbreak'
#     GPIO.remove_event_detect(GPIOPIN)
#     GPIO.cleanup()