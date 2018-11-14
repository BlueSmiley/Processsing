class Ball
{
  final int RADIUS = (SCREENY - 2*HUDSIZEY)/50 + SMALLMARGIN/2;
  int x = SCREENX/2;
  int y = SCREENY/2;
  int dx = (int)random(1,2);
  int dy = (int)random(1,2);
  
  void ball()
  {
    x = x + dx;
    y = y + dy;
    if(y + RADIUS <SCREENY - HUDSIZEY && y - RADIUS > HUDSIZEY)
    {
      ellipse(x,y,RADIUS,RADIUS);
    }
    if(x + RADIUS == SCREENX || x - RADIUS == 0)
    {
      dx = -dx;
    }
    
  }
  
  void collision(PlayerPaddle paddle)
  {
    if(y + RADIUS > paddle.yPosition &&
       y < paddle.yPosition &&
        x + RADIUS > paddle.xPosition &&
          x - RADIUS < paddle.xPosition + paddle.PADDLEWIDTH)
        {
          dy = -dy;
        }
  }
}