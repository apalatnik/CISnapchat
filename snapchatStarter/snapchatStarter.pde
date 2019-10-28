/**
Creative Interactions - Assignment 2
Here is our attempt at getting as close as possible to the original picture editor of
the Snapchat app. This project was mostly done without any additional help due to 
already existing experience in java programming.
Reference for how to add sounds: http://code.compartmental.net/minim/audioplayer_class_audioplayer.html
Reference for how to add captions: //http://learningprocessing.com/examples/chp18/example-18-01-userinput
Reference for filters: https://processing.org/reference/PImage_filter_.html
Reference for tints: https://processing.org/reference/tint_.html

Authors: James Keefe, Jamison Carlen, Jared Basile, Alexander Palatnik
*/

import ddf.minim.*; // sound library

// global variables
Minim minim;
AudioPlayer skrrt;
PImage bg;
PImage bg2;
PImage saveImage;
PFont f;
boolean boolClick = false;

// global numbers
int shape = 1;
int size =40;
int indent = 25;
int lastPressed;
int x = 1;
float scale = 1;

//global Strings and characters
String userInput = "";
String savedInput = "";
char none;
char keychar = 0;
char keychar2 = 0;


void setup() {
  
  // setup display
  size(960, 720);
  bg = loadImage("sample.jpg");
  bg2 = loadImage("sample.jpg");
  frameRate(90);
  image(bg,0,0);
  
  // setup sound
  minim = new Minim(this);
  skrrt = minim.loadFile("skrrt.mp3");
  
  // setup standard caption font
  f = createFont("Arial",24);
}

void draw() {
  
  // here users determine what functionality they want to use, to keep code clean we have decided to
  // seperate this from other code
  if(keyPressed)
  {
    if(key == '0') keychar = key; // reset all
    if(key == '1') keychar = key; // draw tool
    if(key == '2') keychar = key; // stickers / shapes
    if(key == '3') keychar = key; // date stamp
    if(key == '4') keychar = key; // time stamp
    if(key == '5') keychar = key; // filters
    if(key == '6') keychar = key; // caption
    if(key == '7') keychar = key; // tint
    if(key == '8') keychar = key; // sound
    if(key == '9') keychar = key; // save current image
  }
  
  // execute functionality
  switch(keychar){
    
  case '0': 
  
    image(bg2,0,0); 
    break;
    
  case '1':
  
    drawTool();
    break;
    
  case '2':
  
    shapeTool();
    break;
    
  case '3': 
  
    getDate();
    break;    
    
  case '4':  
  
    getTime();
    break;   
    
  case '5':   
  
    colorFilter();
    break;  
    
  case '6':  
  
    if(keychar == '6'){ 
      if(userInput.length() > 0){ // Determines if text is present
          fill(255);
          rect(0,620,960,720);
      }
    }
 
    textFont(f);
    fill(0);
    text(userInput,indent,650);
    break;
    
  case '7':  
  
    colorTint();
    break;    
    
  case '8':
  
    Audio();
    break;    
    
  case '9':
  
    save("myImage.png");
    keychar = none;
    break; 
    
  }
}

// This method reduces the amount of bugs and accidential color switches during drawing (case 1). 
// It is be necessary to double click sometimes.
void mouseClicked(){
  
  boolClick = true;
  
}

// Case 1: This is the drawing tool. It creates color boxes to switch color during drawing and also allows 
// to edit stroke size during drawing.
void drawTool(){
  
  strokeWeight(10); 
  
  // edit stroke with arrow UP or arrow DOWN
  if (keyPressed && (key == CODED)) {
    if (keyCode == UP) {
      x = x + 1;
      if( x > 255) x = 255;
    } 
    else if (keyCode == DOWN) {
      x = x - 1;
      if( x < 0) x = 0;
    }
  }
      
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

  // drawing line and switching between colors
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
}

// star shape, necessary for shape tool (case 3)
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

// android shape from previous labs, necessary for shape tool (case 3)
void android(float x, float y, float s){
  scale(s);
  beginShape();
  noStroke(); // remove borders
  fill(164,198,57); // android color
  
  arc(x, y, 280, 200, PI, TWO_PI); // head
  rect(x-140, y+12, 280, 235, 0,0,50,50); // body
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
  
  fill(255); //white fill
  circle(x-62, y-40, 25); // left eye
  circle(x+58, y-40, 25); // right eye
  
  stroke(1);
  endShape(CLOSE);
}

