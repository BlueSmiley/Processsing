final int PLAYER_WIDTH = 50;
final int DEFAULT_STATE = 0;
class Player
{
  float x;
  float y;
  PImage ship;
  PImage currentModel;
  int size;
  int state;
  Bullet ammo[];
  int fireCooldown;
  SoundFile shoot;
  
  Player()
  {
    x = 0;
    y = SCREENY-PLAYER_WIDTH;
    ship = loadImage("ship.gif");
    currentModel = ship;
    size = PLAYER_WIDTH;
    state = DEFAULT_STATE;
    ammo = new Bullet[AMMO_COUNT];
    fireCooldown = 0;
  }
  
  void move(float playerLocation)
  {
    if(playerLocation + size/2<SCREENX && playerLocation>= size/2)
    {
       this.x = playerLocation - size/2;
    }
    else if(playerLocation < size/2 )
    {
      this.x = 0;
    } 
    else
    {
      this.x = SCREENX - size;
    }
  }
  
  void draw()
  {
    image(currentModel,x,y,size,size);
  }
  
  float getX()
  {
    return x;
  }
  
  float getY()
  {
    return y;
  }
  
  int getSize()
  {
    return size;
  }
  
  int getState()
  {
    return state;
  }
  
  void changeState(int newState)
  {
    this.state = newState;
  }
  
  void cooldown()
  {
    
    if(state==1)
    {
      fireCooldown = COOLDOWN/2;
    }
    else
    {
      fireCooldown = COOLDOWN;
    }
  }
  
  void fire(Alien[] theAliens,Shields barriers[])
  {
    for(int i = 0;i<ammo.length;i++)
   {    
      if(ammo[i] == null)
      {
        if(mousePressed && fireCooldown<=0)
        {
          shoot.play();
          ammo[i] = new Bullet(getX() + getSize()/2,
              getY(),getState());
          cooldown();
        }      
      }
      else
      {
        ammo[i].move();
        ammo[i].draw();
        ammo[i].collide(theAliens);
        for(int j=0;j<barriers.length;j++)
        {
          Shields bricks[] = barriers[j].getBricks();
          for(int index = 0;index<bricks.length;index++)
          {
            ammo[i].collide(bricks[index]);
          }
        }
        if(ammo[i].getY()<=0 || ammo[i].isCollided())
        {
          ammo[i] = null;
        }
      }   
   }
   fireCooldown--;
  }
  
  Bullet[] getBullets()
  {
    return ammo;
  }
  
  void setSFX(SoundFile sound)
  {
    this.shoot = sound;
  }
}