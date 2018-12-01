PImage img;

void setup() {
  size(1205, 418);
  background(0);
  img = loadImage("image.jpg");
  //img.filter(GRAY);
  image(img, 0, 0);
}

void draw() {
  img.loadPixels();
  for (int x = 0; x < img.width; x++) {
    for (int y = 0; y < img.height; y++) {
      int index = x + y * img.width;
      color pix = img.pixels[index];

      float r = red(pix);
      float g = green(pix);
      float b = blue(pix);

      // Only 0 or 255 color
      //r = round(r / 255) * 255;
      //g = round(g / 255) * 255;
      //b = round(b / 255) * 255;

      r = round(4 * r / 255) * (255/4);
      g = round(4 * g / 255) * (255/4);
      b = round(4 * b / 255) * (255/4);

      img.pixels[index] = color(r, g, b);
    }
  }
  img.updatePixels();
  image(img, 605, 0);

  // To save frames
  //saveFrame("a.jpg");
}
