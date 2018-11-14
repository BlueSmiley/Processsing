int x = 0;
void setup()
{
  size(500,500);
}

void draw()
{
  background(0);
  rect(x,250,100,100);
  x++;
  if(x==500)
  {
    x=0;
  }
}