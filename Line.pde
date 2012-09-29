class Line {
  Point fromPoint;
  Point toPoint;

  Line(Point fromPoint, Point toPoint) {
    this.fromPoint = fromPoint;
    this.toPoint = toPoint;
  }

  void draw() {
    stroke(200);
    strokeWeight(2);
    
    line(fromPoint.x, fromPoint.y, toPoint.x, toPoint.y);
  }
}
