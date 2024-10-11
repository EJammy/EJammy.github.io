---
title: "Temporary code for Non-RISD visitors"
date: 2024-10-10T17:18:49-07:00
draft: false
tags: []
categories: []
ShowToc: false
---

## num
<script>
    // Generate a random number between 1 and 100
    var randomCode = Math.floor(Math.random() * 10000).toString().padStart(4, '0');
    
    // Put the random number into the element with id="num"
    document.getElementById("num").textContent = randomCode;
</script>
