Mover mover;
float zoom = 0.25;
float zoom2 = 0.01;
ArrayList<Food> foodList;

void setup() {
  size(1000, 1000);
  foodList = new ArrayList<Food>();
  mover = new Mover();
  for (int i = 0; i < 1000; i++) {
    foodList.add(new Food(random(2000), random(2000), color(random(255), random(255), random(255))));
    foodList.get(i).show();
  }
}


void draw() {
  background(0);
  /*float cameraX = mover.location.x-width/2;
  float cameraY = mover.location.y-height/2;
  translate(-cameraX,-cameraY);
  scale(zoom);
  translate(cameraX,cameraY);*/
  float oldPosX = mover.location.x;
  float oldPosY = mover.location.y;
  mover.update();
  mover.display();
  float deltaPosX = mover.location.x - oldPosX;
  float deltaPosY = mover.location.y - oldPosY;
  //pushMatrix();
  fill(255, 0, 0);
  
  for (int i =0; i<foodList.size(); i++) {
    Food food = foodList.get(i);
    food.x -= deltaPosX*2;
    food.y -= deltaPosY*2;
    float d = dist(mover.location.x, mover.location.y, food.x, food.y);
    food.show();
    if (d < (mover.rad/2+10)) {
      mover.rad += 1;
      //zoom+=0.01;
      foodList.remove(food);
    }
  }
  //popMatrix();
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
