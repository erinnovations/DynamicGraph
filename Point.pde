class Point {
  float x,y;
  float diameter;
  float to_diameter;

  Point(float x, float y, float to_diameter) {
    this.x = x;
    this.y = y;
    this.to_diameter = to_diameter;
    this.diameter = 0;
  }

  void draw() {
    fill(255);
    stroke(0);
    strokeWeight(0.5);
    
    ellipse(x,y, diameter, diameter);
  }
  
  void animIn(float duration) {
    Ani.to(this, duration, "diameter", to_diameter, Ani.ELASTIC_OUT);
  }
  
  void overShoot(float overX, float overY) {
   Ani.to(this, 1.0, "x", overX, Ani.ELASTIC_OUT);  
   Ani.to(this, 1.0, "y", overY, Ani.ELASTIC_OUT);    
  }
}
