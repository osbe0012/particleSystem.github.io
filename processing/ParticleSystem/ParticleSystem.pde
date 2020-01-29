float positionX = 250;
float positionY = 250;
float positionZ = -250;
float velocityX = 0;
float velocityY = 0;
float velocityZ = 0;
float accelerationX = 0;
float accelerationY = 9.8;
float accelerationZ = 0;

void setup() {
  size(500,500,P3D);
}

void drawFloor() {
  stroke(255,255,255);
  fill(50,50,150);
  translate(250,500,0);
  box(500,0,500);
}

void drawSetting() {
  background(50,50,150);
  directionalLight(200,200,200,-0.5,1,-1);
  lightSpecular(200,200,200);
  specular(500,500,500);
}

void computePosition(float dt) {
  positionX = 1;
  
  positionY = positionY + velocityY * dt;
  velocityY = velocityY + accelerationY * dt;
  
  positionZ = 1;
}

void draw() {
  drawSetting();
  
  translate(250,250,-250);
  noStroke();
  fill(150,200,180);
  sphere(50);
  translate(-250,-250,250);
  
  drawFloor();
}
