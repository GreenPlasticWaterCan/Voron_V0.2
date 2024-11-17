#!/bin/bash
set -euo pipefail
#This is a bash script to automatically update all MCU's. This needs to be changed to each specific printer. It also uses KCONFIG_CONFIG tha>

#Stop klipper services
echo 'Shutting down Klipper'
sudo service klipper stop
sleep 1

#Updating the main controller board
#Clean previous firmware  files
echo 'cleaning old mainboard firmware config'
make clean KCONFIG_CONFIG=config.mcu
sleep 1

#Make new firmware  file
echo 'Building mainboard firmware'
make KCONFIG_CONFIG=config.mcu
sleep 1

#Flash new firmware over USB
echo 'Flashing mainboard firmware'
make flash KCONFIG_CONFIG=config.mcu FLASH_DEVICE=/dev/serial/by-id/usb-Klipper_stm32f446xx_31000F001750535556323420-if00
sleep 1

#Updating the toolhead board
#Clean previous config files
echo 'cleaning old toolhead firmware config'
make clean KCONFIG_CONFIG=config.toolhead
sleep 1

#Make new firmware files
echo 'Building toolhead firmware'
make KCONFIG_CONFIG=config.toolhead
sleep 1

#Put toolhead into Katapult-bootloader to be able to flash over CANBus
echo 'Putting toolhead into bootloader'
python3 ~/katapult/scripts/flashtool.py -i can0 -u 568250c2b5fa -r
sleep 1

#Flash the new firmware over CANBus to the toolhead
echo 'Flashing Toolhead firwmare'
python3 ~/katapult/scripts/flashtool.py -i can0 -u 568250c2b5fa -f ~/klipper/out/klipper.bin
sleep 1

#Updating the Display
#Clean previous config files
echo 'cleaning old Display firmware config'
make clean KCONFIG_CONFIG=config.display
sleep 1

#Make new firmware files
echo 'Building Display firmware'
make KCONFIG_CONFIG=config.display
sleep 1

#Flash new firmware over USB
echo 'Flashing display'
make flash KCONFIG_CONFIG=config.mcu FLASH_DEVICE=/dev/serial/by-id/usb-Klipper_stm32f042x6_2D0032001943304846333520-if00
sleep 1

#Restart klipper services
sudo service klipper start
echo 'Starting Klipper'
sleep 1
