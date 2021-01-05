---
title: "linux library"
date: 2020-05-10T20:50:00+08:00
draft: false
---

## 定位动态库文件
`locate libGL.so`

## 打印载入动态库的过程
`export LD_DEBUG=libs`

## Print the lists of directories and candidate libraries stored in the current cache.
`ldconfig -p`
