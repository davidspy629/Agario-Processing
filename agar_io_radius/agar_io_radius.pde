float d;
int red = 10;
PVector location;
Mover mover;
Food food;
ArrayList<Food> foodList;

void setup() {
  fullScreen();
  foodList = new ArrayList<Food>();
  background(51);
  mover = new Mover();
  for (int i = 0; i < 200; i++) {
    foodList.add(new Food(random(width), random(height)));
    foodList.get(i).show();
  }
}


void draw() {
  background(0);

  pushMatrix();
  mover.update();
  mover.display();
  popMatrix();
  //translate (width/2 -mover.location.x, height/2 -mover.location.y);

  fill(255, 0, 0);
  for (Food food : foodList) {
    float d = dist(mover.location.x, mover.location.y, food.x, food.y);
    food.show();
    if (d < (mover.rad + red)/2) {
      mover.rad += calculateDeltaRadius(mover.rad, 20);;
    }
  }
  for (int i =0; i<foodList.size(); i++) {
    float d = dist(mover.location.x, mover.location.y, foodList.get(i).x, foodList.get(i).y);
    if (d < (mover.rad + red)/2) {
      foodList.remove(i);
    }
  }
}

float calculateDeltaRadius(float playerRadius, float foodRadius){
  float deltaRadius;
  float areaPlayer = sq(playerRadius)*PI;
  float areaFood = sq(foodRadius)*PI;
  float areaSum = areaPlayer+areaFood;
  float radiusSum = sqrt(areaSum/PI);
  deltaRadius = radiusSum - playerRadius;
  return deltaRadius;
}
