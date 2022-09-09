---
title: "Linux Troubleshooting Guide"
date: 2022-09-05T15:59:55-07:00
draft: true
tags: []
categories: []
ShowToc: false
---

I recently fixed my laptop's battery issue. I spent a lot of time failing and asking on forums, but actually half of the methods listed here would've lead me to the solution without asking.

# Quick fixes

## Reboot
So simple that sometimes I forgets.

## Upgrade
And hope that devs patched the bug.

## Switch kernel version
On arch, this isn't actually too hard. A lot of times just switching to lts kernel works.
Install the kernel: `sudo pacman -S linux-lts`
Update grub: `grub-mkconfig -o /boot/grub/grub.cfg`

## Use the terminal
Might gives extra text output?


# harder fixes
## Update bios
probably have to boot into windows for this one depending on the hardware

## Downgrade
IDK how to do this

# Scouring the internet
Every problem is different based on different hardware and system setup.
## General search terms to include
Desktop environment, hardware, distribution...
## Check log
I actually don't do this
## Google
Not very good tbh.
## Bugs
I found my bug on https://bugs.archlinux.org/
## Forums
Reddit and https://bbs.archlinux.org/
## Discord
Search through message history, or just engage in the community in general. I'm in the rog linux discord and it helped solve ranged of problems.
