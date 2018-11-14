Player thePlayer; 
void settings(){ 
  size(SCREENX, SCREENY); 
} 
void setup(){ 
thePlayer = new Player(SCREENY-MARGIN-
PADDLEHEIGHT); 
} 
void draw() { 
background(0); 
thePlayer.move(mouseX); 
thePlayer.draw(); 
}