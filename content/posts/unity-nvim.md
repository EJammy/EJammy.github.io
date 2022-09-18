---
title: "Setting up Unity with Linux and Neovim"
date: 2022-09-17T23:53:51-07:00
draft: false
tags: ['linux', 'neovim', 'gamedev']
categories: ['Tech']
ShowToc: false
---

![Unity Screenshot](/unity-linux.png)

## Unity UI scale
Unity UI was too small at first. I think this has something to do with dpi and screen resolution. A lot of information on https://wiki.archlinux.org/title/HiDPI.

Adding desktop entry at: `~/.local/share/applications/unity-launch.desktop`
```
[Desktop Entry]
Name=Unity
Exec=GDK_SCALE=2 GDK_DPI_SCALE=0.5 /home/connorcc/Unity/Hub/Editor/2021.3.3f1/Editor/Unity
Terminal=false
Type=Application
Icon=unityhub
Comment=Unity, with scaling env
Categories=Development;
```

## Setting up vscode first
Error message tells us to use the following setting: `"omnisharp.useModernNet": false`. Otherwise everything seems to work out of the box.

## Neovim
Took me an hour or two to setup. There were a few other guides online, but some are complicated and include steps I don't understand. Others used coc.nvim. There's also the Omnisharp-vim plugin. I just want to stick with built in lsp support and nvim-cmp.

Apparently the language server is called omnisharp-roslyn. Not sure how it's different from the vscode plugin. I installed from the AUR first. It gave the same error message as the one from vscode. So I tried both setting useModernNet option in the `~/.omnisharp` directory and in the lsp config. Both did not work. Then I just downloaded from github and it worked! So I removed both settings, and it still worked! Now I'm just confused.

So in the end it was as simple as: 1. enable lsp 2. download lsp 3. done

I was also looking for support for signature help and overloaded functions. I have [hrsh7th/cmp-nvim-lsp-signature-help](https://github.com/hrsh7th/cmp-nvim-lsp-signature-help) for now but it'll complete with the type with my current setup. Then I found [Issafalcon/lsp-overloads.nvim](https://github.com/Issafalcon/lsp-overloads.nvim), which is quite new and actually took code from omnisharp.vim, but I haven't set this up yet.

### Generating project files
Setting the editor to vscode in Unity and generating the project files worked. There seems to be ways to do it with the dotnet cli, but this will do for now.

## Quirks
- UI scale is different from Windows.
- lsp does not work for new files --> restart lsp / neovim
- Visual Studio seems to still have the best support
