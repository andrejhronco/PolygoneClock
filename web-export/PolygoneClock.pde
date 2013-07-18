Polygoner polygoners;
float rotation;
int verts;
int coln = 6;
int colw = width/coln;
int life;
float s;

void setup() {
  size(600,600);
  background(#ececec);
  smooth();
  polygoners = new Polygoner(100, 3, 0.01);
  frameRate(60);
  //noCursor();
}

void draw() {
  int s = second();  // Values from 0 - 59
  int m = minute();  // Values from 0 - 59
  int h = hour();    // Values from 0 - 23
  if(h == 0){
    h = 12;
  }
  if(h > 12){
    h -= 12;
  }
  if(h == 1){
     h = 48;
  }
  for(int i = 0; i < coln*2; i++){ // setup a grid
    stroke(255,0); //rotation*255
    fill(255,10);
    line(i*50,0, i*50, height);
    for(int g = 0; g < coln; g++){
      line(0,i*50, width, i*50);
    }
  }
  
  stroke(noise(s)*255);
  polygoners.display(h,m,s);
  polygoners.secCircles(s);
  polygoners.minCircles(m);
}
class Polygoner {
  float t = 0;
  float r = 0;
  float myRadius;
  int numVerts;
  float myRotation;
  int h,m,s;
  float opacity;
  float life;
  
  Polygoner(int tempRadius, int tempVerts, float tempRotation) {
    myRadius = tempRadius;
    numVerts = tempVerts;
    myRotation = tempRotation;
  }
  
  void display(int h, int m,int s) {
    if(s == 0) {
      background(255);
    }
      myRadius = map(s, 0, 59, 10, 300);  
      numVerts = h;      
      myRotation -= 0.0025;
      //fill(random(128,192),random(128,192),random(128,192));
      beginShape();
      for (int i = 0; i < numVerts; i++) {
        vertex(width/2+sin(TWO_PI/numVerts*i+myRotation)*myRadius, height/2+cos(TWO_PI/numVerts*i+myRotation)*myRadius);
//        vertex(width/2+sin(TWO_PI/numVerts*i+myRotation)*myRadius+random(100), height/2+cos(TWO_PI/numVerts*i+myRotation)*myRadius+random(100));
      }
      endShape(CLOSE);
      t += 0.01;
      r += 0.01;
      
      println("hours: " + h);
      println("minutes: " + m);
      println("seconds: " + s);
  }
  void secCircles(int s) {
    fill(0);
    stroke(255);
    for(int i  = 0; i < s; i++){
      ellipse(width-10, (height-10)-10*i, 10, 10);
    }
  }
  void minCircles(int m) {
    fill(0);
    stroke(255);
    for(int i  = 0; i < m; i++){
      ellipse(10, 10*i+10, 10, 10);
    }
  }
}

