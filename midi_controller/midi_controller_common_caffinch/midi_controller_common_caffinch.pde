//midi controller prototype
//common caffinch calls

import processing.sound.*;

ArrayList<SoundFile> soundFile = new ArrayList<SoundFile>();

int value = 0;
boolean pressed = false;

void setup() {
  size(640, 360);
  background(255);

  // Load a soundfile from the /samples_library
  soundFile.add(new SoundFile(this, "common_caffinch-001.wav"));  
  soundFile.add(new SoundFile(this, "common_caffinch-002.wav"));  
  soundFile.add(new SoundFile(this, "common_caffinch-003.wav"));
  soundFile.add(new SoundFile(this, "common_caffinch-004.wav"));
  soundFile.add(new SoundFile(this, "common_caffinch-005.wav")); 
  soundFile.add(new SoundFile(this, "common_caffinch-006.wav")); 
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
  
   if (keyCode == '1' && pressed == true){
    pressed = false;  
  }
  
   if (keyCode == '2' && pressed == true){
    pressed = false;  
  }
  
   if (keyCode == '3' && pressed == true){
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


 if (keyCode == '1' && pressed == false) {
    stopAll();
    soundFile.get(3).play();
    pressed = true;
  }
  
  if (keyCode == '2' && pressed == false) {
    stopAll();
    soundFile.get(4).play();
    pressed = true;
  }
  
  if (keyCode == '3' && pressed == false) {
    stopAll();
    soundFile.get(5).play();
    pressed = true;
  }
}

void stopAll() {
  for (int i = 0; i >soundFile.size(); i++){
    soundFile.get(i).stop();
  }
}