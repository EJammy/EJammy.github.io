---
title: "Playground"
date: 2023-07-21T17:27:27+08:00
draft: false
tags: []
categories: []
ShowToc: false
---


## Very cool background effect
From https://github.com/hustcc/canvas-nest.js

Script tag from [cdnjs.com](https://cdnjs.com/libraries/canvas-nest.js/2.0.4) with colors:
```html
<script color="175,140,240" opacity=0.5 src="https://cdnjs.cloudflare.com/ajax/libs/canvas-nest.js/2.0.4/canvas-nest.js" integrity="sha512-P+NGabN/TJDOnCVOFJO+E06TBm4i+M8dTT91lWg/8UpwLrzicEXIypmABPpA47D0x6r+yxFHjYIZKWhc1h7xlQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
```

<!-- <script src="https://raw.githubusercontent.com/hustcc/canvas-nest.js/master/dist/canvas-nest.js" crossorigin="anonymous" referrerpolicy="no-referrer"></script> -->

<!-- https://cdnjs.com/libraries/canvas-nest.js/1.0.1 -->
<script color="175,140,240" opacity=0.5 src="https://cdnjs.cloudflare.com/ajax/libs/canvas-nest.js/2.0.4/canvas-nest.js" integrity="sha512-P+NGabN/TJDOnCVOFJO+E06TBm4i+M8dTT91lWg/8UpwLrzicEXIypmABPpA47D0x6r+yxFHjYIZKWhc1h7xlQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

## Javascript chasing game I made in highschool
https://github.com/EJammy/simple-javascript-chasing-game

<p id='js-game-score'>your score: </p>

<canvas
  onmousemove = 'pos = showCoords(event)'
  id="gameArea"
  width="640"
  height="480"
  style="border:1px solid #000000" >
  </canvas>

<script>
var gameArea = document.getElementById("gameArea");
var ctx = gameArea.getContext("2d");
//for position of mouse
var border = gameArea.getBoundingClientRect();
var pos = {x: 100, y:100};
var i = 0;

var run = setInterval(update, 10)

function update(){
  ctx.clearRect(0, 0, 640, 480);
  follow(player, pos, 15, 5);

  player.update();
  enemy.update();
  if (i > 100) {
    follow(enemy, player, 0, 3);

    //losing
    if (enemy.x < player.x + 30 && player.x < enemy.x + 30 &&
      enemy.y < player.y + 30 && player.y < enemy.y + 30)
      {
      // window.alert("your score:" + i);
      document.querySelector('#js-game-score').innerHTML = "your score:" + i;
      i = 0;
      player.x = 100;
      player.y = 100;
      enemy.x = 100;
      enemy.y = 100;
      pos = {x: 100, y:100};

    }
  }
  i += 1;
}

function component(width, height, color){
  this.x = 100;
  this.y = 100;
  this.update = function () {
    square = ctx;
    square.fillStyle = color;
    square.fillRect(this.x, this.y, width, height);
  }
}
var player = new component(30, 30, "red");
var enemy = new component(30, 30, "green");

function showCoords(evt){
console.log(evt)
  return{
    x: evt.pageX - border.left,
    y: evt.pageY - border.top
  }
}
function follow(object, target, dpos, spd) {
  if (object.x > target.x - dpos) {
    object.x -= spd;
  }else {
    object.x += spd;
  }
  if (object.y > target.y - dpos) {
    object.y -= spd;
  }else {
    object.y += spd;
  }
}
</script>

Frontend is ass. It took me half an hour to patch the game so it works when the pages scrolls. Somehow it's still buggy.
