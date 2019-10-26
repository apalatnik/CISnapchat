/*
sources:
-http://learningprocessing.com/examples/chp18/example-18-01-userinput
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
  text(savedInput,indent,230);
}

void keyPressed(){
 //If ENTER key is pressed, save the string and clear it
 if(key == '\n'){
   savedInput = userInput;
   //Clear string by setting userInput = "";
   userInput = "";
 }//end if
 else{
   //Concatenate string
   //Each character is added to the string
   userInput = userInput + key;
 }//end else
}//end keyPressed()
