---
title: "Fixing My KDE issues"
date: 2022-09-09T10:10:24-07:00
draft: false
tags: ['linux']
categories: ['hidden']
ShowToc: false
---

Create new user
`sudo cp -r /home/foo/.config ~/foo-config`
`sudo chown -R connorcc ~/foo-config`
```
for i in *; do\
        diff ~/.config/$i ~/foo-config/$i > /dev/null || echo $i\
done > test
```
do experiment (backup first!)
```
mv kwinrc kwinrc.BAK
```
Logout and log back in
```
[Compositing]
OpenGLIsUnsafe=false
```

