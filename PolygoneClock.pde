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
  
  stroke(noise(s)*255, noise(s)*255);
  polygoners.display(h,m,s);
  polygoners.secCircles(s);
  polygoners.minCircles(m);
}
