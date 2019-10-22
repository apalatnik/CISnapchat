/**
Creative Interactions - Assignment 2
Snapchat starter sketch
To be edited for submission
*/

PImage bg;
int shape = 1;
int size =40;

void setup() {
  size(960, 720);
  // The background image must be the same size as the parameters
  // in the size() method. In this program, the size of the image
  // is 640 x 360 pixels.
  bg = loadImage("sample.jpg");
  image(bg,0,0);
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

void draw() {
  if(key == '1') shape = 1;
  if(key == '2') shape = 2;
  if(key == '3') shape = 3;
  if(key == '4') shape = 4;
  if(key == '5' && size > 0) size -= 1;
  if(key == '6') size += 1;
  
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
    }
  }else{
    bg = get();
  }
}
