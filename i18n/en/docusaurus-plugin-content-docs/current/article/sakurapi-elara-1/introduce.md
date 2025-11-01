---
sidebar_position: 1
title: Brief
sidebar_label: Brief
---

# Introduction

Sakura Pi Elara 1 is a heterogeneous development board equipped with an Arm® Cortex-M7 MCU and a Gowin GW2A-LV18 FPGA.  
With the open-source Elarion interactive terminal, it can easily run MicroPython and custom open-source programs.  

It also supports low-threshold development, IP verification, and testing through the STM32 CubeIDE/CubeMX development suite.

:::info
Board photos to be added.
:::

### Features

The basic specifications of Sakura Pi Elara 1 are as follows:
- **MCU**: STM32H750XBH6 (Arm® Cortex-M7)
- **FPGA**: Gowin GW2A-LV18 PG256C
- **Power Management**: AXP221s
- **Networking**: RTL8201F 10Mbps/100Mbps PHY
- **GPIO (STM32 side)**: Compatible with Raspberry Pi RPi 5 (UART/SPI&QSPI/UART/I2C) and extensions (SPI/I2S/SPDIF/DAC/SWDIO)
- **GPIO (FPGA side)**: IO Banks 2/3/6/7, with Banks 6/7 supporting voltage adjustment and external Vref
- **LCD**: RGB888 interface

The board also includes onboard JTAG, CYUSB3014, differential ADC, HDMI output, two control buttons, and Micro SD card support.

### Processor
The onboard STM32H750XBH6 features a Cortex-M7 MCU and MPU with a maximum frequency of 480 MHz,  
up to 1 MB of on-chip SRAM, cache technology (L1 I-Cache / D-Cache), and a hardware double-precision floating-point unit.

![stm32h750xbh6-diagram.jpg](./img/stm32h750xbh6-diagram.jpg)

You can find more information on [this page](https://www.st.com/en/microcontrollers-microprocessors/stm32h750xb.html).

### Field Programmable Gate Array (FPGA)

The Gowin GW2A-LV18 FPGA features 20K LUT, 40K SSRAM, and 828K BSRAM.

As a key feature of the Elara development board family, Sakura Pi Elara 1 is equipped with the Gowin GW2A-LV18 FPGA,  
which can flexibly load bitstream files through the STM32 or be programmed online via USB using the onboard JTAG debugger.  
It natively supports the Gowin IDE, fully leveraging the flexibility of heterogeneous systems.

:::info fmcapb3 Repository
https://github.com/Sakura-Pi/fmcapb3
:::

The FPGA is connected to the STM32 via the FMC bus, which provides up to 32-bit data memory width and 26-bit address addressing capability.  
We offer the open-source `fmcapb3` bridge IP, making it easy to achieve seamless integration between the STM32 and standard IP cores.

![fmcapb3-diagram](https://raw.githubusercontent.com/Sakura-Pi/fmcapb3/refs/heads/main/img/diagram.drawio.svg)

Additionally, IO BANK 6 and IO BANK 7 support dynamic voltage adjustment via the PMIC and external Vref.

### Pin Definitions
:::info
Pin definitions to be added.
:::

### Benchmarking
:::info
Benchmark data to be added.
:::
