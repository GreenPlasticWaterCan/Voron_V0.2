##  V0 Display katapult deployment:

This manual is a reference for using katapult on a V0 screen so you don't have to put in in DFU-mode manually.

Flashing katapult:

-`cd ~/katapult/`

-`make menuconfig KCONFIG_CONFIG=config.display` (make a menuconfig using presets for the dispaly)
I use KCONFIG_CONFIG to make presets for MCU's. This is an easy of life hack so you don't have to reconfigure your presets for building firmware between MCU's.
After setting it once, you can use it to compile the software without having to set it again.

![alt text](https://github.com/GreenPlasticWaterCan/Voron_V0.2/blob/main/images/settings_V0_display.png)

-`make clean KCONFIG_CONFIG=config.display` (Clean cache)

-`make KCONFIG_CONFIG=config.display` (compile firmware with the config.display settings)


-`make menuconfig KCONFIG_CONFIG=config.screen` (make menuconfig using the display presets, only need to be done the first time)

-`make clean KCONFIG_CONFIG=config.screen`

-`make KCONFIG_CONFIG=config.screem`(make firmware using config.screen presets)

-`make flash KCONFIG_CONFIG=config.screen FLASH_DEVICE=/dev/serial/by-id/usb-Klipper_stm32f042x6_2D0032001943304846333520-if00`

alternative:
-`make flash FLASH_DEVICE=/dev/serial/by-id/usb-Klipper_stm32f042x6_2D0032001943304846333520-if00`
