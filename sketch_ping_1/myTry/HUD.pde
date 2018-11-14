class HUD
{
  
  void draw()
  {
    fill(BLACK);
    rect(0,0,HUDSIZEX,HUDSIZEY);
    rect(0,SCREENY - HUDSIZEY,HUDSIZEX,HUDSIZEY);
    
    
    fill(WHITE);
    textAlign(CENTER,CENTER);
    text("LIVES",SCREENX/2,HUDSIZEY/2);
    for(int lives = 1;lives<=LIVES;lives++)
    {
      ellipse(SCREENX/2 + MARGIN*lives,HUDSIZEY/2,LIFE_RADIUS,LIFE_RADIUS);
      ellipse(SCREENX/2 + MARGIN*lives,SCREENY - HUDSIZEY/2,LIFE_RADIUS,LIFE_RADIUS);
    }
    text("LIVES",SCREENX/2,SCREENY - HUDSIZEY/2);
    ellipseMode(CENTER);
  }
}