int squareWidth = 100;
int xLeftSquare = 250;
int yLeftSquare = 100;
int xRightSquare = 250;
int yRightSquare = 300;
float period = 50;
float increment = TWO_PI/period;
float radians = 0;
float movement = 0;
int amplitude = 100;
float altMovement = 0;

void setup()
{
  size(500,500);
  fill(0);
}

void draw()
{
  movement = sin(radians)*amplitude;
  altMovement = sin(radians +1)*amplitude;
  radians = radians + increment;
  background(255);
  fill(random(256),random(256),random(256),random(256));
  
  if(xLeftSquare<0-squareWidth)
  {
    xLeftSquare = 500 - squareWidth;
  } 
  if(xLeftSquare<0)
  {
    rect(0,yLeftSquare+movement,squareWidth+xLeftSquare,squareWidth);
    rect(500+xLeftSquare,yLeftSquare+movement,-xLeftSquare,squareWidth);
  }
  else
  {
    rect(xLeftSquare,yLeftSquare+movement,squareWidth,squareWidth);
  }
  xLeftSquare = xLeftSquare - 2;
  
  fill(random(256),random(256),random(256),random(256));
  
  if(xRightSquare>500)
  {
    xRightSquare = 0;
  } 
  if(xRightSquare + squareWidth>500)
  {
    rect(xRightSquare,yRightSquare+altMovement,500-xRightSquare,squareWidth);
    rect(0,yRightSquare+altMovement,squareWidth-(500-xRightSquare),squareWidth);  
  }
  else
  {
    rect(xRightSquare,yRightSquare+altMovement,squareWidth,squareWidth);
  }
  xRightSquare = xRightSquare + 2;
}