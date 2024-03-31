---
title: "MiTAC Internship"
date: 2023-06-28T17:39:09+08:00
draft: true
tags: []
categories: []
ShowToc: false
---

Working at [MiTAC](https://www.mitacmdt.com/en/index.php) over the summer...

MiTAC is the company behind [mio](https://www.mio.com/). I worked on a dash cam targeted at businesses with front, rear, and in-cabin camera, with Advanced Driver Assistance Systems (ADAS), Driver Monitoring Systems (DMS), and the ability to connect to cellular network for real time report.

## Running some test scripts
Mostly to get familiar with the product. The scripts boiled down to installing the software onto the dashcam, run some tests, and generating Excel reports.

Some interesting code:
![Code with 10 level of indentation](/mitac1.png)

Sometimes scripts are just made to work once and there's no need to make it nice. If it ain't broke don't fix it ¯\\\_(ツ)\_/¯

nvm it broke
![Code with bug](/mitac2.png)
Can you spot the bug?

## Q-learning course
My manager gave me a course on Q-learning on Udemy. I guess he thinks it might be useful since the ADAS uses machine learning.

The Udemy course consists of three sections, with each section split into two parts: concept and implementation. The concept video was a pretty high level view, but it did provide papers for a deeper understanding. The implementation was a line by line walkthrough, and I didn't bother to do it.

I thought the concept videos were not enough, but reading papers is too hard and I'm too dumb. The examples are actually from a [Berkeley AI course](http://ai.berkeley.edu/home.html) (you can also find more recent lectures) so I watched those. Good preview! I also found [MIT deep learning](http://introtodeeplearning.com/) which looks like a great resource.

In the end I made a small q-learning demo to present. Since I didn't care about the implementation portion of the Udemy course, and my manager didn't tell me what to do, I just did whatever I want. I aimed for deep q-learning, but I couldn't figure out how a straight forward way to do it with TensorFlow and the course used pyTorch. I also considered writing a neural network from scratch, but I got lazy. In the end I made a simple text-based game with a q-learning agent. Shot for the moon landed among the stars :P.

Some slides:
{{< slideshow >}}
    {{< slideimg src="/mitac3.png" >}}
    {{< slideimg src="/mitac4.png" >}}
{{< /slideshow >}}
*Holy crap front end is hard. Those image took me so long to put in. Learned a lot though, and Hugo is pretty neat once I understand it.*

Nonetheless my manager was impressed. ~~I guess I'm just too good.~~

## Working on dash cam features
I was going to work on detecting zig zag driving. Started with research. The original idea was to simply use the data from lane detection, but I still looked into some papers. Read a bunch of difficult concepts out of my knowledge, like support vector machines, k-nearest neighbors, and other fancy algorithm. There were a lot of methods, and if I was going to implement one of these I would have to do more learning.

In the end we ended up doing the simple solution. I created more graph and classified the data with Python.
![complex line graph](/mitac5.png)
Matplotlib is very useful. Already used it twice.

Finally time to actually implement it. First I worked on the feature in the C++ library. This took an afternoon. Then I have to put it in the Android app, which runs on the dash cam. This was pain. Adding a setting led to modifying something like 10 files, from UI to JNI cpp class to another Java class, all with getter and setter boilerplate. Thankfully my vim skill comes in handy and I can quickly copy from another feature and do some find and replace.

Felt like 20 files edited. Actually... `git diff a62c98732 --name-only | wc --line` show 37 files edited.

And that was just the internal app for testing. Still got to add it to the app for release.

I wonder if there's a better way, like generating some code and UI assets with scripts, or refactor the code, or just use kotlin. But I don't think it will save time because we have like less than 10 ADAS features and developers are probably used to Java and the current code base. The technology was still cool, with ability to connect to the cloud and a web interface.

## Reflection
- Bored
- No one cared

- code is a bit of a mess
- college project pretty accurate honestly
- Used shit ton of Python

## Skills
Android development
Java JNI
Python
