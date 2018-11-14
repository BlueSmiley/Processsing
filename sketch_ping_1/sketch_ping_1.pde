Paddle paddle;
Ball ball;
void settings()
{
  size(SCREENX,SCREENY);
}

void setup()
{
  fill(WHITE);
  PFont calibri = loadFont("Calibri-18.vlw");
  textFont(calibri);
  textAlign(CENTER,CENTER);
  paddle = new Paddle();
  ball = new Ball();
  frameRate(60);
}

void draw()
{
  ball.reset();
  background(BLACK);
  ball.collide(paddle);
  paddle.computer(ball);
  paddle.move(mouseX);
  ball.move();
  
  paddle.draw();
  ball.draw();
  paddle.defeat(ball);
  if(paddle.compLives <= 0)
  {
    text("FINISH HIM",SCREENX/2,SCREENY/2);
    noLoop();
  }
  else if(paddle.playerLives <= 0)
  {
    text("GAME OVER",SCREENX/2,SCREENY/2);
    noLoop();
  }
}