/*
sources:
-http://learningprocessing.com/examples/chp18/example-18-01-userinput
-https://amnonp5.wordpress.com/2012/01/28/25-life-saving-tips-for-processing/
*/

//Global Variables
PFont f;
String userInput = "";
String savedInput = "";
int indent = 25;

void setup(){
  size(960,720);
  f = createFont("Arial",24);
}

void draw(){
  //font settings
  background(255);
  textFont(f);
  fill(0);

  //Prompt user
  text("Enter text here.",indent,40);
  text(userInput,indent,190);
}

void keyPressed() {
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
