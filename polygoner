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
  
  int display(int h, int m,int s) {
    if(s == 0) {
      background(255);
    }
      myRadius = map(s, 0, 59, 10, 300);  
      numVerts = h;      
      myRotation += m * r;
      //fill(random(128,192),random(128,192),random(128,192));
      beginShape();
      for (int i = 0; i < numVerts; i++) {
        vertex(width/2+sin(TWO_PI/numVerts*i+myRotation)*myRadius, height/2+cos(TWO_PI/numVerts*i+myRotation)*myRadius);
//        vertex(width/2+sin(TWO_PI/numVerts*i+myRotation)*myRadius+random(100), height/2+cos(TWO_PI/numVerts*i+myRotation)*myRadius+random(100));
      }
      endShape(CLOSE);
      t += 0.01;
      r += 0.01;
      
      println("hours: " + h + " / hours halved: " + h/2);
      println("minutes: " + m);
      println("seconds: " + s);
      return numVerts;
  }
  
boolean finished() {
    // Balls fade out
    // life--;
    if (life < 0) {
      return true;
    }
    else {
      return false;
    }
  }
 
boolean finishedByOpacity () {    
    if (opacity<=0) {
      return true;
    }
    else {
      return false;
    }
  }// func
}
