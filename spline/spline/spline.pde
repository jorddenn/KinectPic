PImage img;
Point[][] pnt;
int current = 0;
Table table;

String image = "image1";

void setup() {
  img = loadImage(image + ".jpg");

  size (200, 200);
  surface.setResizable(true);
  surface.setSize(img.width, img.height);

  table = loadTable(image + ".csv");

  pnt = new Point[table.getRowCount() / 2][table.getColumnCount()];

  for (int r = 0; r < table.getRowCount()/ 2; r += 2) {
    for (int c = 0; c < table.getColumnCount(); c ++) {
      pnt[r][c] = new Point(table.getFloat(r, c), table.getFloat(r + 1, c));
    }
  }
  
  pnt[0][0].toString();
}

void draw() {
  background(255);
  //image(img, 0, 0);
  
  stroke(255);
  
  current = (current + 1) % (table.getRowCount() / 2);
  
  for (int i = 0; i < 19; i++){
    println("1");
    line(pnt[current][i].x, pnt[current][i].y, pnt[current][i + 1].x, pnt[current][i + 1].y);
  }
}
