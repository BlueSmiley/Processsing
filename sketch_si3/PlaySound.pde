//credit to Taito the original creators of Space invaders and 
//http://www.classicgaming.cc/classics/space-invaders/sounds for sounds

static class PlaySound
{
  SoundFile boom;
  
  PlaySound(PApplet p)
  {
    boom = new SoundFile(p,"invaderkilled.wav");
  }
  
  void playBoom()
  {
    boom.play();
  }
  
}