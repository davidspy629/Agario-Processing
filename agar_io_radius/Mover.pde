class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;
  int rad = 50;

  Mover() {
    location = new PVector(width/2,height/2);
    velocity = new PVector(0, 0);
    topspeed = 6;
  }

  void update() {
    PVector mouse = new PVector(mouseX, mouseY);
    PVector center = new PVector(width/2, height/2);
    PVector acceleration = PVector.sub(mouse, center);
    acceleration.setMag(6);

    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
  }

  void display() {
    stroke(200, 0, 0);
    strokeWeight(10);
    fill(255, 0, 0);
    ellipse(width/2, height/2, rad, rad);
  }
}
