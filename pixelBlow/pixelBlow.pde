import processing.sound.*;

AudioIn input;
Amplitude rms;
PImage img;

void settings() {
  img = loadImage("renee7.jpg");
  size(img.width, img.height);
}

void setup() {
  background(255);
  input = new AudioIn(this, 0);
  rms = new Amplitude(this);
  input.start();
  rms.input(input);
}

void draw() {
  float vol = rms.analyze();
  for (int x = 0; x < img.width; x+=2) {
    for (int y = 0; y < img.height; y+=2) {
      int loc = x + y * img.width;
      stroke(img.pixels[loc]);
      point(x + vol * random(1000), y);
    }
  }
}