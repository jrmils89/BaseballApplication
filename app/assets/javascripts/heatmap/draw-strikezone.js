var c = document.getElementById("strike-zone");
var ctx = c.getContext("2d");
ctx.beginPath();
ctx.moveTo(100, 150);
ctx.lineTo(200, 150);
ctx.lineTo(200, 350);
ctx.lineTo(100, 350);
ctx.lineTo(100, 150);
ctx.stroke();