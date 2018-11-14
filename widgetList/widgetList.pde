PFont stdFont;

final int EVENT_BUTTON1=1;
final int EVENT_BUTTON2=2;
final int EVENT_BUTTON3=3;

final int EVENT_NULL=0;
Widget widget1, widget2, widget3;
ArrayList widgetList;
color baseColor;


void setup(){
  stdFont=loadFont("Calibri-18.vlw");
  textFont(stdFont);
  baseColor = color(0);

  widget1=new Widget(100, 100, 180, 40,
            "red", color(255,0,0),stdFont, EVENT_BUTTON1);
  widget2=new Widget(100, 200, 180, 40,
            "green", color(0,255,0),stdFont, EVENT_BUTTON2);
  widget3 = new Widget(100, 300, 180, 40,
            "blue", color(0,0,255),stdFont, EVENT_BUTTON3);
  size(400, 400);
  
  widgetList = new ArrayList();
  widgetList.add(widget1); widgetList.add(widget2);widgetList.add(widget3);

}

void draw()
{
  background(0);
  fill(baseColor);
  rect(90,90,200,260);
  drawWidgets(widgetList);
}

void drawWidgets(ArrayList widgetList)
{
   for(int i = 0; i<widgetList.size(); i++)
  {
    Widget aWidget = (Widget)widgetList.get(i);
    aWidget.draw();
  }
}

void mousePressed(){
  int event;
  
  for(int i = 0; i<widgetList.size(); i++){
	Widget aWidget = (Widget) widgetList.get(i);
       event = aWidget.getEvent(mouseX,mouseY);
       switch(event) 
       {
         case EVENT_BUTTON1:
           println("button 1!");
           baseColor = color(255,0,0);
           break;
         case EVENT_BUTTON2:
           println("button 2!");
           baseColor = color(0,255,0);
           break;
         case EVENT_BUTTON3:
           println("button 3!");
           baseColor = color(0,0,255);
           break;
         default:
           break;
       }  
  }
}