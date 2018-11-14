class Paddle
{
  color paddleColor = color(BLUE);
  int xPosition =SCREENX/2;
  int yPosition = SCREENY - MARGIN - PADDLEHEIGHT;  //Don't want the user to set paddle position
  int compx = (int)random(0,SCREENX-PADDLEWIDTH);
  int compy = MARGIN + PADDLEHEIGHT;
  float compSkill = 1;
  int compLives = LIFE;
  int playerLives = LIFE;
  boolean outCheck = false;      //ball isn't out yet
  int oldPlayerBat = xPosition;
  int oldCompBat = compx;      //allows us to tell change in location
  int distance;
  int difficulty;
  float skillIncrement = .01;
  
  void move(int x)
  {
    if(x>SCREENX-PADDLEWIDTH)
    {
      oldPlayerBat = xPosition;
      xPosition = SCREENX - PADDLEWIDTH;
      
    }
    else if(x<0)
    {
      oldPlayerBat = xPosition;
      xPosition = 0;
      
    }
    else
    {
      oldPlayerBat = xPosition;
      xPosition = x;
    }
  }
  
  void draw()
  { 
    fill(paddleColor);
    rect(xPosition,yPosition,PADDLEWIDTH, PADDLEHEIGHT); 
  } 
  
  void computer(Ball ball)
  {
    fill(paddleColor);
    rect(compx,compy,PADDLEWIDTH,PADDLEHEIGHT);
    difficulty = (int)random(1,compSkill);
    if((compx+PADDLEWIDTH/2)>ball.x)
    {
      distance = (compx+PADDLEWIDTH/2) - (int)ball.x;
    }
    else if((compx+PADDLEWIDTH/2)<ball.x)
    {
      distance = (int)ball.x - (compx+PADDLEWIDTH/2);
    }
    else
    {
      distance = 0;
    }
    for(int i = 0;i<distance && i < difficulty;i++)
    {
      if((compx+PADDLEWIDTH/2)>ball.x && compx>0)
      {
        oldCompBat = compx;
        compx--;
        rect(compx,compy,PADDLEWIDTH,PADDLEHEIGHT);
      }
      else if((compx+PADDLEWIDTH/2)<ball.x && compx + PADDLEWIDTH < SCREENX)
      {
        oldCompBat = compx;
        compx++;
        rect(compx,compy,PADDLEWIDTH,PADDLEHEIGHT);
      }
      else
      {
        rect(compx,compy,PADDLEWIDTH,PADDLEHEIGHT);
      }
    }
    if(compSkill < SCREENX/4)
    {
      compSkill= compSkill+skillIncrement;
    }
  }
  
  void defeat(Ball ball)
  {
    if(ball.out == false && outCheck == true)
    {
      outCheck = false;
    }
    
    if(ball.out == true && ball.y>SCREENY/2 && outCheck == false)
    {
      playerLives--;
      outCheck = true;
    }
    else if(ball.out == true && ball.y<SCREENY/2 && outCheck == false)
    {
      compLives--;
      outCheck = true;
    }
    
  }
}