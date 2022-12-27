Mover mover; //<>//
float zoom = 1.5;
ArrayList<Food> foodList;
float feldSizeX = 1000;
float feldSizeY = feldSizeX;

void setup() {
  size(1000, 1000);
  foodList = new ArrayList<Food>();
  mover = new Mover();
  for (int i = 0; i < 4000; i++) {
    foodList.add(new Food(random(feldSizeX), random(feldSizeY), color(random(255), random(255), random(255))));
    foodList.get(i).show();
  }
}


void draw() {
  stroke(0);
  background(255);
  translate(width/2, height/2);
  scale(zoom);
  translate(-width/2, -height/2);


  updatePosition();
  gridBackground();
  mover.display();
  fill(255, 0, 0);

  for (int i =0; i<foodList.size(); i++) {
    Food food = foodList.get(i);
    float d = dist(width/2, height/2, food.location.x, food.location.y);
    food.show();
    if (d < (mover.rad/2 +10)) {
      mover.rad += calculateDeltaRadius(mover.rad, 10);
      if (zoom > 0.75) {
        zoom -= pow(zoom, 2)/10000;
      }
      foodList.remove(food);
    }
  }
}

float calculateDeltaRadius(float playerRadius, float foodRadius) {
  float deltaRadius;
  float areaPlayer = pow(playerRadius, 2)*PI;
  float areaFood = pow(foodRadius, 2)*PI;
  float areaSum = areaPlayer+areaFood;
  float radiusSum = sqrt(areaSum/PI);
  deltaRadius = radiusSum - playerRadius;
  return deltaRadius;
}


void updatePosition() {
  PVector mouse = new PVector(mouseX, mouseY);
  PVector center = new PVector(width/2, height/2);
  PVector acceleration = PVector.sub(center, mouse);
  acceleration.setMag(dist(mouseX, mouseY, width/2, height/2)/1000);

  mover.velocity.add(acceleration);
  mover.velocity.limit(mover.topspeed);
  mover.location.add(mover.velocity);
  for (Food food : foodList) {
    food.velocity.add(acceleration);
    food.velocity.limit(mover.topspeed);
    food.location.add(mover.velocity);
  }
}

void gridBackground() {
  stroke(0);
  for (float i = -feldSizeX/2; i <= feldSizeX/2; i+= 100)
    line(-feldSizeX/2+mover.location.x, i+mover.location.y, feldSizeX/2+mover.location.x, i+mover.location.y);
  for (float i = -feldSizeY/2; i <= feldSizeY/2; i+= 100)
    line(i+mover.location.x, -feldSizeY/2+mover.location.y, i+mover.location.x, feldSizeY/2+mover.location.y);
}
