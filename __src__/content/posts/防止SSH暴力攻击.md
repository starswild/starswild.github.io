---
title: "防止SSH暴力攻击"
date: 2018-03-19T23:50:49+08:00
draft: false
---
记录登录日志
vim /etc/ssh/sshd_config
SyslogFacility AUTHPRIV
LogLevel INFO

[DenyHosts 阻止SSH暴力攻击][1]http://blog.csdn.net/wanglei_storage/article/details/50849070