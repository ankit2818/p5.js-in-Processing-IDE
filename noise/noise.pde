int cols, rows;
int w = 3500;
int h = 1600;
int scl = 20;

float flying = 0;
float[][] terrain;

void setup() {
  size(600, 600, P3D);
  cols = w / scl;
  rows = h / scl;
  terrain = new float[cols][rows];
}

void draw() {
  flying -= 0.05;
  float yoff = flying;
  for (int i = 0; i < rows; i++) {
    float xoff = 0;
    for (int j = 0; j < cols; j++) {
      terrain[j][i] = map(noise(xoff, yoff), 0, 1, -100, 100);
      xoff += 0.1;
    }
    yoff += 0.1;
  }
  
  background(0);
  stroke(255);
  noFill();
  
  translate(width / 2, height / 2 + 50);
  rotateX(PI / 3);
  translate(-w / 2, -h / 2);
  
  for (int i = 0; i < rows - 1; i++) {
    beginShape(TRIANGLE_STRIP);
    for (int j = 0; j < cols; j++) {
      vertex(j * scl, i * scl, terrain[j][i]);
      vertex(j * scl, (i + 1) * scl, terrain[j][i + 1]);
    }
    endShape();
  } 
  
}
