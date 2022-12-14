Mover mover;
ArrayList<Food> foodList;

void setup() {
  size(1000, 1000);
  foodList = new ArrayList<Food>();
  background(51);
  mover = new Mover();
  for (int i = 0; i < 1000; i++) {
    foodList.add(new Food(random(2000), random(2000), color(random(255), random(255), random(255))));
    foodList.get(i).show();
  }
}


void draw() {
  background(0);
  mover.update();
  mover.display();
  fill(255, 0, 0);
  pushMatrix();
  translate(-mover.location.x, -mover.location.y);
  for (int i =0; i<foodList.size(); i++) {
    Food food = foodList.get(i);
    float d = dist(mover.location.x+width/2, mover.location.y+height/2, food.x, food.y);
    food.show();
    if (d < (mover.rad/2+10)) {
      mover.acceleration.setMag(-5/100);
      mover.rad += 1;
      foodList.remove(food);
    }
  }
  popMatrix();
}

int calculateDeltaRadius(float playerRadius, float foodRadius){
  float deltaRadius;
  float areaPlayer = sq(playerRadius)*PI;
  float areaFood = sq(foodRadius)*PI;
  float areaSum = areaPlayer+areaFood;
  float radiusSum = sqrt(areaSum/PI);
  deltaRadius = radiusSum - playerRadius;
  return int(deltaRadius);
}
