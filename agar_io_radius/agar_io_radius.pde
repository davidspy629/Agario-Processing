float d;
int red = 10;
PVector location;
Mover mover;
Food food;
ArrayList<Food> foodList;

void setup() {
  size(1000, 1000);
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
  println(mover.rad);
  pushMatrix();
  mover.update();
  mover.display();
  popMatrix();
  //translate (width/2 -mover.location.x, height/2 -mover.location.y);

  fill(255, 0, 0);
  for (Food food : foodList) {
    float d = dist(mover.location.x, mover.location.y, food.x, food.y);
    food.show();
    if (d < (mover.rad)) {
      mover.rad += calculateDeltaRadius(mover.rad, 10);;
      print(true);
    }
  }
  for (int i =0; i<foodList.size(); i++) {
    float d = dist(mover.location.x, mover.location.y, foodList.get(i).x, foodList.get(i).y);
    if (d < (mover.rad)) {
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
