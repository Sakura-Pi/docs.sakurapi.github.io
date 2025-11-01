---
id: boost-to-1-3ghz
title: Hardware Overclocking
---

:::info Difficulty Level ★★★★★
:::

:::tip Chapter Tip
This chapter will guide you on how to perform hardware modifications to adjust CPU voltage and use a `dtbo` for overclocking.
:::

<!-- truncate -->

## Introduction

### Glossary
| Term | Explanation |
| -- | -- |
| dtb  | Device Tree Binary |
| dtbo | DTB Overlay |

### Summary
The default frequency of the RK3308B is around 1.0GHz. However, according to the manual, the RK3308B can reach 1.3GHz. Can it be overclocked?  
The answer is, of course, yes! However, since the CPU voltage of the Sakura Pi RK3308B is set to 1.0V by default, unlocking its full performance requires a hardware voltage modification.

In our [extreme testing](../introduce.md#llvmpipe-glsl), we used this method to overclock.  
~~As long as the junction temperature doesn't exceed 140°C, go for it!~~

:::warning
After overclocking, both the power consumption and temperature of the RK3308B will increase significantly. It is recommended to use a heatsink.
:::

## Hardware Voltage Modification

### Reference Circuit
Refer to the schematic of the Sakura Pi RK3308B to locate the buck circuit responsible for the CPU's main power supply.

![image](./boost-to-1.3ghz/Snipaste_2025-06-28_22-31-42.jpg)

:::info
In the Sakura Pi RK3308B schematic, R9 is designed to be 169K, but in some production batches, it is 100K.  
If you measure the voltage at TP3 to be approximately 1.27V, you can skip this step.
:::

Based on the formula:
- 0.6 * (1 + 100 / 150) = 0.99
- 0.6 * (1 + 169 / 150) = 1.27

You can replace the R9 resistor from 100K 1% to 169K 1%, which will increase the voltage from 1.0V to 1.276V.

### Replacing the Resistor

:::warning
Hardware modification requires both courage and precision. If you insist on doing it, take action without hesitation.  
However, please note that we do not provide any warranty for hardware damage caused by such modifications. Proceed at your own risk.
:::

![image](./boost-to-1.3ghz/Snipaste_2025-06-28_23-39-20.jpg)

As shown in the image, this resistor is the R9 resistor. Remove and replace it.

### Measuring Voltage and Verification

![image](./boost-to-1.3ghz/Snipaste_2025-06-28_23-43-16.jpg)

## Configuring the Overclocking dtbo

To ensure the consistency of the `overlay_prefix`, copy a new file:
```bash
$ cp /boot/dtb/rockchip/overlay/rk3308-bs@1.3ghz.dtbo /boot/dtb/rockchip/overlay/rockchip-rk3308-bs@1.3ghz.dtbo
```

Then, add `rk3308-bs@1.3ghz` to the `overlays` line in `/boot/armbianEnv.txt`.  
If the `overlays` line does not exist, add one at the end of the file.

Reboot and check the u-boot output to ensure it is correct (refer to [Configuring dtbo](./ws2812-leds#configuring-the-dtbo) for similar steps).
