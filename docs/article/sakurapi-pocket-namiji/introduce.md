---
sidebar_position: 1
title: 介绍
sidebar_label: 介绍
---

# 基本介绍

Sakura Pi Pocket Namiji 是一款专为 Meshtastic / LoRa Mesh 玩家设计的超小型节点平台。它尺寸小巧、供电灵活、支持二次开发，适合用于太阳能节点、室内固定节点等多种应用场景。

<img
  src={require('./img/board-shot.jpg').default}
  alt="board-shot"
  style={{
    width: '60%',
    borderRadius: '12px'
  }}
/>


## 特征

Sakura Pi Pocket Namiji 的基本参数如下：
- 处理器：ESP32-C3，支持 WiFi 和 BLE
- 兼容 Meshtastic，已预烧录固件
- 支持软件二次开发，源码开放，可自行编译
- 尺寸小巧：可直接装进 50mm PVC 水管
- 散热器兼容设计，适合极端环境加装散热器
- 板载 AHT20 温度传感器，用于监测板子温度；在封闭环境（如太阳能节点）中，可判断密封是否失效

## 供电设计
- Buck-Boost 架构
- 输出：5V
- 输入：3–16V 宽压范围
- 支持多种供电方式：
  - PD 12V 充电头
  - DC 直流供电
  - KF301 接线端子（可选配件）
- 具备反接保护，适合户外和实验环境

### 太阳能节点应用
用户可自备以下组件构建太阳能节点：
- 带保护板的电池（支持 1–4 串）
- 太阳能板
- MPPT 模块

## 射频与接口
- 焊接式 SMA 座子（固定）
- IPEX1 接口连接 LoRa 模块
- 建议使用 gizont 定频天线（24cm / 40cm），升级玻璃钢天线效果更佳

:::warning 重要提醒
必须接入天线后再上电，否则可能损坏射频部分。
:::

## 处理器

板载 ESP32-C3 模块，提供强大的无线连接能力和低功耗性能，支持 WiFi 和 BLE 协议。源码开放，用户可根据需要进行二次开发和固件编译。

更多关于 ESP32-C3 的信息，请参考 [Espressif 官方文档](https://www.espressif.com/en/products/socs/esp32-c3)。

Sakura Pi Pocket Namiji 支持软件二次开发，适合构建各种 LoRa Mesh 应用，如太阳能供电的远程节点或室内固定部署。用户可基于开源固件进行定制开发。