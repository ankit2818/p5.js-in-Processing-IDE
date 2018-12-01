import processing.pdf.*;

String pi;

void setup() {
  size(1000, 1000, PDF, "bookofpi10million.pdf");
  PGraphicsPDF pdf = (PGraphicsPDF) g;  // Get the renderer
  pi = loadStrings("millionPI.txt")[0];

  int cols = 100;
  int rows = 100;

  //beginDraw();
  float w = float(width)/cols;
  float h = float(height)/rows;
  int index = 0;

  int totalPages = pi.length() / (cols*rows);
  println(totalPages);

  for (int i = 0; i < totalPages; i++) {

    for (float y = 0; y < height; y += h) {
      for (float x = 0; x < width; x += w) {
        String s = "" + pi.charAt(index);
        int digit = int(s);
        float bright = map(digit, 0, 9, 0, 255);
        fill(bright);
        noStroke();
        rect(x, y, w, h);
        fill(255-bright);
        textAlign(CENTER, CENTER);
        text(digit, x+w/2, y+h/2);
        index++;
        if (index >= pi.length()) {
          index = pi.length() - 1;
        }
      }
    }
    println("Page " + i + " complete!");
    pdf.nextPage();
  }
  println("Finished");
  exit();
  //endRecord();
}
