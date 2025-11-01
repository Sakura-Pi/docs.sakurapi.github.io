---
id: voron-klipper
title: Klipper Host
---

:::info Difficulty Level ★★☆☆☆
:::

:::tip Chapter Tip
This chapter will guide you on how to use the Sakura Pi RK3308B as a Klipper host.
:::

<!-- truncate -->

## Introduction

### Glossary
None

### Summary
Such a compact Linux development board with a display capability seems perfect for a Klipper host, doesn't it?  
If you have a Voron 2.4, why not give it a try?

## Kiauh Installation and Configuration
### Installation and Configuration
Flash the latest Armbian image onto the Sakura Pi RK3308B and boot it up. Connect to WiFi.  
Run the following commands to install the required packages:
```bash
$ apt update && apt install git -y
```

Next, clone the latest version of Kiauh to your local machine and run it:
```bash
$ cd ~ && git clone https://github.com/dw-0/kiauh.git --depth 1
$ ./kiauh/kiauh.sh
```
:::info
Since there is already extensive documentation for the configuration process, we do not provide a detailed or repetitive guide here.  
You can refer to the following pages to complete the configuration:
- https://github.com/dw-0/kiauh
- https://www.klipper3d.org/Installation.html
- https://zhuanlan.zhihu.com/p/689587370
- https://www.jianshu.com/p/6d45af6d8966
:::

**Don't forget to select KlipperScreen installation on the Kiauh page!**

## Front Panel Installation
### STL Model

:::info Click to download the model ♪~ (🌸◡‿◡)
We provide Fusion360 `.f3d` files and `.stl` files for 3D printing.  
<a target="\_blank" href={require('./voron-klipper/FrontSkirtLogo.zip').default}>FrontSkirtLogo.zip</a>
:::

To mount the Sakura Pi RK3308B inside the Voron machine, we designed a front panel based on the official version that can accommodate a 480x272 screen.  
The screen is fixed to the back of the panel using double-sided tape, and the FPC cable passes through a slot to connect to the development board located at the back.  
![image](./voron-klipper/Snipaste_2025-06-30_00-34-37.jpg)

The model includes 3 holes corresponding to the screw positions of the development board. Use Voron-compatible heat-set inserts, which need to be installed manually.

:::warning Notes
Due to height constraints, it is recommended to purchase two 90-degree Type-C adapters; otherwise, the board may hit the bottom plate of the Voron power distribution box.
:::

### Front Panel Assembly
:::info
TODO: Steps need to be added.
:::
![image](./voron-klipper/Snipaste_2025-06-30_01-04-21.jpg)
