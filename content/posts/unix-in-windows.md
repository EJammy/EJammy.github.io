---
title: "Unix in Windows (not wsl)"
date: 2023-06-19T08:58:51+08:00
draft: true
tags: ['programming', 'software', 'Linux']
categories: ['tech']
ShowToc: false
---

![xkcd python comic](https://imgs.xkcd.com/comics/python_environment.png)

*me setting up Python... except also include Python from Microsoft Store, wsl, Chocolatey, and MSYS2.*

I make a mess when setting up Windows for writing code. I've always felt like developing on Windows is a pain, but I think I have decided the best setup: MSYS2.

# What I want
- Unix tools: bash shell, cat, grep, less... etc.
- Package manager
- Speed

# [MSYS2](https://www.msys2.org/)
I think I stumbled upon this first when setting up c++ on vscode. If you've installed git on Windows, that is based on MSYS2.

It's a bit confusing with the different environments, but I think it's mostly for c and c++ development. I'm sticking with mingw right now. To install stuff you have to prefix it with the environment which is kind of annoying.

Other benefits:
- Converts path to Windows path (which can backfire, like when I used adb to access Android device)
- Pacman, the package manager straight from Arch Linux.
- Native software which is faster(?)
- Linux environment, super similar to wsl (or I might lack the knowledge to tell the difference)

Other than that I'm too lazy to write a guide so you can just read the docs.

## Tips
### Home directory
Modify /etc/nsswitch.conf to get Windows home directory.
```
# Begin /etc/nsswitch.conf

passwd: files db
group: files db

db_enum: cache builtin

db_home: env windows cygwin desc
db_shell: env windows cygwin desc
db_gecos: env cygwin desc

# End /etc/nsswitch.conf
```
You can read more in the cygwin documentation, which is what MSYS2 is based on.

### Performance
Need testing but I blame Windows terminal. Use the terminal bundled with MSYS2 or something else.

# Other options
The MSYS2 has a good comparison: https://www.msys2.org/docs/what-is-msys2/

## wsl
I used to love wsl. Then I ran Linux and I don't like wsl anymore. I just do everything on Windows as instructed on the documentation of whatever I'm working on. I'm pretty sure wsl is just slow. I think wsl 2 improved the performance, but file between host and wsl is slower.

And it just feels wrong. I'd prefer to just use Linux on Linux and Windows on Windows.

## Chocolatey
I think I might run this along side MSYS2. (More packages + better Windows integration)

## Git bash
This is actually just repackaged MSYS2

# TODO:
- Benchmark. After testing I can change the title to "Faster than wsl"
- Develop my dot files
