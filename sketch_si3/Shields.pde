class Shields
{
  float x;
  float y;
  int width;
  int height;
  int xNumber;
  int yNumber;
  Shields brick[];
  boolean hit;
  
  
  Shields(float xpos,float ypos)
  {
    x = xpos;
    y = ypos;
    height = BRICK_HEIGHT;
    width = BRICK_WIDTH;
    xNumber = 1;
    yNumber = 1;
    hit = false;
  }
  
  Shields(float xpos,float ypos,int xSize,int ySize)
  {
    this(xpos,ypos);
    xNumber = xSize;
    yNumber = ySize;
  }
  
  void draw()
  {
    if(!hit)
    {
      fill(20,150,200);
      rect(x,y,width,height);
    }
  }
  
  void makeMany()
  {
    brick = new Shields[yNumber*xNumber];
    for(int i=0;i<yNumber;i++)
    {
      for(int index=0;index<xNumber;index++)
      {
        brick[(i*xNumber)+index]=new Shields(
        x+((index+1)*width), y+((i+1)*height));
      }
    }
  }
  
  void drawMany()
  {
    
      for(int i=0;i<brick.length;i++)
      {
        brick[i].draw();
      }
  }
  
  void hit()
  {
    hit = true;
  }
  
  float getX()
  {
    return x;
  }
  
  float getY()
  {
    return y;
  }
  
  float getWidth()
  {
    return width;
  }
  
  float getHeight()
  {
    return height;
  }
  
  Shields[] getBricks()
  {
    return brick;
  }
  
  boolean isHit()
  {
    return hit;
  }
}