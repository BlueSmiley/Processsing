final int UPGRADE_SIZE = 10;
final color UPGRADE_COLOR = color(100,200,216);
class Upgrade
{
  float x;
  float y;
  int size;
  boolean used;
  int state;
  
  Upgrade(float xpos,float ypos,int state)
  {
    this(xpos,ypos);
    this.state = state;
  }
  
  Upgrade(float xpos,float ypos)
  {
    x = xpos;
    y = ypos;
    size = UPGRADE_SIZE;
    used = false;
    state = 0;
  }
  
  void move()
  {
    if(y<SCREENY)
    {
      y++;
    }
  }
  
  void draw()
  {
    
    if(y<SCREENY && !used)
    {
      fill(UPGRADE_COLOR);
      rect(x,y,size,size);
    }
  }
  
  void collide(Player thePlayer)
  {
      float minX = thePlayer.getX();
      float maxX = minX + thePlayer.getSize();
      float minY = thePlayer.getY();
      float maxY = minY + thePlayer.getSize();
      
      if( x + size>=minX && x<maxX &&
          y + size>=minY && y<maxY)
          {
            used = true;
            thePlayer.changeState(state);
          }
  }
}