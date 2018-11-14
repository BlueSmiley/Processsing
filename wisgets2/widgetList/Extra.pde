class Checkbox extends Widget
{
  color unchecked;
  color checked;
  color currentColor;
  
  Checkbox(int x,int y, int width, int height, String label,
    color widgetColor, PFont widgetFont, int event)
  {
    super(x,y,width,height,label,widgetColor,widgetFont,event);
    checked = color(0);
    unchecked = color(255);
    currentColor = unchecked;
  }
  
  void draw()
  {
    fill(widgetColor);
    rect(x,y,width,height);
    
    fill(labelColor);
    text(label, x+10, y+height-10);
    
    fill(currentColor);
    rect(x+width-20,y+height/2,10,10);
  }
  
  void toggle()
  {
    if(currentColor==unchecked)
      currentColor = checked;
     else
       currentColor = unchecked;
  }
     
}

class RadioButton extends Widget
{
  boolean checked;
  
  RadioButton(int x,int y, int width, int height, String label,
    color widgetColor, PFont widgetFont, int event)
  {
    super(x,y,width,height,label,widgetColor,widgetFont,event);
    checked = false;
  }
  
  void draw()
  {
    if(checked)
      stroke(0);
    super.draw();
    noStroke();
  }
  
  void uncheck()
  {
    checked = false;
  }
  
  void check()
  {
    checked = true;
  }
}