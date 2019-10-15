/**
Creative Interactions - Assignment 2
Snapchat starter sketch
To be edited for submission
*/

PImage bg;

void setup() {
  size(960, 720);
  // The background image must be the same size as the parameters
  // in the size() method. In this program, the size of the image
  // is 640 x 360 pixels.
  bg = loadImage("sample.jpg");
  image(bg,0,0);
}




void draw() {
  
  if(mousePressed){
    image(bg,0,0);
    ellipse(mouseX,mouseY,40,40); 
  }else{
    bg = get();
  }
  
  
}
