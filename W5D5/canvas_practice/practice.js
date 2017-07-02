document.addEventListener("DOMContentLoaded", function(){

  let canvas = document.getElementById('mycanvas');
  canvas.height = 500;
  canvas.width = 500;

  let ctx = canvas.getContext('2d');

  ctx.fillStyle = 'orange';
  ctx.fillRect(50, 50, 500, 500);

  ctx.beginPath();
  ctx.arc(275, 275 ,200, 0, 2 * Math.PI);
  ctx.strokeStyle = 'black';
  ctx.lineWidth = 10;
  ctx.stroke();
  ctx.fillStyle = 'red';
  ctx.fill();
});
