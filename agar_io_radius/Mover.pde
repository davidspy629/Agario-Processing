class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;
  float rad = 50;

  Mover() {
    location = new PVector(0,0);
    velocity = new PVector(0, 0);
    topspeed = 6;
  }

  void display() {
    stroke(200, 0, 0);
    strokeWeight(10);
    fill(255, 0, 0);
    ellipse(width/2, height/2, rad, rad);
  }
}
