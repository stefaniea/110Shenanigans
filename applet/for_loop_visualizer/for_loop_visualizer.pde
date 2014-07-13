import controlP5.*;

ControlP5 cp5;
int myColor = color(0,0,0);

Slider abc;
boolean circColor = false; //boolean that turns the color of the circle white (maybe?)
int outer = 5;
int inner = 5;
int outercount = 0; //to draw one at a time, keep track of how many drawn
int innercount = 0; //to draw one at a time, keep track of how many drawn
int timer = 20; //timer that "ticks" every 10 draws
PFont f;
Background b;
boolean pause;

void setup() {
  size(700,400);
  noStroke();
  cp5 = new ControlP5(this);
  f = createFont("Arial",16,true); // STEP 3 Create Font
  b = new Background();
  
  cp5.addSlider("outer")
     .setPosition(100,370)
     .setWidth(100)
     .setRange(0,7) 
     .setValue(5)
     .setNumberOfTickMarks(8)
     .setSliderMode(Slider.FLEXIBLE)
     ;
     
      cp5.addSlider("inner")
     .setPosition(250,370)
     .setWidth(100)
     .setRange(0,7) 
     .setValue(5)
     .setNumberOfTickMarks(8)
     .setSliderMode(Slider.FLEXIBLE)
     ;
     
     //reset animation button
     cp5.addButton("reset")
     .setValue(0)
     .setPosition(400,370)
     .setSize(100,19)
     ;
     
     //pause animation button
     cp5.addButton("pause")
     .setValue(0)
     .setPosition(525,370)
     .setSize(100,19)
     ;
 
     pause = false;    
}
String getCodeString(){
  String code = "for (int i = 0; i < "+outer+"; i++) {\n"+"  drawCircle()\n"+  "for (int j = 0; j < "+inner+"; j++) {\n"+
              "  drawCircle()\n"+"  }\n"+
             "}";
return code;

}
void draw() {
if(!pause) {
  b.draw(this);
 
if(timer == 0) {

 
  if(innercount > inner) {
   outercount++;
   innercount = 0;
  }
  
  int spacey = 30;
  int spacex = 50;
  
  for(int i = 0; i < outer; i++) {
    if(i > outercount) break;
    fill(i*40, 150 , 200);
    ellipse(i*spacex + 50, 20, 20, 20);
    textFont(f,15);               
    fill(255);                        
    text("i="+i,i*spacex+50,20);
   for(int j = 0; j < inner; j++) {
    if(j >= innercount) break;
     fill(i*40, j, 100);
     int ypos = (j+1)*spacey+20;
     ellipse(i*spacex + 50, ypos, 20, 20);
     textFont(f,15);               
     fill(255);                        
     text("j="+j,i*spacex+50,ypos);
  }
}
innercount++;
timer = 20;
}

timer--;
}
}


void outer(float val) {
  resetAnimation();
  outer = (int) val;
}

void inner(float val) {
  resetAnimation();
  inner = (int) val;
}

void resetAnimation() {
  timer = 0;
  innercount = 0;
  outercount = 0;
  pause = false;
}

void reset(int val){
  resetAnimation();
}

void pause(int val) {
 pause = !pause; 
}

class Background {
  
 void draw(PApplet parent) {
   
 if(timer == 0 && outercount == 0 && innercount == 0) {  
   parent.fill(200);
   parent.rect(0, 0, width, height);
    
   parent.fill(100);
   parent.rect(0,350,width,50);
   
   parent.fill(240);
   parent.rect(475, 25, 200, 300);
   
   parent.textFont(f,15);               
   parent.fill(10);  
   parent.text(getCodeString(), 490, 50); 
 }
  }
}


