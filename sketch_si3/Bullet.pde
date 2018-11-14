final float BULLET_SIZE = 10;
final float BULLET_SPEED = 2;
final color DEFAULT_COLOR = color(110,144,0);
class Bullet
{
  float x;
  float y;
  float size;
  float speed;
  int state;
  boolean bulletCollision;
  SoundFile boom;
  
  Bullet(float x,float y,int state)
  {
    this(x,y);
    this.state = state;
  }
  
  Bullet(float x,float y)
  {
    this.x = x;
    this.y = y;
    size = BULLET_SIZE;
    speed = BULLET_SPEED;
    bulletCollision = false;
    this.state = DEFAULT_STATE;
  }
  
  Bullet()
  {
    y = 0;
    x = 0;
    size = BULLET_SIZE;
    speed = BULLET_SPEED;
    this.state = DEFAULT_STATE;
  }
  
  void move()
  {
    if(!bulletCollision)
    {
      if(state == DEFAULT_STATE)
      {
        y = y - speed;
      }
      
      else if(state == 1)
      {
        y = y - 2*speed;
      }
    }
  }
  
  void draw()
  {
    if(y>=0 && !bulletCollision)
    {
      if(state==DEFAULT_STATE)
      {
        fill(DEFAULT_COLOR);
        rect(x,y,size,size);
      }
      if(state == 1)
      {
        fill(DEFAULT_COLOR);
        rect(x-size,y,size,size);
        rect(x+size,y,size,size);
      }
    }
  }
  
  void collide(Alien theAliens[])
  {
    if(!bulletCollision)
      for(int index = 0;index<theAliens.length;index++)
      {
        float minX = theAliens[index].getX();
        float maxX = minX + theAliens[index].getSize();
        float minY = theAliens[index].getY();
        float maxY = minY + theAliens[index].getSize();
        
        if(state == DEFAULT_STATE && !theAliens[index].isExploded())
        {
          if(x + size>=minX && x<maxX &&
            y + size>=minY && y<maxY)
            {
              theAliens[index].explode();
              bulletCollision = true;
              boom.play();
            }
        }
            
        if(state == 1 && !theAliens[index].isExploded())
        {
          if( ((x>=minX && x-size<maxX) || (x + 2*size >=minX && x + size<maxX))
            && y + size>=minY && y <maxY)
            {
              theAliens[index].explode();
              bulletCollision = true;
              boom.play();
            }
        } 
      }      
  }
  
  void collide(Shields barrier)
  {
    float minX = barrier.getX();
    float maxX = minX + barrier.getWidth();
    float minY = barrier.getY();
    float maxY = minY + barrier.getHeight();
    if(state == DEFAULT_STATE && !barrier.isHit())
    {
      if( x + size>=minX && x<maxX &&
          y + size>=minY && y<maxY)
          {
            barrier.hit();
            bulletCollision = true;
          }
    }
    
    if(state == 1 && !barrier.isHit())
    {
      if( ((x>=minX && x-size<maxX) || (x + 2*size >=minX && x + size<maxX))
            && y + size>=minY && y <maxY)
            {
              barrier.hit();
              bulletCollision = true;
            }
    }
  }
  
  float getY()
  {
    return y;
  }
  
  float getX()
  {
    return x;
  }
  
  float getSize()
  {
    return size;
  }
  
  boolean isCollided()
  {
    return bulletCollision;
  }
  
  void setSFX(SoundFile sound)
  {
    this.boom = sound; 
  }
}