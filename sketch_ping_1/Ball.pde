class Ball
{
  float x = random(SCREENX/4, SCREENX/2);
  float y = random(SCREENY/4, SCREENY/2);
  float xVelocity = random(1,2);
  float yVelocity = random(1,2);
  int radius = 10;
  boolean out = false;
  color ballColor = color(YELLOW);
  float ballSpeedIncrease = 1.001;
  
  void reset()
  {
    if(mousePressed)
    {
       x = random(SCREENX/4, SCREENX/2);
       y = random(SCREENY/4, SCREENY/2);
       xVelocity = random(1,2);
       yVelocity = random(1,2);
       out = false;
    }
  }
  
  void move()
  {
    x = x + xVelocity;
    y = y + yVelocity;
    xVelocity = xVelocity * ballSpeedIncrease;
    yVelocity = yVelocity * ballSpeedIncrease;
  }
  
  void draw()
  {
    fill(ballColor);
    if(y-radius>=0 && y+radius<SCREENY)
    {
      ellipse(int(x),int(y),radius,radius);
    }
    else
    {
        out = true;
    }
  }
  
  void collide(Paddle playerPaddle)
  {
    //ai collisions
    if(y - radius <= playerPaddle.compy + PADDLEHEIGHT &&
        y + radius > playerPaddle.compy &&
          x >= playerPaddle.compx &&
            x <= playerPaddle.compx + PADDLEWIDTH)
    {
      yVelocity = -(yVelocity);
      xVelocity = xVelocity + (playerPaddle.compx - playerPaddle.oldCompBat);
      println("ai collide");
    }
    //user collisions
    if(y + radius >= playerPaddle.yPosition &&
       y - radius<playerPaddle.yPosition + PADDLEHEIGHT &&
       x >= playerPaddle.xPosition && 
       x <= playerPaddle.xPosition + PADDLEWIDTH)
     {
       yVelocity = -(yVelocity);
       xVelocity = xVelocity + (playerPaddle.xPosition - playerPaddle.oldPlayerBat);
       println("collide");
     }
     
     //wall collisions
     if(x-radius <= 0)
     {
       xVelocity = -xVelocity;
       yVelocity*=(1.1);
     }
     else if(x + radius >= SCREENX)
     {
       xVelocity = -xVelocity;
       yVelocity*=(1.1);
     }
     
     
  }

}