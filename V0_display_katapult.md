##  V0 Display katapult deployment:

This manual is a reference for using katapult on a V0 screen so you don't have to put in in DFU-mode manually.

Put the V0 display in DFU-mode and check with:

-`lsusb'

### Flashing katapult:

-`cd ~/katapult/

-`make menuconfig KCONFIG_CONFIG=config.display` (make a menuconfig using presets for the dispaly)
I use KCONFIG_CONFIG to make presets for MCU's. This is an easy of life hack so you don't have to reconfigure your presets for building firmware between MCU's.
After setting it once, you can use it to compile the software without having to set it again.

![alt text](https://github.com/GreenPlasticWaterCan/Voron_V0.2/blob/main/images/settings_V0_display.png)

-`make clean KCONFIG_CONFIG=config.display` (Clean cache)

-`make KCONFIG_CONFIG=config.display` (compile firmware with the config.display settings)

-`make KCONFIG_CONFIG=config.display`(make firmware using config.screen presets)

-`make flash KCONFIG_CONFIG=config.display FLASH_DEVICE=<device-id>` (this is usually for me: 0483:df11

The V0 display has now been flashed with the katapult bootloader.
I've found that the display will struggle to get into the bootloader, so leave it in DFU for now.
After flashing klipper this will be fixed.

### Flashing klipper:

-`cd ~/klipper/`

-`make menuconfig KCONFIG_CONFIG=config.display` (make a menuconfig using the presets for the display)

![alt text](https://github.com/VoronDesign/Voron-Hardware/blob/master/V0_Display/Images/Menuconfig_Base_Options.png)

Make sure to set the optional settings too:
![alt text](https://github.com/VoronDesign/Voron-Hardware/blob/master/V0_Display/Images/Menuconfig_Optional_Options.png)

-`make clean KCONFIG_CONFIG=config.display` (clean cache) 

-`make KCONFIG_CONFIG=config.display` (compile the klipper firmware with the config.display settings)

-`lsusb` (check if the display is still in DFU and it's device id)

-`make flash KCONFIG_CONFIG=config.display device=<device-id)` 

Remove the jumper and reset the display. Run `lsusb` to check if it's out of dfu.

### Updating the V0 display over katapult

-`cd ~/klipper/`

-`make clean KCONFIG_CONFIG=config.display` (clean cache) 

-`make KCONFIG_CONFIG=config.display` (compile the klipper firmware with the config.display settings)

-`ls /dev/serial/by-id/` (check for the new USB-id.

-`make flash KCONFIG_CONFIG=config.dispay device=/dev/serial/by-id/<device-id>`

After this it should be updated.
