//credit to Taito the original creators of Space invaders and 
//http://www.classicgaming.cc/classics/space-invaders/sounds for sounds
//also to Nintendo for theme played
import processing.sound.*;


Alien theAliens[];
Player thePlayer;
Shields barriers[];
SoundFile boom;
SoundFile shoot;
SoundFile theme;
SoundFile explode;

void settings(){
  size(SCREENX,SCREENY);
}

void setup()
{
  background(0);
  theAliens = new Alien[NUMBER_OF_ALIENS];
  initialiseArray(theAliens);
  thePlayer = new Player();
  barriers = new Shields[SCREENX/((BRICK_WIDTH*BRICK_COLUMNS)+SHIELD_GAP)];
  makeShields(barriers);
  boom = new SoundFile(this,"invaderkilled.wav");
  shoot = new SoundFile(this,"shoot.wav");
  theme = new SoundFile(this,"Super Mario Bros. medley.mp3");
  explode = new SoundFile(this,"explosion.wav");
  theme.loop();
  shootSound(thePlayer,shoot);
  frameRate(60);
}

void draw()
{
  background(0);
  thePlayer.move(mouseX);
  thePlayer.draw();
  thePlayer.fire(theAliens,barriers);
  hitSound(thePlayer,boom);
  movingAliens(theAliens);
  checkingForUpgrade(thePlayer,theAliens);
  bombCollision(theAliens,thePlayer,barriers);
  drawBarriers(barriers);
  if(checkDead(theAliens))
  {
    text("You Win",SCREENX/2,SCREENY/2);
    theme.stop();
    noLoop();
  }
  
}

void initialiseArray(Alien theAliens[])
{
  for(int i = 0;i<theAliens.length;i++)
  {
     if(i%6 == 3)
    {
      theAliens[i] = 
      new Alien(i*GAP + i*ALIEN_SIZE,START_Y + GAP,ALIEN_SIZE,DEFAULT_FREQUENCY);
    }
    else
    {
    theAliens[i] = 
      new Alien(i*GAP + i*ALIEN_SIZE,START_Y + GAP,ALIEN_SIZE);
    }
  }
}

void movingAliens(Alien theAliens[])
{
  for(int i = 0;i<theAliens.length;i++)
  {
    theAliens[i].draw();
    theAliens[i].move();
  }
}

void checkingForUpgrade(Player thePlayer,Alien theAliens[])
{
  for(int i = 0;i<theAliens.length;i++)
  {
    if(theAliens[i].isExploded() && theAliens[i].getState()>0)
    {
      theAliens[i].dropUpgrade(thePlayer);
    }
  }
}

void bombCollision(Alien theAliens[],Player thePlayer,Shields barriers[])
{
  for(int i =0;i<theAliens.length;i++)
  {
    Bomb alienBomb = theAliens[i].getBomb();
    if(alienBomb!=null)
    {
      for(int index=0;index<barriers.length;index++)
      {
        Shields shield = barriers[index];
        shieldCheck(shield,alienBomb);
      }
    }
    if(alienBomb!=null && alienBomb.collision(thePlayer))
    {
      explode.play();
      text("GAME OVER",SCREENX/2,SCREENY/2);
      theme.stop();
      noLoop();
    }
  }
}

boolean checkDead(Alien theAliens[])
{
  boolean dead = true;
  for(int i =0;i<theAliens.length;i++)
  {
    if(!theAliens[i].isExploded())
    {
      dead = false;
    }
  }
  return dead;
}

void shieldCheck(Shields barrier,Bomb alienBomb)
{
  Shields brick[] = barrier.getBricks();
  for(int i=0;i<brick.length;i++)
  {
    alienBomb.shieldCollision(brick[i]);
  }
}

void makeShields(Shields barriers[])
{
  for(int i=0;i<barriers.length;i++)
  {
    barriers[i] = new Shields(((BRICK_WIDTH*BRICK_COLUMNS*i)+(SHIELD_GAP*(i+1))),
    SCREENY/1.5,BRICK_COLUMNS,BRICK_ROWS);
    barriers[i].makeMany();
  }
}

void drawBarriers(Shields barriers[])
{
  for(int i=0;i<barriers.length;i++)
      barriers[i].drawMany();
}

void hitSound(Player thePlayer,SoundFile boom)
{
  Bullet[] ammo = thePlayer.getBullets();
  for(int i=0;i<ammo.length;i++)
  {
    if(ammo[i]!= null)
      ammo[i].setSFX(boom);
      
  }
}

void shootSound(Player thePlayer,SoundFile shoot)
{
  thePlayer.setSFX(shoot);
}