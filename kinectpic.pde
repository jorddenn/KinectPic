import org.openkinect.freenect.*;
import org.openkinect.processing.*;

Kinect kinect;

Table table;
TableRow row;

void setup() {
  background(0);
  frameRate(15);
  size(1280, 480);

  kinect = new Kinect(this);
  kinect.initVideo();
  kinect.initDepth();

  table = new Table();
}

void mousePressed(){
  PImage imageKinect = kinect.getVideoImage();
  int[] depth = kinect.getRawDepth();

  for (int col = 0; col < 640; col++) {
    table.addColumn(str(col), Table.INT);
  }
  for (int row = 0; row < 480; row++) {
    table.addRow();
  }

  for (int col = 0; col < 640; col++) {
    for (int row = 0; row < 480; row++) {
      table.setInt(row, col, depth[col + 640 * row]);
    }
  }

  saveTable(table, "depth.csv");
  imageKinect.save("image.jpg");
}

void draw(){
  image(kinect.getVideoImage(), 0, 0);
  image(kinect.getDepthImage(), 640, 0);
}
