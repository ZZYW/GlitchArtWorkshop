import processing.video.*;

Capture video;
PImage img;
float threshold;
float threshold2;

void setup() {
  fullScreen();
  //size(640, 480);
  video = new Capture(this, width, height);
  video.start();
  colorMode(HSB);
  threshold = 70;
  threshold2 = 140;
}

void draw() {
  image(video, 0, 0 );

  //filter
  for (int i = 0; i < width; i++)
  {
    for (int j = 0; j < height; j++)
    {
      color px = video.get(i, j);     
      color c = color(0);
      if (brightness(px) < threshold ){
        c = color(15, 255, 255);
      }else if(brightness(px) >= threshold && brightness(px)<threshold2){
        c = color(30, 255, 255);
      }else{
        c = color(100, 255, 255);
      }
      set(i, j, c);
    }
  }
}

void captureEvent(Capture c) {
  c.read();
}