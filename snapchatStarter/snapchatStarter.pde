/**
Creative Interactions - Assignment 2
Snapchat starter sketch
To be edited for submission
*/

import ddf.minim.*;

Minim minim;
AudioPlayer skrrt;
PImage bg;
int shape = 1;
int size =40;
int tempSize;
char m;
float scale = 1;

void setup() {
  size(960, 720);
  // The background image must be the same size as the parameters
  // in the size() method. In this program, the size of the image
  // is 640 x 360 pixels.
  bg = loadImage("sample.jpg");
  image(bg,0,0);
  minim = new Minim(this);
  skrrt = minim.loadFile("skrrt.mp3");
}

void star(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}

void android(float x, float y, float s){
  scale(s);
  beginShape();
  noStroke(); // remove borders
  fill(164,198,57); // android color
  
  arc(x, y, 280, 200, PI, TWO_PI); // hed 282 200
  rect(x-140, y+12, 280, 235, 0,0,50,50); // bod
  rect(x-200,y+10,50,150, 20); // left arm
  rect(x+151,y+10,50,150, 20); // right arm
  rect(x-87,y+180,50,150, 20); // left leg
  rect(x+38,y+180,50,150, 20); // right leg
  
  pushMatrix();
  translate(x-75,y-123);
  rotate(PI/2.7); // rotate left antenna
  rect(0,0,50,10,10); // left antenna
  popMatrix();
  
  pushMatrix();
  translate(x+80,y-120);
  rotate(PI/2.7); 
  rotate(PI/3.6); // rotate right antenna
  rect(0,0,50,10,10); // right antenna
  popMatrix();
  
  fill(255);                 //white fill
  //rect(130, 200, 300, 10); // line seperating neck
  circle(x-62, y-40, 25); // left eye
  circle(x+58, y-40, 25); // right eye
  
  stroke(1);
  endShape(CLOSE);
}

void draw() {
  
  if(key == '1') shape = 1;
  if(key == '2') shape = 2;
  if(key == '3') shape = 3;
  if(key == '4') shape = 4;
  if(key == '5') shape = 5;
  if(key == '6'){ 
    if(size > 1) size -= 1;
    if(scale > 0.1) scale -=0.005;
  }
  if(key == '7'){
    if(size < 1000) size += 1;
    if(scale<4) scale += 0.005;
  }
  if(key == 's' && !skrrt.isPlaying()) {
    skrrt.loop();
  }else if(key == 'p' && skrrt.isPlaying()){
    skrrt.pause();
    skrrt.rewind();
  }
  
  if(mousePressed){
    image(bg,0,0);
    switch(shape){
      case 1:
        ellipse(mouseX,mouseY,size,size); 
        break;
      case 2:
        square(mouseX-size/2,mouseY-size/2, size);
        break;
      case 3: 
        star(mouseX, mouseY, size/2, size, shape*2);
        break;
      case 4: 
        triangle(mouseX, mouseY, mouseX+size, mouseY+size, mouseX-size, mouseY+size);
        break;
      case 5: 
        android(mouseX/scale, mouseY/scale, scale);
        break;
      
    }
  }else{
    bg = get();
    size = 40;
    scale = 1;
    key = m;
  }
}
