/**
Creative Interactions - Assignment 2
Snapchat starter sketch
To be edited for submission
*/

import ddf.minim.*;//sound library
//global variables
PImage bg;
PImage bg2;
Minim minim;
AudioPlayer skrrt;
int shape = 1;
int size =40;
float scale = 1;
char m;
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
  updatePixels();
  bg2 = loadImage("sample.jpg");//image
  frameRate(90);
  image(bg,0,0);
  minim = new Minim(this);
  skrrt = minim.loadFile("skrrt.mp3");
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
    if(key == '7')
    {
      keychar = key;
    }
    if(key == '8')
    {
      keychar = key;
    }
  }
  switch(keychar){
case '0':
      image(bg2,0,0);
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
  
  if(key == 'c') shape = 1;
  if(key == 'a') shape = 2;
  if(key == 'v') shape = 3;
  if(key == 't') shape = 4;
  if(key == 'a') shape = 5;
  if(key == '-'){ 
    if(size > 1) size -= 1;
    if(scale > 0.1) scale -=0.005;
  }
  if(key == '+'){
    if(size < 1000) size += 1;
    if(scale<4) scale += 0.005;
  }
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
  }
  else{
    bg = get();
    size = 40;
    scale = 1;
    key = m;
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
  textFont(f);
  fill(0);
  text(userInput,indent,650);
break;
case '7':
  colorTint();
break;
case '8':
  Audio();//plays music
break;
  }
  
}
void mouseClicked(){
  boolClick = true;
}
void keyPressed() {
  push();
  fill(255);
  rect(0,620,960,720);
  pop();
  if (keyCode == BACKSPACE) {
    if (userInput.length() > 0) {
      userInput = userInput.substring(0, userInput.length()-1);
    }
  } else if (keyCode == DELETE) {
    userInput = "";
  } else if (keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT) {
    userInput = userInput + key;
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
  text(hour() + ":" + minute(), bg.height/1.8,bg.width/1.8);
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
case 'o':
  clear();
  image(bg2,0,0);
  noTint();
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
void colorTint()
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
    if(key == 'o')
    {
      keychar2 = key;
    }
    switch(keychar2){
case 'o':
  clear();
  image(bg2,0,0);
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
    
}
            
}   
void Audio()
{
   if(key == 's' && !skrrt.isPlaying()) {
    skrrt.loop();
  }else if(key == 'p' && skrrt.isPlaying()){
    skrrt.pause();
    skrrt.rewind();
  }
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

   
  
