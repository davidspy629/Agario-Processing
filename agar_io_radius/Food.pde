class Food {
  float x, y;
  color foodColor;

  Food(float x, float y, color foodColor) {
    this.x = x;
    this.y = y;
    this.foodColor = foodColor;
  }

  void show() {
    fill(foodColor);
    strokeWeight(0);
    ellipse(this.x, this.y, 10, 10);
  }
}
