PImage img;

//load in color arrays at specific location on the image
color[] myColors;

void settings() {
  img = loadImage("dui.jpg");
  size(img.width, img.height);
}

void setup() {
  //size of sketch
  myColors = new color[100];

  loadPixels();

  // We must also call loadPixels() on the PImage since we are going to read its pixels.
  img.loadPixels();
  //loop through the entire dimention of the image, read in r, g, b value at each location 
  for (int y = 0; y < height; y++ ) {
    for (int x = 0; x < width; x++ ) {
      int loc = x + y*width;
      // The functions red(), green(), and blue() pull out the three color components from a pixel.
      float r = red(img.pixels [loc]); 
      float g = green(img.pixels[loc]);
      float b = blue(img.pixels[loc]);

      // Image Processing would go here
      // If we were to change the RGB values, we would do it here, before setting the pixel in the display window.

      // Set the display pixel to the image pixel
      pixels[loc] = color(r, g, b);
    }
  }

  updatePixels();
}

void draw() {
}

void mousePressed() {
  int myX = mouseX;
  int myY = mouseY;
  //load in color arrays counting toward the right size of the mouselocation
  for (int i = 0; i<myColors.length; i++) {
    int loc = (myX+i) + myY*width;

    if (loc <= width*height) {
      color tempC = img.pixels[loc];
      myColors[i] = tempC;
    }
  }
  //println(myColors);
}

void mouseDragged() {
  //println("dragged");
  for (int i=0; i<myColors.length; i++) {
    stroke(myColors[i]);
    point(mouseX+i, mouseY);
  }
}

void keyPressed() {
  if (key == 's' || key == 'S') {
    save("s.jpg");
  }
}