// Case 3: This method implements the shape/sticker tool. One can edit 
void shapeTool(){
  
  if(key == 'q') shape = 1; // circle
  if(key == 'w') shape = 2; // square
  if(key == 'e') shape = 3; // star
  if(key == 'r') shape = 4; // triangle
  if(key == 't') shape = 5; // android
  
  // vary size of shapes
  if(key == '-'){ 
    if(size > 1) size -= 1;
    if(scale > 0.1) scale -=0.005;
  }
  if(key == '+'){
    if(size < 1000) size += 1;
    if(scale<4) scale += 0.005;
  }
  
  // drag and drop shapes
  if(mousePressed)
  {
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
    
  } else {
    
    // reset some settings and temporarily save newly created image
    bg = get();
    size = 40;
    scale = 1;
    key = none;
    
  }
}

// Case 3: Date stamp on picture.
void getDate() {
  
  String monthName = "";
  stroke(255);
  textSize(50);
  
  // Transform the current month to a string value
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
  
  // Set the stamp
  text(monthName + " " + day(), bg.height/2, bg.width/2);
}

// Case 4: Time stamp on picture.
void getTime() {
  
  stroke(255);
  textSize(50);
  
  // this distinction was necessary to avoid weird time stamps.
  if(minute() < 10)
  {
    text(hour() + ":" + "0" + minute(), bg.height/1.8,bg.width/1.8);
  }
  else
  {
    text(hour() + ":" + minute(), bg.height/1.8,bg.width/1.8);
  }
  
}

// Change the image to grayscale, necessary for filters (case 5)
void grayscale() {
  image(bg,0,0);
  bg.filter(GRAY);
}

// Change the image to black and white values, necessary for filters (case 5)
void blackWhite() {
  image(bg,0,0);
  bg.filter(THRESHOLD, 0.55);
}

// Case 5: color filters with reset function
void colorFilter()
{
    if(key == 'q') keychar2 = key; // grayscale
    if(key == 'w') keychar2 = key; // black and white
    if(key == 'e') keychar2 = key; // resets filter
  
  switch(keychar2){
    
  case 'e':
  
    clear();
    image(bg2,0,0);
    noTint();
    break;
    
  case 'q':
  
    image(bg,0,0);
    grayscale();
    break;
    
  case 'w':
  
    image(bg,0,0);
    blackWhite();
    break;
    
  }
}

// Case 6: In this method we handle caption creation. Once users type something a white text field appears.
// The text field does not disappear though as we did not manage to implement that in time and therefore 
// the caption can not be undone once it is present. 
void keyPressed() {
  if (keychar == '6'){
    if (keyCode == BACKSPACE) { // removing last character with backspace
      if (userInput.length() > 0) { // check whether text is present first
          userInput = userInput.substring(0, userInput.length()-1);
      }
    } else if (keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT) { // Other functionalities
      userInput = userInput + key;
    }
  }
}

// Add a red tint to the image, necessary for color tint (case 7)
void redFilter() {
  image(bg,0,0);
  tint(255,0,0); 
}

// Add a green tint to the image, necessary for color tint (case 7)
void greenFilter() {
  image(bg,0,0);
  tint(0,255,0);
}

// Add a blue tint to the image, necessary for color tint (case 7)
void blueFilter() {
  image(bg,0,0);
  tint(0,0,255);
}

// Case 7: add Tint to the image
void colorTint(){
  
  if(key == 'q') keychar2 = key; // red tint
  if(key == 'w') keychar2 = key; // green tint
  if(key == 'e') keychar2 = key; // blue tint
  if(key == 'r') keychar2 = key; // clear tint

  switch(keychar2){
    
    case 'r':
    
      clear();
      image(bg2,0,0);
      noTint();
      break;
      
    case 'q':
    
      image(bg,0,0);
      redFilter();
      break;
      
    case 'w':
    
      image(bg,0,0);
      greenFilter();
      break;
      
    case 'e':
    
      image(bg,0,0);
      blueFilter();
      break;
      
  }            
}   

// Case 8: Audio player. Song: First 15 seconds of Yung Hurn - Skrrt Skrrt
void Audio(){
  
  if(key == 'q' && !skrrt.isPlaying()) {
    
    skrrt.loop();
    
  } else if(key == 'w' && skrrt.isPlaying()) {
    
    skrrt.pause();
    skrrt.rewind();
    
  }
}



   
  
