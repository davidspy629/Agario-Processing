Mover mover; //<>//
float zoom = 1.5;
ArrayList<Food> foodList;

void setup() {
  size(1000, 1000);
  foodList = new ArrayList<Food>();
  mover = new Mover();
  for (int i = 0; i < 2500; i++) {
    foodList.add(new Food(random(1000), random(1000), color(random(255), random(255), random(255))));
    foodList.get(i).show();
  }
}


void draw() {
  background(255);
  gridBackground();
  translate(width/2, height/2);
  scale(zoom); 
  translate(-width/2, -height/2);
  if (zoom > 0.05)
    zoom = 1/mover.rad*100+mover.rad/400;
  updatePosition();
  mover.display();
  fill(255, 0, 0);

  for (int i =0; i<foodList.size(); i++) {
    Food food = foodList.get(i);
    float d = dist(width/2, height/2, food.location.x, food.location.y);
    food.show();
    if (d < (mover.rad/2 +10)) {
      mover.rad += calculateDeltaRadius(mover.rad, 10);
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
  println(deltaRadius);
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


void gridBackground(){
  stroke(0);
  pushMatrix();
  //float distance = 1.0/zoom*40;
  float distance = 100;
  translate(mover.location.x%distance, mover.location.y%distance);
  for(float i = -2*width; i < 2*width; i+= distance)
    line(-width, i, 2*height, i);
  for(float i = -height; i < 2*height; i+= distance)
    line(i, -height, i, 2*width);
   popMatrix();
}
