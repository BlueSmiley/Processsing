final float DEFAULT_FREQUENCY = 1/(8*TWO_PI);
class Alien
{
  final int DEFAULT_SPEED = 1;
  final float SPEED_RATE = 1.2;
  final float EXPLOSION_TIME = 15;
  
  
  Upgrade powerup;
  float x;
  float y;
  int size;
  float dx;
  float dy;
  boolean exploded;
  PImage alien;
  PImage explodingAlien;
  PImage currentImage;
  PImage sinAlien;
  float frequency;
  float amplitude;
  float heightCounter;
  int framesAfterExplosion;
  int state;
  Bomb alienBomb;
  
  Alien(int x,int y,int size)
  {
    this.x = x; 
    this.y = y;
    this.size = size;
    dx = DEFAULT_SPEED;
    exploded = false;
    alien = loadImage("alien.gif");
    explodingAlien = loadImage("exploding_alien.gif");
    sinAlien = loadImage("sinusoid_alien.gif");
    currentImage = alien;
    dy = 0;
    frequency = 0;
    amplitude = 0;
    heightCounter = 0;
    framesAfterExplosion = 0;
    state = 0;
  }
  
  Alien(int x,int y,int size,float frequency)
  {
    this(x,y,size);
    currentImage = sinAlien;
    this.frequency = frequency;
    amplitude = (GAP-1)/2;
    state = 1;
  }
  
  void move()
  {
    if(exploded!= true)
    {
      if(x + size<SCREENX && x >=0)
      {
        dy = sin(TWO_PI*frequency*x)*amplitude;
        x = x + dx;
        heightCounter = 0;
      }
      else if(heightCounter < size + GAP)
      {
        heightCounter++;
        y++;
      }
      else{
        dx = -dx;
        x = x + dx;
        
        dy = -dy;
        dx = SPEED_RATE * dx;
      } 
    }
    dropBomb();
  }
  
  void draw()
  {
    if(framesAfterExplosion<EXPLOSION_TIME)
    {
      image(currentImage,x,y+dy,size,size);
    }
    if(exploded)
    {
      framesAfterExplosion++;
    }
  }
  
  void explode()
  {
      currentImage = explodingAlien;
      exploded = true;
      if(state>0)
      {
        powerup = new Upgrade(x,y,state);
      }
  }
  
  float getX()
  {
    return x;
  }
  
  float getY()
  {
    return y;
  }
  
  float getSize()
  {
    return size;
  }
  
  boolean isExploded()
  {
    return exploded;
  }
  
  void dropUpgrade(Player thePlayer)
  {
    if(getState()>0)
    {
      powerup.move();
      powerup.draw();
      powerup.collide(thePlayer);
    }
  }
  
  int getState()
  {
    return state;
  }
  
  boolean bombDropped()
  {
    if(alienBomb!= null)
    {
      return true;
    }
    return false;
  }
  
  void dropBomb()
  {
    if(!isExploded())
    {
      if(alienBomb==null || alienBomb.getY()>SCREENY || alienBomb.isDestroyed())
      {
        if((int)random(0,200)==0)
          alienBomb = new Bomb(this.getX(),this.getY());
      }
      if(alienBomb!=null)
      {
        alienBomb.move();
        alienBomb.draw();
      }
    }
    else if(alienBomb!= null)
    {
      alienBomb.move();
      alienBomb.draw();
    }
  }
  
  Bomb getBomb()
  {
    return alienBomb;
  }
  
}