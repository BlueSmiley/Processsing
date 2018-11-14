PlayerPaddle user;
Ball theBall;
HUD display;
void settings()
{
  size(SCREENX,SCREENY);
}
void setup()
{
  
  PFont calibri = loadFont("Calibri-18.vlw");
  textFont(calibri);
  user = new PlayerPaddle();
  theBall = new Ball();
  display = new HUD();
  frameRate(25);
}

void draw()
{
   background(WHITE);
   display.draw();
   user.paddle();
   theBall.ball();
   theBall.collision(user);
   
}