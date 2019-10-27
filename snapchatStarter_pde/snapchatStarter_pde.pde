/**
Creative Interactions - Assignment 2
Snapchat starter sketch
To be edited for submission
*/

PImage bg;
Undo undo;
boolean controlDown = false;
boolean shiftDown = false;
boolean boolClick = false;
PFont f;
String userInput = "";
String savedInput = "";
int indent = 25;

void setup() {
  size(960, 720);
  f = createFont("Arial",24);
  // The background image must be the same size as the parameters
  // in the size() method. In this program, the size of the image
  // is 640 x 360 pixels.
  bg = loadImage("sample.jpg");//image
  frameRate(90);
  image(bg,0,0);
  undo = new Undo(10);
  
}
char keychar = 0;
int x = 0;//char value for switch statement
void draw() {
  
  switch(keychar){
case '0':
      image(bg,0,0);
  break;
  case '1':
strokeWeight(10);//test draw method
        if (keyPressed && (key == CODED)) {
          if (keyCode == UP) {
            x = x + 5;
            if( x > 255)
            {
              x = 255;
            }
        } 
          else if (keyCode == DOWN) {
            x = x - 5;
            if( x < 0)
            {
              x = 0;
            }
        }
      }
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
  break;
case '2':
  
  
  if(mousePressed)
  {
    image(bg,0,0);
    ellipse(mouseX,mouseY,40,40); 
  }
  else{
    bg = get();
       }
         break;

  }
}
void mouseClicked(){
  boolClick = true;
}
void keyTyped() {
  keychar = key;//set keychar for switch statement
}
void mouseReleased() {
  // Save each line we draw to our stack of UNDOs
  undo.takeSnapshot();
}

void keyPressed() {
  // Remember if CTRL or SHIFT are pressed or not
  if (key == CODED) {
    if (keyCode == CONTROL) 
      controlDown = true;
    if (keyCode == SHIFT)
      shiftDown = true;
    return;
  } 
  // Check if we pressed CTRL+Z or CTRL+SHIFT+Z
  if (controlDown) {
    if (keyCode == 'Z') {
      if (shiftDown)
        undo.redo();
      else
        undo.undo();
    }
    return;
  } 
  // Check if we pressed the S key
  if (key=='s') {
    saveFrame("image####.png");
  }
  
  if(key == '\n'){
    savedInput = userInput;
   //Clear string by setting userInput = "";
   userInput = "";
  }
  else{
   //Concatenate string
   //Each character is added to the string
   userInput = userInput + key;
 }//end else
}
void keyReleased() {
  // Remember if CTRL or SHIFT are pressed or not
  if (key == CODED) {
    if (keyCode == CONTROL) 
      controlDown = false;
    if (keyCode == SHIFT)
      shiftDown = false;
  }
}


class Undo {
  // Number of currently available undo and redo snapshots
  int undoSteps=0, redoSteps=0;  
  CircImgCollection images;
  
  Undo(int levels) {
    images = new CircImgCollection(levels);
  }

  public void takeSnapshot() {
    undoSteps = min(undoSteps+1, images.amount-1);
    // each time we draw we disable redo
    redoSteps = 0;
    images.next();
    images.capture();
  }
  public void undo() {
    if(undoSteps > 0) {
      undoSteps--;
      redoSteps++;
      images.prev();
      images.show();
    }
  }
  public void redo() {
    if(redoSteps > 0) {
      undoSteps++;
      redoSteps--;
      images.next();
      images.show();
    }
  }
}


class CircImgCollection {
  int amount, current;
  PImage[] img;
  CircImgCollection(int amountOfImages) {
    amount = amountOfImages;

    // Initialize all images as copies of the current display
    img = new PImage[amount];
    for (int i=0; i<amount; i++) {
      img[i] = createImage(width, height, RGB);
      img[i] = get();
    }
  }
  void next() {
    current = (current + 1) % amount;
  }
  void prev() {
    current = (current - 1 + amount) % amount;
  }
  void capture() {
    img[current] = get();
  }
  void show() {
    image(img[current], 0, 0);
  }
}
