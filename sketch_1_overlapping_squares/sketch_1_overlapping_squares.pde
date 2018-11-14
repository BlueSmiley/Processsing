int firstSquareX = 100;
int firstSquareY = 100;
int squareDimensions = 100;
int transalation = squareDimensions/2;
size(500,500);
background(255);  //to define colour of background
stroke(0);  //set line drawing colour to white
for(int repeat = 0;repeat<3;repeat++)
{
fill(0,0,0 + (50*repeat),255 - (64*repeat));
rect(firstSquareX + (repeat*transalation),firstSquareY + (repeat*transalation),squareDimensions,squareDimensions);
}