Voron 0.2 

Siboor Kit Aug 2023

Mainboard: Octopus V1.1 

SBC: BTT Pi V1.1

Toolhead board: EBB36

Extruder: Galileo 2

Power: 24Vdc

Motors

Extruder:

A/B:

Z:

# Steps to updating Trident

-`sudo service klipper stop` (stop klipper)

## Update MCU:

-`make menuconfig KCONFIG_CONFIG=config.mcu` (make menuconfig using the main controller presets, only need to be done the first time)

-`make clean KCONFIG_CONFIG=config.mcu`

-`make KCONFIG_CONFIG=config.mcu`(make firmware using config.mcu presets)

-`ls /dev/serial/by-id` (optional to query USB-id)

-`make flash KCONFIG_CONFIG=config.mcu FLASH_DEVICE=/dev/serial/by-id/usb-Klipper_stm32f446xx_31000F001750535556323420-if00` (flash over USB)

## Update V0 Display:

-`make menuconfig KCONFIG_CONFIG=config.screen` (make menuconfig using the main controller presets, only need to be done the first time)

-`make clean KCONFIG_CONFIG=config.screen`

-`make KCONFIG_CONFIG=config.screem`(make firmware using config.screen presets)

-`make flash KCONFIG_CONFIG=config.screen FLASH_DEVICE=/dev/serial/by-id/usb-Klipper_stm32f042x6_2D0032001943304846333520-if00`

alternative:
-`make flash FLASH_DEVICE=/dev/serial/by-id/usb-Klipper_stm32f042x6_2D0032001943304846333520-if00`

## Update toolhead:

-`make menuconfig KCONFIG_CONFIG=config.toolhead` (make menuconfig using the toolhead presets)

-`make clean KCONFIG_CONFIG=config.toolhead`

-`make KCONFIG_CONFIG=config.toolhead` (make config using config.toolhead presets)

-`python3 ~/katapult/scripts/flashtool.py -i can0 -u 568250c2b5fa -r` (Put Toolhead into bootloader/katapult)

-`python3 ~/katapult/scripts/flashtool.py -q` (query CANbus UUID)

-`python3 ~/katapult/scripts/flashtool.py -i can0 -u 568250c2b5fa -f ~/klipper/out/klipper.bin` (flash firmware over CANbus)

-`Sudo service klipper start` (start klipper)
