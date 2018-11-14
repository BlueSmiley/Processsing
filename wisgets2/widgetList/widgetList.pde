PFont stdFont;

final int EVENT_BUTTON1=1;
final int EVENT_BUTTON2=2;
final int EVENT_BUTTON3=3;
final int EVENT_BUTTON4 = 4;
final int EVENT_BUTTON5 = 5;

final int EVENT_NULL=0;

Widget widget1, widget2, widget3;
Checkbox checkbox1;
RadioButton radio1,radio2;
ArrayList screenList;
int screenNumber;
Screen display;


void setup(){
  stdFont=loadFont("Calibri-18.vlw");
  textFont(stdFont);
  screenNumber = 0;
  size(500, 500);
  
  screenList = new ArrayList();
  makeScreens(screenList);
  display = (Screen)screenList.get(screenNumber);
}

void draw()
{
  display.draw();
}

void mouseMoved()
{
  display.popUp();
}

void mousePressed()
{
  int event = display.getEvent();
  display.buttonPressed(event);
}


void makeScreens(ArrayList screenList)
{
  
  widget1=new Widget(100, 100, 180, 40,
            "Button", color(100),stdFont, EVENT_BUTTON1);
  widget2=new Widget(100, 200, 180, 40,
            "Forward", color(100),stdFont, EVENT_BUTTON2);
  widget3 = new Widget(100, 300, 180, 40,
            "Backward", color(100),stdFont, EVENT_BUTTON3);
            
  checkbox1 = new Checkbox(100, 400, 180, 40,
            "click", color(100),stdFont, EVENT_BUTTON4);
            
  radio1 = new RadioButton(10, 10, 180, 40,
            "Analog", color(100),stdFont, EVENT_BUTTON5);
  radio2 = new RadioButton(width/2, 10, 180, 40,
            "Digital", color(100),stdFont, EVENT_BUTTON5);
            
            
  Screen screen1 = new Screen(0);
  Screen screen2 = new Screen(255,0);
  
  screen1.addWidget(widget1);
  screen2.addWidget(widget1);
  screen1.addWidget(widget2);
  screen2.addWidget(widget3);
  screen1.addCheckbox(checkbox1);
  screen2.addRadioButton(radio1);
  screen2.addRadioButton(radio2);
  
  screenList.add(screen1);
  screenList.add(screen2);
  
}