class ControlFrame extends PApplet {

  int w, h;
  PApplet parent;
  ControlP5 cp5;


  public ControlFrame(PApplet _parent, int _w, int _h, String _name) {
    super();   
    parent = _parent;
    w=_w;
    h=_h;
    PApplet.runSketch(new String[]{this.getClass().getName()}, this);
  }

  public void settings() {
    size(w, h);
  }

  public void setup() {
    surface.setLocation(10, 10);
    cp5 = new ControlP5(this);

    cp5.addSlider("RANDOMIZER")
      .plugTo(parent, "rando")
      .setRange(0, 200)
      .setValue(0)
      .setPosition(120, h-210)
      .setSize(200, 30);

    cp5.addSlider("SIZE")
      .plugTo(parent, "c3")
      .setRange(10, 500)
      .setValue(50)
      .setPosition(120, h-250)
      .setSize(200, 30);

    cp5.addSlider("IMAGE")
      .plugTo(parent, "brush")
      .setRange(0, myEmos.length-1)
      .setValue(22)
      .setPosition(30, h-170)
      .setSize(290, 30);

    cp5.addColorWheel("COLOR", 30, h-250, 80 ).setRGB(color(128, 0, 255)).setCaptionLabel("");
  }


  void draw() {
    background=color(cp5.get(ColorWheel.class, "COLOR").getRGB());
    background=color(background);
    background(background);

    //text("Cleared is " + clearIt, 30, h-10);

    if (start==true) {
      image(myEmos[int(brush)], w/2-c3/2, 200-c3/2, c3, c3);
    }
    cp5.getController("IMAGE").setValue(brush); 
    cp5.getController("SIZE").setValue(c3);
    cp5.getController("RANDOMIZER").setValue(rando);

    text("Press C to clear the canvas and apply the", 30, h-115);
    text("new background color", 30, h-95);
    text("Use [ and ] to change the emoji", 30, h-75);
    text("Use - and = to change its size", 30, h-55);
    text("Press S to smudge the image", 30, h-35);
  }
}