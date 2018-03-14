//midi controller prototype
//sparrowhawk calls

import processing.sound.*;

ArrayList<SoundFile> soundFile = new ArrayList<SoundFile>();

int value = 0;
boolean pressed = false;

void setup() {
  size(640, 360);
  background(255);

  // Load a soundfile from the /samples_library
  soundFile.add(new SoundFile(this, "warning_calls-001.wav"));  
  soundFile.add(new SoundFile(this, "warning_calls-002.wav"));  
  soundFile.add(new SoundFile(this, "warning_calls-003.wav"));
  //file.play();
}      

void draw() {
   
}

void keyReleased(){
  if (keyCode == 'E' && pressed == true){
    pressed = false; 
  }
  
   if (keyCode == 'W' && pressed == true){
    pressed = false;  
  }
  
   if (keyCode == 'Q' && pressed == true){
    pressed = false;  
  }
  
}

void keyPressed() {
  if (keyCode == 'E' && pressed == false) {
    stopAll();
    soundFile.get(0).play();
    pressed = true;
  }

  if (keyCode == 'W' && pressed == false) {
    stopAll();
    soundFile.get(1).play();
    pressed = true;
  }


 if (keyCode == 'Q' && pressed == false) {
    stopAll();
    soundFile.get(2).play();
    pressed = true;
  }
 
}

void stopAll() {
  for (int i = 0; i >soundFile.size(); i++){
    soundFile.get(i).stop();
  }
}