float theta;   
int depth = window.depth;
float minlength;
PFont f;
boolean slowAnimation = window.slowDown;
int counter = 0;
float limit = 20000; //something really large so limit doesn't affect anything
boolean finishedAnimation = false;

void setup() {
slowAnimation = window.slowDown;
  size(640, 360);
   noStroke();
   f = createFont("Arial",11,true); 
   if (slowAnimation) {
    counter = 0;
    limit = -.2;
   }
}
void restartAnimation() {
  counter = 0;
  limit = -.2;  
}

void draw() {
if(window.slowDown == true) {
  slowAnimation = true;
  window.slowDown = false;
  restartAnimation();
}
  depth = window.depth;
  background(0);
  stroke(255);
  //figure out last length based on depth
  minlength = 0;
  if(depth > 0) {
   minlength = 120*(pow(.66, depth)); 
  }
  // Let's pick an angle 0 to 90 degrees based on the mouse position
  float a = (mouseX / (float) width) * 90f;
  displayDegrees(a);

  // Convert it to radians
  theta = radians(a);
  if(depth != 0) { 
  // Start the tree from the bottom of the screen
  translate(width/2,height);
  // Draw a line 120 pixels
  line(0,0,0,-120);
  // Move to the end of that line
  translate(0,-120);
  // Start the recursive branching!
  branch(120);
  counter = 0;
  if(limit < 20000) {
  limit+=(window.speed/100.0f);
    }
  }
}

void displayDegrees(float a) {
  float PI = 3.14159;
  pushMatrix();
  textFont(f,10);               
  fill(77, 183, 240);                        
  text((round( a * 100.0f ) / 100.0f) + "degrees", 330, 250);
  popMatrix();

  pushMatrix();
  dottedYLine(235, 0, 320, 10)
  fill(0);
  stroke(77, 183, 240);
  arc(320, 235, 50, 50, radians(-90), (radians(a)-radians(90)));
  popMatrix();
  stroke(255);
}

void dottedYLine(float ystart, float ystop, float xpos, float increment){
  if(ystop - ystart < 0) increment = -increment;
  int lines = (ystop-ystart)/increment;
  for(int i = 0; i < lines; i++) {
  if(i % 2 == 0) {
    pushMatrix();
    stroke(100);
    line(xpos, ystart + increment*i, xpos,ystart+(i+1)*(increment));
    popMatrix();
    }
  }
}

boolean branch(float h) {
  // Each branch will be 2/3rds the size of the previous one
  h *= 0.66;
  
  // All recursive functions must have an exit condition!!!!
  if (h > minlength) {
    if(counter < limit) {
    pushMatrix();    // Save the current state of transformation (i.e. where are we now)
    rotate(theta);   // Rotate by theta
    line(0, 0, 0, -h);  // Draw the branch
    translate(0, -h); // Move to the end of the branch
    branch(h);       // Ok, now call myself to draw two new branches!!
    popMatrix();     // Whenever we get back here, we "pop" in order to restore the previous matrix state
    }
    else {
    console.log("didn't finish");
    }
    if(counter < limit) {
    // Repeat the same thing, only branch off to the "left" this time!
    pushMatrix();
    rotate(-theta);
    line(0, 0, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();
    }
  }

  counter++;
  }
