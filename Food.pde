class Food {
  float x, y;

  Food(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void show() {
    fill(255, 0, 0);
    strokeWeight(0);
    ellipse(this.x, this.y, 10, 10);
  }
}
