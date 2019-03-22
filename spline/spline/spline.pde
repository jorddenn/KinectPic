PImage img;
Point[][] pnt;
int current = 0;
Table table;

String image = "image5";

void setup() {
  img = loadImage(image + ".jpg");

  size (200, 200);
  surface.setResizable(true);
  surface.setSize(img.width, img.height);

  table = loadTable(image + ".csv");

  pnt = new Point[table.getRowCount() / 2][table.getColumnCount()];

  for (int r = 0; r < table.getRowCount()/ 2; r ++) {
    for (int c = 0; c < table.getColumnCount(); c ++) {
      pnt[r][c] = new Point(table.getFloat(r, c), table.getFloat(r + 1, c));
    }
  }
  
}

void draw() {
  background(255);
  image(img, 0, 0);
  frameRate(0);
  
  stroke(0);
  strokeWeight(2);
  
  current = (current + 1) % (table.getRowCount() / 2);
  
  for(current = 0; current < table.getRowCount() / 2; current++){
  for (int i = 0; i < 19; i++){
    line(pnt[current][i].x, pnt[current][i].y, pnt[current][i + 1].x, pnt[current][i + 1].y);
  }
  }
}
