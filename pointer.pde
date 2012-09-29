import de.looksgood.ani.*;
import de.looksgood.ani.easing.*;

int pointCount;
Point[] points = new Point[10];

int lineCount;
Line[] lines = new Line[10];

float oldMouseX, oldMouseY;

Point selection; 

void setup() {
  size(640, 640);
  frameRate(60);
  smooth();  
  background(0);
  
  Ani.init(this);
}

void draw() {
  smooth();  
  background(0);
  
  for(int i = 0; i < pointCount; i++) {
    for(int j = 0; j < pointCount; j++) {
      Line l = new Line(points[i], points[j]);
      l.draw();
    }
  }
  
  for (int i = 0; i < pointCount; i++) {
    fill(255);
    points[i].draw();
  }
}

Point addPoint(float x, float y, float diameter) {
  Point p = new Point(x, y, 30);
  if(pointCount == points.length) {
    points = (Point[]) expand(points);
  }
  points[pointCount] = p;
  pointCount++;
  p.animIn(1);
  return p;
}

void keyPressed() {
  if(key==' ') {
    pointCount = 0;
    Point[] points = new Point[10];

    lineCount = 0;
    Line[] lines = new Line[10];
  }
}

void mousePressed() {
    // Ignore anything greater than this distance
  float closest = 20;
  for (int i = 0; i < pointCount; i++) {
    Point n = points[i];
    float d = dist(mouseX, mouseY, n.x, n.y);
    if (d < closest) {
      selection = n;
      closest = d;
    }
  }
  if (selection != null) {
    if (mouseButton == LEFT) {
      //selection.fixed = true;
    } else if (mouseButton == RIGHT) {
      //selection.fixed = false;
    }
  } else {
    addPoint((float)mouseX, (float)mouseY, 10.0);
  }
}

void mouseDragged() {
  if (selection != null) {
    selection.x = mouseX;
    selection.y = mouseY;
  }
  oldMouseX = mouseX;
  oldMouseY = mouseY;
}

void mouseReleased() {
  float xDelta = mouseX - oldMouseX;
  float yDelta = mouseY - oldMouseY;
  if (selection != null) {
    selection.overShoot(mouseX + xDelta*20, mouseY + yDelta*20);
  }
  selection = null;
}
