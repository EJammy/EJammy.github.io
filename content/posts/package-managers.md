---
title: "Package Managers: Getting Softwares on Linux (and MacOS / Windows)"
date: 2022-04-10T22:02:28+08:00
draft: true
tags: ['programming', 'software', 'linux']
categories: ['Technology']
ShowToc: false
---

![pacman in terminal](/carbon.svg)

A week ago I was installing homebrew on my friend's computer and she had no idea what I was doing (not that I actually know what I'm doing), so I think it's a good time to write a guide.

> A package manager or package-management system is a collection of software tools that automates the process of installing, upgrading, configuring, and removing computer programs for a computer in a consistent manner.
> 
> -- *[Wikipedia](https://en.wikipedia.org/wiki/Package_manager)*

Basically, package managers install software (packages) on your computer, kind of like Apple's App Stores or Window's Microsoft Store, except that they're better and people actually uses them. They are especially important, even critical, on Linux.

## "Ok so why wouldn't I just download stuff off the internet."

### Dependencies
Let's say you build an app with Python and you want to distribute it. In this case, the user would need Python to run your app. You have to options:
- Bundle Python with your app: every software that uses Python have its own copy of Python -> waste lots of disk space
- Have the user install Python
These two solution seems fine... until you realize that your app also needs a specific graphics library, cURL to download files off the internet, and ... you get the idea.
![dependency hell](https://imgs.xkcd.com/comics/tech_loops.png)
*Dependency hell: when you can't manage dependencies. From [xkcd 1579](https://xkcd.com/1579/).*

Package managers solve this issue by looking for all the software your app 'depends on' and fetching them. Each those software might even have their own dependencies, creating a dependencies tree.


### Security
Package managers fetch software from fixed sources, which **may be** vetted by a trusted third party. In addition, they use [checksums](https://en.wikipedia.org/wiki/Checksum) and [digital certificates](https://en.wikipedia.org/wiki/Digital_certificate) to verify downloads

### Command Line!
You can use package managers in the command line (often, this is the only way!). Doing so elevates you to another level, above the normies that click gui apps with their cursor.

## All the package managers
### Linux
Package managers are a core part of many Linux systems. Every Linux distribution has their own package manager. For example, `apt` for Debian, Ubuntu, and Linux Mint; `pacman` for Arch; `pamac` for Manjaro; and `dnf` for Fedora. They are the main way of getting softwares.

### MacOS and Windows
[Homebrew](https://brew.sh/) for Mac and [Chocolatey](https://chocolatey.org/) for Windows! Apparently Windows Package Manager is a thing too?

### For Programming Languages
Package managers shines when writing code, when you want to use a library, which might depend on other libraries. Many modern programming languages use a package manager: `npm` (JavaScript), `pip` (Python), `cargo` (Rust) just to name a few.

## Getting started!
Start learning package managers! Install one on your system. I recommend getting wsl for Windows (linux subsystem; look it up). Next use google-fu to learn it. Finally, install some packages! (Suggestions: `neofetch`, `asciiquarium`, `cowsay`, `lolcat`, `figlet`).
