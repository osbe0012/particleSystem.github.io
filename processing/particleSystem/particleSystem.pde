float positionX = 250;
float positionY = 250;
float positionZ = -250;
float velocityX = 10;
float velocityY = -100;
float velocityZ = 10;
float accelerationX = 0;
float accelerationY = 9.8;
float accelerationZ = 0;
int radius = 50;
float floorOffset = 500;
float wallOffset = 500;

void setup() {
  size(500,500,P3D);
}

void drawText() {
   textSize(14);
   fill(255);
   String positionXString = "Position X: " + positionX;
   String positionYString = "Position Y: " + positionY;
   String positionZString = "Position Z: " + positionZ;
   String velocityXString = "Velocity X: " + velocityX;
   String velocityYString = "Velocity Y: " + velocityY;
   String velocityZString = "Velocity Z: " + velocityZ;
   text(positionXString,10,18);
   text(positionYString,10,38);
   text(positionZString,10,58);
   text(velocityXString,200,18);
   text(velocityYString,200,38);
   text(velocityZString,200,58);
}

void drawFloor() {
  stroke(255,255,255);
  fill(50,50,150);
  push();
  translate(250,500,250);
  box(500,0,500);
  pop();
}

void drawSphere() {
  push();
  translate(positionX, positionY, positionZ);
  noStroke();
  fill(150,200,180);
  sphere(radius);
  pop();
}

void drawSetting() {
  background(50,50,150);
  directionalLight(200,200,200,-0.5,1,-1);
  lightSpecular(200,200,200);
  specular(500,500,500);
}

void computePosition(float dt) {
  positionX = positionX + velocityX * dt;
  velocityX = velocityX + accelerationX * dt;
  if(positionX + radius > wallOffset) { // Right boundary collision
    positionX = wallOffset - radius;
    velocityX *= -0.9;
  }
  if(positionX - radius < 0) { // Left boundary collision
    positionX = radius;
    velocityX *= -0.9;
  }
  
  positionY = positionY + velocityY * dt;
  velocityY = velocityY + accelerationY * dt;
  if(positionY + radius > floorOffset) { // Floor collision
    positionY = floorOffset - radius;
    velocityY *= -0.8;
  }
  
  positionZ = positionZ + velocityZ * dt;
  velocityZ = velocityZ + accelerationZ * dt;
  if(positionZ + radius > floorOffset) { // Rear boundary collision
    positionZ = floorOffset - radius;
    velocityZ *= -0.9;
  }
  if(positionZ - radius < 0) { // Front boundary collision
    positionZ = radius;
    velocityZ *= -0.9;
  }
  if(-5 < velocityX && velocityX < 5) {
    velocityX = 0;
    accelerationX = 0;
  }
  if(-0.1 < velocityY && velocityY < 0.1 && positionY > 440) {
    velocityY = 0;
    accelerationY = 0;
    positionY = floorOffset - radius;
  }
  if(-5 < velocityZ && velocityZ < 5) {
    velocityZ = 0;
    accelerationZ = 0;
  }
}

void draw() {
  drawSetting();
  drawText();
  computePosition(0.15);
  translate(0,0,-600);
  drawSphere();
  drawFloor();
}
