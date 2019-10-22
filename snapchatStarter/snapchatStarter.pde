/**
Creative Interactions - Assignment 2
Snapchat starter sketch
To be edited for submission
*/

PImage bg;
boolean boolClick = false;

void setup() {
  size(397,590);
  // The background image must be the same size as the parameters
  // in the size() method. In this program, the size of the image
  // is 640 x 360 pixels.
  bg = loadImage("pikachu.jpg");
}

void mouseClicked(){
  boolClick = true;
}

void draw() {
  //background(bg);
  pushStyle();
  noFill();
  stroke(0);
  strokeWeight(5);
  
  rect(0,0,30,210);
  popStyle();
  

  //Color boxes
strokeWeight(0);
fill(255,0,0);
  rect(0,0,30,30);
fill(255,255,0);  
  rect(0,30,30,30);
fill(0,255,0);  
  rect(0,60,30,30);
fill(0,255,255);  
  rect(0,90,30,30);
fill(0,0,255);  
  rect(0,120,30,30);
fill(0);
  rect(0,150,30,30);
fill(255);
  rect(0,180,30,30);
fill(255);

if(mousePressed == true) {
  strokeWeight(5);
  line(mouseX,mouseY,pmouseX,pmouseY);

  
    if(mouseX > 0 && mouseX < 30){
      if(mouseY >0 && mouseY < 30 && boolClick == true){
        boolClick = false;
        stroke(255,0,0);
      }
    }
    
    if(mouseX > 0 && mouseX < 30 ){
      if(mouseY >30 && mouseY < 60 && boolClick == true){
        boolClick = false;
        stroke(255,255,0);
      }
    }
    
    if(mouseX > 0 && mouseX < 30){
      if(mouseY >60 && mouseY < 90 && boolClick == true){
        boolClick = false;
        stroke(0,255,0);
      }
    }
    
    if(mouseX > 0 && mouseX < 30){
      if(mouseY >90 && mouseY < 120 && boolClick == true){
        boolClick = false;
        stroke(0,255,255);
      }
    }
    
    if(mouseX > 0 && mouseX < 30){
      if(mouseY >120 && mouseY < 150 && boolClick == true){
        boolClick = false;
        stroke(0,0,255);
      }
    }
    
    if(mouseX > 0 && mouseX < 30){
      if(mouseY >150 && mouseY < 180 && boolClick == true){
        boolClick = false;
        stroke(0);
      }  
    }
    
    if(mouseX > 0 && mouseX < 30){
      if(mouseY >180 && mouseY < 210 && boolClick == true){
        boolClick = false;
        stroke(255);
      }  
    }
}

  
}
