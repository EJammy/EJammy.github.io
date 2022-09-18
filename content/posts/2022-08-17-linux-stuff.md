---
title: "Installing Linux"
date: 2022-08-17T21:24:03-07:00
draft: false
tags: []
categories: []
ShowToc: false
---

Got a new laptop, ASUS Zephrus G15, for college, and first thing to do is to install linux :D

# Distribution
I've used linux mint for a while and it's really good, but debians packages are just not up to date enough for me and ppa are annoying to manage. Then I tried manjaro, and it was great! However I've heard from the street that manjaro is bad so I guess it's time to install arch

## Arch Linux
Because Arch is the best, obviously

Bare bone installation was actually much easier than I expected. Only thing was I needed to update the keychain on the installation media.

## Fedora
Apparently a very good distribution, so I decided to test it out. Shutdown didn't work (out of the box, didn't bothered fixing). Very unfortunate since I had high hopes for this...

# Setup notes
WIP

# Compared to windows
Comparing my Arch Linux installation after basic setups

## Audio
Some audio issues on Linux:
1. Speaker seems to work on full volume, but decreasing the volume makes the sound softer. It's probably due to the complicated sound system with multiple speaker on this model.
2. External Microphone doesn't work

## General
- Boot time much faster
- Uses less system resource
- Sleep problem on both systems: fans goes pretty fast during sleep on windows, but on Linux fans speeds up after a sleep-wake cycle
- TODO: test hibernation

## Privacy and FOSS
A large portion of the Linux and FOSS community really care about privacy and open source software (surprise!). I do recognize that corporate needs to collect data responsibly, but at the same time I value my privacy much less than a lot of other people. I still run google chrome and I don't see a problem. Maybe I'm ignorant, but I can't see a direct downside of, for example, loosing privacy from using google service.

I do, however, want to set up my operating system the way I like it, and Windows 11 sucks at that. Proprietary software is fine, but Windows is bloated and keeps shoving Microsoft service at your face. You can put ads on free websites, but an expensive OS with all this garbage is unreasonable.

# Setups
Updated as I work on these

Checklists:
- [x] Input methods
- [ ] gestures
- [ ] fix audio: https://asus-linux.org/blog/sound-2021-01-11/
- [x] firewall
- [x] hibernate
- [?] graphics driver

Extras:
- [ ] setup some hotkeys (fan, keyboard aura, screenhot...)
- [ ] asusctl

## General
### Desktop environment
KDE is great! All the software is amazing too! KDE softwares are so underrated. You never find Kate when looking for text editors.

- Set darkmode
- Increase keyboard repeat rate
- Remap caps lock?

### Input methods
Followed Arch wiki (used fcitx5)

### Gestures
I've used touchegg before, but I couldn't get it to work yet. Also libinput and KDE both seems to have support for gestures, but they didn't work out of the box

