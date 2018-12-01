PImage img, sorted;
int i = 0;

void setup() {
  size(1314, 657);
  img = loadImage("sunflower.jpg");
  sorted = createImage(img.width, img.height, RGB);
  //img.loadPixels();
  //for (int i = 0; i < img.pixels.length; i++){
  //  sorted.pixels[i] = img.pixels[i];
  //}

  sorted = img.get();
  sorted.loadPixels();
}
void draw() {
  println(frameRate);

  for (int n = 0; n < 100; n++) {
    float record = -1;
    int selectedPixel = i;
    for (int j = i; j < sorted.pixels.length; j++) {
      color pix = sorted.pixels[j];
      float b = brightness(pix);
      if (b > record) {
        selectedPixel = j;
        record = b;
      }
      color temp = sorted.pixels[i];
      sorted.pixels[i] = sorted.pixels[selectedPixel];
      sorted.pixels[selectedPixel] = temp;
    }

    if (i < sorted.pixels.length) {
      i++;
    }
  }


  sorted.updatePixels();

  image(img, 0, 0);
  image(sorted, img.width, 0);
}
