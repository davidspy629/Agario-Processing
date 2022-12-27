class Food {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;
  color foodColor;

  Food(float x, float y, color foodColor) {
    location = new PVector(x,y);
    velocity = new PVector(0, 0);
    topspeed = 6;
    this.foodColor = foodColor;
  }

  void show() {
    fill(foodColor);
    strokeWeight(0);
    ellipse(this.location.x, this.location.y, 10, 10);
  }
}
