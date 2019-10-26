/**
Creative Interactions - Assignment 2
Snapchat starter sketch
To be edited for submission
*/

PImage im;


void setup() {
  size(600,600);
  im = loadImage("moonwalk.jpg");
}

void draw() {
  image(im,0,0);
  
  if(key == '1') {   
    getDate();
   
  }
   
}
//Change the image to grayscale 
void grayscale() {
  im.filter(GRAY);
}
//Invert the image colors
void invert() {
  im.filter(INVERT);
}
//Change the image to black and white values
void blackWhite() {
  im.filter(THRESHOLD, 0.55);
}

//Add a red tint to the image
void redFilter() {
  tint(255,0,0); 
}

//Add a green tint to the image
void greenFilter() {
  tint(0,255,0,5);
}

//Add a blue tint to the image
void blueFilter() {
  tint(0,0,255,5);
}

//Adds the current time
void getTime() {
  stroke(255);
  textSize(50);
  text(hour() + ":" + minute(), im.height/2,im.width/2);
}

//Adds the current date
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
  //Print the current month and day
  text(monthName + " " + day(), im.height/2, im.width/2);
  
}
