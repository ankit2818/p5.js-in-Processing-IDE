float[] values;
int i = 0;
int j = 0;
void setup() {
  size(1000, 800);
  values = new float[width/4];
  for (int i = 0; i < values.length; i++) {
    values[i] = random(height);
  }
  //values = sort(values);

  //for (int i = 0; i < values.length; i++) {
  //  for (int j = 0; j < values.length -i -1; j++) {

  //  }
  //}
}

void draw() {
  background(0);
  for (int k = 0; k < values.length; k++) {
    stroke(255);
    strokeWeight(2);
    line(k*4, height, k*4, height - values[k]);
  }

  float a = values[j];
  float b = values[j+1];
  if (a > b) {
    swap(values, j, j+1);
  }
  if (i < values.length) {
    j++;
    if (j >= values.length - i - 1) {
      j = 0;
      i++;
    }
  } else {
    println("Finished!!!");
    noLoop();
  }

  
}

void swap(float[] arr, int a, int b) {
  float temp = arr[a];
  arr[a] = arr[b];
  arr[b] = temp;
}
