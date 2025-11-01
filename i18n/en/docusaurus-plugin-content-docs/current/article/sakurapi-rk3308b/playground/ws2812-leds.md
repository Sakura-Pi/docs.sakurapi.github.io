---
id: ws2812-leds
title: Light Up the Onboard WS2812 LEDs
---

:::info Difficulty Level ★★★☆☆
:::

:::tip Chapter Tip
This chapter will guide you on how to light up the onboard WS2812 LEDs using `spidev` or our kernel driver.
:::

<!-- truncate -->

## Introduction

### Glossary
| Term | Explanation |
| -- | -- |
| spidev | SPI device |

### Summary
The Sakura Pi RK3308B comes with 4 compact WS2812 LEDs onboard. They can be used for error warnings, heartbeat indicators, HDD read/write status, or even simple animations.  
However, due to the unique protocol of WS2812, Linux has not yet provided an official kernel driver for WS2812. Therefore, we need to manually add support for them.

:::tip Protocol Specificity
The specificity refers to the lack of widely used hardware or circuit IP cores specifically designed for WS2812. The SPI's MOSI (Master Out Slave In) can be misused as a programmable waveform generator with the appropriate frequency, making it suitable for driving various protocol timings, even though it was not originally designed for WS2812.
:::

The WS2812's `DIN` *(Data In)* is connected to the RK3308B's SPI MOSI interface. To light them up, you only need to write a compliant SPI kernel driver or use Python to output via `spidev` in user space.  

Of course, you can also use your preferred programming language to program `spidev` and light them up.

## WS2812 Communication Protocol

:::tip If you want to light it up immediately, skip to the [Proprietary Kernel Driver](#proprietary-kernel-driver) section.
:::

WS2812 uses a simple three-phase serial communication protocol.  
:::info TODO: Detailed explanation of the WS2812 protocol specification.
:::

## Proprietary Kernel Driver

:::info GitHub Repository
https://github.com/Sakura-Pi/ws2812-vleds
:::

We have written a kernel driver to support WS2812. It uses the device tree to describe the color, position, function, and binding, allowing us to use WS2812 as regular LEDs with simple and flexible features.  
This driver can drive not only the onboard WS2812 but also WS2812 LED strips or matrices.  

However, note that this driver is not suitable for using WS2812 as a display screen.

### Configuring the dtbo

The `dtso` is located in the Armbian mainline repository and is automatically compiled into `dtbo` and placed in the `/boot/dtb/rockchip/overlay` directory by default. **If you want to use it directly, add `sakurapi-rk3308b-ws2812` to the `overlays` line in `/boot/armbianEnv.txt` (add the line if it doesn't exist).**

![Snipaste_2025-05-14_21-11-28.jpg](./ws2812-leds/Snipaste_2025-05-14_21-11-28.jpg)

Reboot and check the u-boot output.  
![Snipaste_2025-05-14_21-55-28.jpg](./ws2812-leds/Snipaste_2025-05-14_21-55-28.jpg)

If you need to customize the `dtso`, for this development board, you can write it as follows or refer to:  
https://github.com/Sakura-Pi/build/blob/main/patch/kernel/archive/rockchip64-6.14/overlay/rockchip-sakurapi-rk3308b-ws2812.dtso

<details>
  <summary>rockchip-sakurapi-rk3308b-ws2812.dtso</summary>
```dts
/ {
    fragment@0 {
        target = <&spi1>;
        __overlay__ {

            status = "okay";

            ws2812@0 {
                compatible = "ws2812-vleds";
                reg = <0>;

                // SPI clock speed
                spi-max-frequency = <6750000>;

                leds {

                    // User-defined
                    ws_led3: vled3 {
                        label = "ws-led3";
                        default-state = "off";
                        color-value = "#69b3f2";
                    };

                    // User-defined
                    ws_led2: vled2 {
                        label = "ws-led2";
                        default-state = "off";
                        color-value = "#9376c8";
                    };

                    // User-defined
                    ws_led1: vled1 {
                        label = "ws-led1";
                        default-state = "off";
                        color-value = "#b66bc3";
                    };

                    // User-defined default function mmc1 read/write state
                    // mmc1(emmc) r/w state
                    ws_led0: vled0 {
                        label = "ws-led0";
                        default-state = "on";
                        linux,default-trigger = "mmc1";
                        color-value = "#eb698f";
                    };

                };
            };
        };
    };
};

```
</details>

### Compiling the Kernel Driver
Clone the entire Git repository using the command:
```bash
git clone https://github.com/Sakura-Pi/ws2812-vleds --depth 1
```
Enter the `ws2812-vleds` directory and execute the following commands to configure the driver features:

```bash
$ export CONFIG_WS2812_VLEDS=m
$ export CONFIG_WS2812_VLEDS_CHANNEL_CONTROL=y
```

Here, `CONFIG_WS2812_VLEDS=m` compiles the driver as a kernel module, and `CONFIG_WS2812_VLEDS_CHANNEL_CONTROL=y` enables channel control functionality: if this option is enabled, the driver will generate virtual LEDs for red, green, and blue, allowing you to control the WS2812 LED colors directly via command line or scripts.

Next, compile and `insmod` the module. After that, you can see the WS2812 virtual LED devices using the command:

```bash
$ make
make -C /lib/modules/6.12.23-current-rockchip64/build M=/root/ws2812-vleds modules
make[1]: Entering directory '/usr/src/linux-headers-6.12.23-current-rockchip64'
  CC [M]  /root/ws2812-vleds/src/main.o
In file included from /root/ws2812-vleds/src/main.c:12:
  LD [M]  /root/ws2812-vleds/ws2812-vleds.o
  MODPOST /root/ws2812-vleds/Module.symvers
  CC [M]  /root/ws2812-vleds/ws2812-vleds.mod.o
  CC [M]  /root/ws2812-vleds/.module-common.o
  LD [M]  /root/ws2812-vleds/ws2812-vleds.ko
make[1]: Leaving directory '/usr/src/linux-headers-6.12.23-current-rockchip64'

Install the kernel module:
$ sudo insmod ws2812-vleds.ko

# Check devices
$ ls /sys/class/leds/
```

:::warning Notes
If `make` throws the following error, it means you are missing the `linux-headers` package.  
Without the kernel headers, the kernel module cannot be compiled.

make -C /lib/modules/6.12.20-current-rockchip64/build M=/root/ws2812-vleds modules  
make[1]: *** /lib/modules/6.12.20-current-rockchip64/build: No such file or directory.  Stop.  
make: *** [Makefile:8: all] Error 2
:::

If everything works correctly, it should look like this:  
![Snipaste_2025-05-14_21-59-17.jpg](./ws2812-leds/Snipaste_2025-05-14_21-59-17.jpg)

### Command Line Testing
:::warning Notes
~~WS2812 LEDs are much brighter than regular LEDs. Be careful not to hurt your eyes.~~
:::

```bash
echo 255 > /sys/class/leds/<your LED device name>/brightness
```

## Using the spidev Driver

:::info TODO
Python examples to be completed.
:::