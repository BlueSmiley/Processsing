class Screen
{
  color background;
  ArrayList widgetList;
  ArrayList checkboxList;
  ArrayList radioButtonList;
  color popupColor;
  
  Screen(color background)
  {
    this.widgetList = new ArrayList();
    this.checkboxList = new ArrayList();
    this.radioButtonList = new ArrayList();
    this.background = background;
    this.popupColor = color(255);      
  }
  
  Screen(color background,color popup)
  {
    this(background);
    this.popupColor = popup;
  }
  
  void draw()
  {
    background(this.background);
    for(int i = 0; i<widgetList.size(); i++)
    {
      Widget aWidget = (Widget)widgetList.get(i);
      if(aWidget.getHover())
        stroke(popupColor);
      aWidget.draw();
      noStroke();
    }
    
    for(int j = 0;j<checkboxList.size();j++)
    {
      Checkbox checkbox = (Checkbox)checkboxList.get(j);
      checkbox.draw();
    }
    
    for(int k = 0;k<radioButtonList.size();k++)
    {
      RadioButton radio = (RadioButton) radioButtonList.get(k);
      radio.draw();
    }
    
  }
  
  int getEvent()
  {
    //does not work if multiple buttons overlap
    int event;
    for(int i = 0; i<widgetList.size(); i++)
    {
       Widget aWidget = (Widget) widgetList.get(i);
       event = aWidget.getEvent(mouseX,mouseY);
       if(event!= EVENT_NULL)
          return event;
    }
    
    for(int j = 0;j<checkboxList.size();j++)
    {
      Checkbox checkbox = (Checkbox)checkboxList.get(j);
      event = checkbox.getEvent(mouseX,mouseY);
      if(event!= EVENT_NULL)
      {
          checkbox.toggle();
          return event;
      }
    }
    
    for(int k = 0;k<radioButtonList.size();k++)
    {
      RadioButton button = (RadioButton)radioButtonList.get(k);
      event = button.getEvent(mouseX,mouseY);
      if(event!= EVENT_NULL)
      {
        button.check();
        uncheckRadioButtons(k);
        return event;
      }
    }
    return EVENT_NULL;
  }
  
  void uncheckRadioButtons(int index)
  {
    for(int k = 0;k<radioButtonList.size();k++)
    {
      RadioButton button = (RadioButton)radioButtonList.get(k);
      if(k!=index)
      {
        button.uncheck();
      }
    }
  }
  
  void addWidget(Widget widget)
  {
    widgetList.add(widget);
  }
  
  void addCheckbox(Checkbox checkbox)
  {
    checkboxList.add(checkbox);
  }
  
  void addRadioButton(RadioButton button)
  {
    radioButtonList.add(button);
  }
  
  void popUp()
  {
    int event;
    for(int i = 0; i<widgetList.size(); i++)
    {
       Widget aWidget = (Widget) widgetList.get(i);
       event = aWidget.getEvent(mouseX,mouseY);
       switch(event) 
       {
         case EVENT_BUTTON1:
           aWidget.setHover();
           break;
         case EVENT_BUTTON2:
           aWidget.setHover();
           break;
         case EVENT_BUTTON3:
           aWidget.setHover();
           break;
         default:
           aWidget.removeHover();
           break;
       }
    }
  }
  
  void buttonPressed(int event)
  {
    switch(event)
    {
      case EVENT_BUTTON1:
        System.out.print("BOOM");
        break;
      case EVENT_BUTTON2:
        screenNumber = 1;
        display = (Screen)screenList.get(screenNumber);
        break;
      case EVENT_BUTTON3:
        screenNumber = 0;
        display = (Screen)screenList.get(screenNumber);
        break;
      default:
        break;  
    }
  }
}