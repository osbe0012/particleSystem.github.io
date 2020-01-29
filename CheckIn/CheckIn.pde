void setup() {
  size(1000,1000,P3D);
}


void draw() {
  background(50,50,150);
  
  directionalLight(200,200,200,-0.5,1,-1);
  lightSpecular(200,200,200);
  specular(500,500,500);
  
  stroke(255,255,255);
  fill(50,50,150);
  translate(500,0,0);
  box(1000,0,1000);
  translate(0,1000,0);
  box(1000,0,1000);
  translate(0,-500);
  //box(0,1000,1000);
  //translate(-500,0);
  //box(1000,1000,0);
  //translate(0,0,-1000);
  
  noStroke();
  fill(100,150,130);
  sphere(100);
}
