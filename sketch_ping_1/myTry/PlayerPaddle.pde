class PlayerPaddle
{
  final int PADDLEWIDTH = SCREENX/10;
  final int PADDLEHEIGHT = (SCREENY - 2*HUDSIZEY)/75;
  
  int xPosition;
  int yPosition;
  void paddle()
  {
    fill(BLUE);
    yPosition = SCREENY - HUDSIZEY - MARGIN;
    if(mouseX>SCREENX - PADDLEWIDTH - SMALLMARGIN)
    {
      xPosition = SCREENX - PADDLEWIDTH - SMALLMARGIN;
    }
    else if(mouseX<SMALLMARGIN)
    {
      xPosition = SMALLMARGIN;
    }
    else
    {
      xPosition = mouseX;
    }
    rect(xPosition,yPosition,PADDLEWIDTH,PADDLEHEIGHT);
  }
}