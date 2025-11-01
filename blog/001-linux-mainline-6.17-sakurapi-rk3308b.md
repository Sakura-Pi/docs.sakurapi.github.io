---
title: Sakura Pi RK3308B 现已获得 Linux 6.17 主线支持
description: Sakura Pi RK3308B 现已获得 Linux 6.17 主线支持
hide_table_of_contents: false
---

首先在此感谢大家的持续关注。  

我们在今年中旬完成了对 Sakura Pi RK3308B 的 linux-next 的适配并发送 PR 至 linux org，该 SBC 现于最新的 Linux 6.17 得到了正式的支持。
<!-- truncate -->

我们发送了以下补丁:
- [dt-bindings: arm: rockchip: Add Sakura Pi RK3308B](https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=v6.17.6&id=bc099a4f5b7d08d97684648abe58d236cb7afa4f)
- [dt-bindings: vendor-prefixes: Add SakuraPi prefix](https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=v6.17.6&id=281bf6e619fc637282288a3a087e2b2ed3150cd5)
- [arm64: dts: rockchip: add DTs for Sakura Pi RK3308B](https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=v6.17.6&id=79f2a17024412fd6f62208ab3fd6814e52588a31)

在此特别感谢 Hsun Lai 的所有工作。

### 一些其他的补丁
这些补丁是尚未提交至 linux org 的，某些情况下您可能需要这些补丁才能让 SBC 完美工作。
您可能需要手动合并这些补丁让它们发挥作用。它们大多数已经被合并至 Armbian，如果您直接使用 Armbian，则不需要考虑这些问题。

#### Rockchip VOP
该补丁修复了主线无法使用 RK3308B VOP 的内置 LCDC (LCD Controller) 输出到面板的功能。
- [rk3308-internal-rgb-lcdc.patch](https://github.com/armbian/build/blob/main/patch/kernel/archive/rockchip64-6.18/rk3308-internal-rgb-lcdc.patch)
- [rk3308-vop-output.patch](https://github.com/armbian/build/blob/main/patch/kernel/archive/rockchip64-6.18/rk3308-vop-output.patch)

#### Rockchip UART
该补丁修复了主线对于 RK3308B 的 UART DMA 的绑定问题。
- [rk3308-fix-uart-dma.patch](https://github.com/armbian/build/blob/main/patch/kernel/archive/rockchip64-6.18/rk3308-fix-uart-dma.patch)
