int squareWidth = 100;
int xLeftSquare = 250;
int yLeftSquare = 100;
int xRightSquare = 250;
int yRightSquare = 300;

void setup()
{
  size(500,500);
  fill(0);
}

void draw()
{
  background(255);
  if(xLeftSquare<0-squareWidth)
  {
    xLeftSquare = 500 - squareWidth;
  }
  
  if(xLeftSquare<0)
  {
    rect(0,yLeftSquare,squareWidth+xLeftSquare,squareWidth);
    rect(500+xLeftSquare,yLeftSquare,-xLeftSquare,squareWidth);
  }
  else
  {
    rect(xLeftSquare,yLeftSquare,squareWidth,squareWidth);
  }
  xLeftSquare--;
  
  if(xRightSquare>500)
  {
    xRightSquare = 0;
  }
  
  if(xRightSquare + squareWidth>500)
  {
    rect(xRightSquare,yRightSquare,500-xRightSquare,squareWidth);
    rect(0,yRightSquare,squareWidth-(500-xRightSquare),squareWidth);  
  }
  else
  {
    rect(xRightSquare,yRightSquare,squareWidth,squareWidth);
  }
  xRightSquare++;
}