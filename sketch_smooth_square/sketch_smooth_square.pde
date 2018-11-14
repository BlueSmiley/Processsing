int squareCoordinateX = 0;
int squareCoordinateY = 250;
int squareDimension = 100;
void setup()
{
  size(500,500);
  background(255);
  fill(0);
  noStroke();
}

void draw()
{
  background(255);
  if(squareCoordinateX>500)
  {
    squareCoordinateX = 0;
  }
  
  if(squareCoordinateX + squareDimension > 500)
  {
    rect(squareCoordinateX,squareCoordinateY,500 - squareCoordinateX,squareDimension);
    rect(0,squareCoordinateY,squareDimension - (500 - squareCoordinateX),squareDimension);
    squareCoordinateX++;
  }
  
  else
  {
    rect(squareCoordinateX,squareCoordinateY,squareDimension,squareDimension);
    squareCoordinateX++;
  }
}