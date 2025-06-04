---
id: boost-to-1-3ghz
title: 超频到 1.3GHz
---

:::info 难度等级 ★★★★☆
:::

:::tip 章节提示
本文讲述了如何编写 dtbo (DTB Overlay)，并利用 Armbian 在 u-boot 引导系统时覆盖我们的设备树。  
如果你只是单纯的想解锁全部的性能，并且觉得编译 dtbo 很麻烦。请直接跳转到 [章节]
:::

<!-- truncate -->

#### 术语查找表
| 术语 | 对应解释 |
| -- | -- |
| DTB  | Device Tree Binary |
| DTBO | DTB Overlay |
| DTC  | Device Tree Compiler |
| OF   | Open Firmware |

## 引言

RK3308B 的默认频率只有 1.0GHz 左右。但是根据手册，RK3008B 的频率能达到 1.3GHz，能不能超频呢？
答案是当然可以的，请随我来！

## 





