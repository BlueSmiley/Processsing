float BOMB_SIZE = 10;
class Bomb
{
  float x;
  float y;
  PImage bombImage;
  float size;
  boolean destroyed;
  Bomb(float bombX,float bombY)
  {
    x = bombX;
    y = bombY;
    bombImage = loadImage("Medium.gif");
    size = BOMB_SIZE;
    destroyed = false;
  }
  
  void move()
  {
    if(!destroyed)
      this.y++;
  }
  
  void draw()
  {
    if(!offScreen() && !destroyed)
    {
      image(bombImage,x,y,size,size);
    }
  }
  
  float getY()
  {
    return this.y;
  }
  
  boolean offScreen()
  {
    if(getY()>SCREENY)
    {
      return true;
    }
    return false;
  }
  
  boolean collision(Player thePlayer)
  {
    float minX = thePlayer.getX();
    float maxX = minX + thePlayer.getSize();
    float minY = thePlayer.getY();
    float maxY = minY + thePlayer.getSize();
      
    if( x + size>=minX && x<maxX &&
        y + size>=minY && y<maxY)
        {
          return true;
        }
    return false;
  }
  
  void shieldCollision(Shields barrier)
  {
    float minX = barrier.getX();
    float maxX = minX + barrier.getWidth();
    float minY = barrier.getY();
    float maxY = minY + barrier.getHeight();
    if( x + size>=minX && x<maxX &&
        y + size>=minY && y<maxY && !barrier.isHit())
        {
          barrier.hit();
          destroyed = true;
        }
  }
  
  float getX()
  {
    return x;
  }
  
  boolean isDestroyed()
  {
    return destroyed;
  }
  
}