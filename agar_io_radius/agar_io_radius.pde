float d;
int red = 10;
Mover mover;
Food food;
ArrayList<Food> foodList;

void setup() {
  size(1000, 1000);
  foodList = new ArrayList<Food>();
  background(51);
  mover = new Mover();
  for (int i = 0; i < 1000; i++) {
    foodList.add(new Food(random(2000), random(2000)));
    foodList.get(i).show();
  }
}


void draw() {
  background(0);
  println(mover.rad);
  mover.update();
  mover.display();
  fill(255, 0, 0);
  pushMatrix();
  translate(-mover.location.x, -mover.location.y);
  for (Food food : foodList) {
    float d = dist(mover.location.x+width/2, mover.location.y+height/2, food.x, food.y);
    food.show();
    if (d < (mover.rad/2+10)) {
      mover.rad += 1;
      print(true);
    }
  }
  popMatrix();
  for (int i =0; i<foodList.size(); i++) {
    float d = dist(mover.location.x+width/2, mover.location.y+height/2, foodList.get(i).x, foodList.get(i).y);
    if (d < (mover.rad/2+10)) {
      foodList.remove(i);
    }
  }
}

int calculateDeltaRadius(float playerRadius, float foodRadius){
  float deltaRadius;
  float areaPlayer = sq(playerRadius)*PI;
  float areaFood = sq(foodRadius)*PI;
  float areaSum = areaPlayer+areaFood;
  float radiusSum = sqrt(areaSum/PI);
  deltaRadius = radiusSum - playerRadius;
  print(deltaRadius);
  return int(deltaRadius);
}
