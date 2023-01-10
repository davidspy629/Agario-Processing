class Mover {
  Client client;
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;
  float rad = 50;
  int points = 20, id;
  
  
  Mover(Client client) {
    this.client = client;
    location = new PVector(feldSizeX/2,feldSizeY/2);
    velocity = new PVector(0, 0);
    topspeed = 6;
    id = int(random(50000));
  }

  void display() {
    stroke(200, 0, 0);
    strokeWeight(10);
    fill(255, 0, 0);
    ellipse(location.x, location.y, rad, rad);
    stroke(0);
    fill(0);
    textSize(rad/10);
    text(points, location.x, location.y+rad/20);
    client.write(id + ";" + location.x + ";" + location.y + ";" + rad + ";" + points + "\n");
  }
}
