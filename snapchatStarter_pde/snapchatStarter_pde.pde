/**
Creative Interactions - Assignment 2
Snapchat starter sketch
To be edited for submission
*/

PImage bg;
PImage bg2;
Undo undo;
boolean controlDown = false;
boolean shiftDown = false;
boolean boolClick = false;
PFont f;
String userInput = "";
String savedInput = "";
int indent = 25;
int lastPressed;

void setup() {
  size(960, 720);
  // The background image must be the same size as the parameters
  // in the size() method. In this program, the size of the image
  // is 640 x 360 pixels.
  bg = loadImage("sample.jpg");
  bg2 = loadImage("sample.jpg");//image
  frameRate(90);
  image(bg,0,0);
  undo = new Undo(10);
  f = createFont("Arial",24);
  
}
char keychar = 0;
char keychar2 = 0;
int x = 1;//char value for switch statement
void draw() {
  
  if(keyPressed)
  {
    if(key == '0')
    {
      keychar = key;
    }
    if(key == '1')
    {
      keychar = key;
    }
    if(key == '2')
    {
      keychar = key;
    }
    if(key == '3')
    {
      keychar = key;
    }
    if(key == '4')
    {
      keychar = key;
    }
     if(key == '5')
    {
      keychar = key;
    }
    if(key == '6')
    {
      keychar = key;
    }
  }
  switch(keychar){
case '0':
      image(bg,0,0);
      noTint();
  break;
  case '1':
strokeWeight(10);//test draw method
        if (keyPressed && (key == CODED)) {
          if (keyCode == UP) {
            x = x + 1;
            if( x > 255)
            {
              x = 255;
            }
        } 
          else if (keyCode == DOWN) {
            x = x - 1;
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
  strokeWeight(x);
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
case '3':
  if(key == '3') {   
    getDate();
   
  }
break;
case '4':
if(key == '4') {   
    getTime();
   
  }
break;
case '5':
  colorFilter();
break;
case '6':
  //http://learningprocessing.com/examples/chp18/example-18-01-userinput
  background(255);
  textFont(f);
  fill(0);

  //Prompt user
  text("Enter text here.",indent,40);
  text(userInput,indent,190);
  text(savedInput,indent,230);
  lastPressed = millis();
  
  if(keyPressed)
    
    if(millis()-lastPressed > 10)
    {
     
      if(key =='\n')
      {
        savedInput = userInput;
   //Clear string by setting userInput = "";
        userInput = "";
      }
      else
      {
       //Concatenate string
       //Each character is added to the string
       userInput = userInput + key;
      }
    }
break;
  }
  
}
void mouseClicked(){
  boolClick = true;
}
/*void keyTyped() {
  keychar = key;//set keychar for switch statement
}*/
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
void getDate() {
  String monthName = "";
  stroke(255);
  textSize(50);
  
  //Return the current month as a string value
  switch(month()){
    case 1:
      monthName = "January";
      break; 
    case 2:
      monthName = "February";
      break;    
    case 3:
      monthName = "March";
      break;    
    case 4:
      monthName = "April";
      break;    
    case 5:
      monthName = "May";
      break;     
    case 6:
      monthName = "June";
      break;   
    case 7:
      monthName = "July";
      break;     
    case 8:
      monthName = "August";
      break;     
    case 9:
      monthName = "September";
      break;     
    case 10:
      monthName = "October";
      break;      
    case 11:
      monthName = "November";
      break;     
    case 12:
      monthName = "December";
      break;
  }
  text(monthName + " " + day(), bg.height/2, bg.width/2);
}
void getTime() {
  stroke(255);
  textSize(50);
  text(hour() + ":" + minute(), bg.height/2,bg.width/2);
}
//Change the image to grayscale 
void grayscale() {
  image(bg,0,0);
  bg.filter(GRAY);
}
//Change the image to black and white values
void blackWhite() {
  image(bg,0,0);
  bg.filter(THRESHOLD, 0.55);
}

//Add a red tint to the image
void redFilter() {
  image(bg,0,0);
  tint(255,0,0); 
}

//Add a green tint to the image
void greenFilter() {
  image(bg,0,0);
  tint(0,255,0);
}

//Add a blue tint to the image
void blueFilter() {
  image(bg,0,0);
  tint(0,0,255);
}
void colorFilter()
{
    if(key == 'r')
    {
      keychar2 = key;
    }
    if(key == 'g')
    {
      keychar2 = key;
    }
    if(key == 'b')
    {
      keychar2 = key;
    }
    if(key == 'h')
    {
      keychar2 = key;
    }
    if(key == 'j')
    {
      keychar2 = key;
    }
     if(key == 'o')
    {
      keychar2 = key;
    }
  
  switch(keychar2){
case '0':  
  image(bg,0,0);
  noTint();
  break;
case 'r':
  image(bg,0,0);
  redFilter();
  break;
case 'g':
  image(bg,0,0);
  greenFilter();
  break;
case 'b':
  image(bg,0,0);
  blueFilter();
  break;
case 'h':
  image(bg,0,0);
  grayscale();
  break;
case 'j':
  image(bg,0,0);
  blackWhite();
  break;
  
  }
   
             
             
          }
            
            
   
  /*if(f == 1);
    {
      grayscale();
    }
    if(f == 2);
    {
      blackWhite();
    }
    if(f == 3);
    {
      redFilter();
    }
    if(f == 4);
    {
      blueFilter();
    }
    if(f == 5);
    {
      greenFilter();
    }*/
    
   


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
