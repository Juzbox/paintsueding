import controlP5.*;
//import ddf.minim.*;
//import ddf.minim.analysis.*;
import spout.*;

PImage[] myEmos = new PImage[8];
boolean start=false;
ControlFrame cf;
color background;
boolean clearIt = false;
Slider2D gridControl;
float brush;
float rando;
float c3;
int timer;
int soundFactor;

float a;

float soundForce=1;
//boolean music = true;
boolean rotate=false;

//Minim minim;
//AudioPlayer groove;
//BeatDetect beat;

//AudioInput in;

//AudioSample kick;
//AudioSample snare;

Spout spout;

void settings() {
  size(1500, 850);
 
}

void setup() {
 //textureMode(NORMAL);
  //createWindows();
  cf = new ControlFrame(this, 400, 800, "Controls");
  surface.setLocation(420, 10);
  noStroke();
  for (int i=0; i < myEmos.length; i++) {
    myEmos [i] = loadImage( "em"+i+".png");
  }
  background(background);

 // minim = new Minim(this);
 // groove = minim.loadFile("groove.mp3", 1024);
  //groove.loop();

  //minim.debugOn();
  //in = minim.getLineIn(Minim.STEREO, 512);
 // in = minim.getLineIn(Minim.STEREO, 512);

  // a beat detection object song SOUND_ENERGY mode with a sensitivity of 10 milliseconds
 // beat = new BeatDetect();


 // spout = new Spout(this);
 // spout.createSender("Spout Processing");
}

void draw() {
  //beat.detect(groove.mix);
  //if (music == true) {
  //  soundForce=soundFactor*groove.right.level();
  //} else {
  //  soundForce=1;
  //}
  float randox= random(-rando-soundForce, rando+soundForce);
  float randoy= random(-rando-soundForce, rando+soundForce);



  if (mousePressed==true) {
    pushMatrix(); 
    translate(mouseX, mouseY);
    rotate(radians(a));
    imageMode(CENTER);
    image(myEmos[int(brush)], randox, randoy, c3+soundForce, c3+soundForce);
    popMatrix();
  }

  start=true;
  println(rotate);
 // spout.sendTexture();
}

void keyPressed() {
  if ((key == '[')&&(brush>1)) {
    brush=brush-1;
  }
  if ((key == ']')&&(brush<myEmos.length-1)) {
    brush=brush+1;
  }

  if ((key == ',')&&(rando>1)) {
    rando=rando-3;
  }
  if ((key == '.')&&(brush<myEmos.length-1)) {
    rando=rando+3;
  }



  if ((key == '-')&&(c3>5)) {
    c3=c3-10;
  }
  if ((key == '=')&&(c3<500-5)) {
    c3=c3+10;
  }




  //if ((key == 'm')&&(music==true)) {
  //  music=false;
  //} 



  if ((key == 'r')&&(rotate==true)) {
    rotate=false;
  } else {
    rotate=true;
  }

  if ((key == 'r' || key == 'R')&&(a<=1440-2)) {
    a=a+4;
  } 
  if ((key == 'e' || key == 'E')&&(a>=2)) {
    a=a-4;
  } 

  if ((key == 'c' || key == 'C')&&(clearIt==false)) {
    clearIt = true;
    background(background);
  } else {
    clearIt=false;
  }


  if (key == 's' || key == 'S') {
    loadPixels();
    for (int i = 10; i < width*height-10; i++) {
      pixels[i] = pixels[i+int(random(-10, 10))];
    }
    updatePixels();
  }
}
