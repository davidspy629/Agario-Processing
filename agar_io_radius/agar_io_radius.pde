Mover mover; //<>//
float zoom = 1.5;
ArrayList<Food> foodList;
float feldSizeX = 10000;
float feldSizeY = 10000;



void setup() {
  size(1000, 1000);
  textAlign(CENTER);
  foodList = new ArrayList<Food>();
  mover = new Mover();
  for (int i = 0; i < 5000; i++) {
    foodList.add(new Food(random(0, feldSizeX), random(0, feldSizeY), color(random(255), random(255), random(255))));
    foodList.get(i).show();
  }
}


void draw() {

  translate(-mover.location.x*zoom+width/2*zoom, -mover.location.y*zoom+height/2*zoom);
  stroke(0);
  background(255);
  translate(width/2, height/2);
  scale(zoom);
  translate(-width/2, -height/2);
  updatePosition();
  gridBackground();
  mover.display();
  //fill(255, 0, 0);
  for (int i =0; i<foodList.size(); i++) {
    Food food = foodList.get(i);
    float d = dist(mover.location.x, mover.location.y, food.x, food.y);
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
  PVector acceleration = PVector.sub(mouse, center);
  acceleration.setMag(dist(mouseX, mouseY, width/2, height/2)/1000);
  
  mover.velocity.add(acceleration);
  mover.velocity.limit(mover.topspeed);
  mover.location.add(mover.velocity);
  
  mover.location.x = constrain(mover.location.x, 0+mover.rad/2, feldSizeX-mover.rad/2);
  mover.location.y = constrain(mover.location.y, 0+mover.rad/2, feldSizeY-mover.rad/2);
}

void gridBackground() {
  stroke(0);
  for (float i = 0; i <= feldSizeX; i+= 100)
    line(0, i, feldSizeX, i);
  for (float i = 0; i <= feldSizeY; i+= 100)
    line(i, 0, i, feldSizeY);
}
