import g4p_controls.*;
import controlP5.*;
PImage[] myEmos = new PImage[91];
boolean start=false;
ControlFrame cf;
color background;
boolean clearIt = false;
Slider2D gridControl;
float brush;
float rando;
float c3;
int timer;

void settings() {
  size(1400, 1000);
}

void setup() {

  //createWindows();
  cf = new ControlFrame(this, 400, 800, "Controls");
  surface.setLocation(420, 10);
  noStroke();
  for (int i=0; i < myEmos.length; i++) {
    myEmos [i] = loadImage( "em"+i+".png");
  }
  background(background);
}

void draw() {
float randox= random(-rando,rando);
float randoy= random(-rando,rando);
  if (mousePressed==true) {
    image(myEmos[int(brush)], mouseX-c3/2+randox, mouseY-c3/2+randoy, c3, c3);
  }

  start=true;
}

  void keyPressed() {
    if ((key == '[')&&(brush>1)) {
      brush=brush-1;
    }
    if ((key == ']')&&(brush<myEmos.length-1)) {
      brush=brush+1;
    }
    
      if ((key == ',')&&(rando>1)) {
      rando=rando-1;
    }
    if ((key == '.')&&(brush<myEmos.length-1)) {
      rando=rando+1;
    }
    
    

    if ((key == '-')&&(c3>5)) {
      c3=c3-5;
    }
    if ((key == '=')&&(c3<500-5)) {
      c3=c3+5;
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