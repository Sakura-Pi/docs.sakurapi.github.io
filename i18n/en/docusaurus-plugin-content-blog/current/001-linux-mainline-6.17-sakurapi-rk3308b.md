---
title: Sakura Pi RK3308B Linux 6.17 Support Now Is READY!
description: Sakura Pi RK3308B Linux 6.17 Support Now Is READY!
hide_table_of_contents: false
---

Sakura Pi RK3308B Now Supported in Linux 6.17 Mainline
First of all, we would like to thank everyone for their continued support.

Earlier this year, we completed the adaptation of Sakura Pi RK3308B to linux-next and submitted a PR to the Linux organization. This SBC is now officially supported in the latest Linux 6.17.
<!-- truncate -->

We submitted the following patches:
- [dt-bindings: arm: rockchip: Add Sakura Pi RK3308B](https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=v6.17.6&id=bc099a4f5b7d08d97684648abe58d236cb7afa4f)
- [dt-bindings: vendor-prefixes: Add SakuraPi prefix](https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=v6.17.6&id=281bf6e619fc637282288a3a087e2b2ed3150cd5)
- [arm64: dts: rockchip: add DTs for Sakura Pi RK3308B](https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=v6.17.6&id=79f2a17024412fd6f62208ab3fd6814e52588a31)

Special thanks to Hsun Lai for all the contributions.

### Additional Patches
These patches have not yet been submitted to the Linux organization. In some cases, you may need these patches to ensure the SBC works perfectly. You might need to manually merge these patches to make them effective. Most of them have already been merged into Armbian, so if you are using Armbian directly, you don’t need to worry about these issues.

#### Rockchip VOP
These patches fix the issue where the mainline kernel cannot use the RK3308B VOP’s built-in LCDC (LCD Controller) to output to a panel.
- [rk3308-internal-rgb-lcdc.patch](https://github.com/armbian/build/blob/main/patch/kernel/archive/rockchip64-6.18/rk3308-internal-rgb-lcdc.patch)
- [rk3308-vop-output.patch](https://github.com/armbian/build/blob/main/patch/kernel/archive/rockchip64-6.18/rk3308-vop-output.patch)

#### Rockchip UART
This patch fixes the binding issue of UART DMA for RK3308B in the mainline kernel.
- [rk3308-fix-uart-dma.patch](https://github.com/armbian/build/blob/main/patch/kernel/archive/rockchip64-6.18/rk3308-fix-uart-dma.patch)

