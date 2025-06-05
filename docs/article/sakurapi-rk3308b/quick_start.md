---
sidebar_position: 2
title: 快速指南
sidebar_label: 快速指南
---

# 快速指南

## 系统烧录
:::info
Sakura Pi RK3308B 出厂并不预烧录任何系统，所以需要您手动下载并烧录。
:::

目前本设备支持以下操作系统
| 状态 | 发行版名称 | 版本 | 下载地址 |
|:--|:--|:--|:--|
| 🟢 维护中  | Armbian - _**Debian 12 Bookworm**_| 保持最新 | [🔗 点击下载](https://dl.armbian.com/sakurapi-rk3308b/Bookworm_current_minimal) |
| 🟢 维护中  | Ubuntu - _**Ubuntu 24.04 Noble**_| 保持最新 | [🔗 点击下载](https://dl.armbian.com/sakurapi-rk3308b/Noble_current_server) |

:::warning
串口的默认波特率为 `1500000`

当你使用 Armbian 首次开机登录时会提示你进行用户创建和密码重置。
如果没有提示或遗漏这个过程导致进入不了系统，可以尝试使用默认根账户 `root` 和密码 `1234` 进入系统。
:::

import FlashingGuide from '../_common/flashing_rockchip.md';

<FlashingGuide />
