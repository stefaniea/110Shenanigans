 String[] suit = { "club", "diamond", "heart", "spade" };
 String[] rank = {"2", "3", "4", "5", "6", "7", "8", "9", "10",
                    "J", "Q", "K", "A"};
String[] deck;
                    
//index of current suit/rank while looping                    
int currentXPos = 50; //xpos for card
int currentYPos = 50; //ypos for card
color button = color(240, 255, 240);
color button2 = color(240, 255, 240);
int timer = 0; 
boolean auto = false;
int currentIndex = 0;
boolean swap = false;
double random;

void setup(){
size(800, 700);
background(150, 200, 150);
frameRate(60);
random = Math.random();

deck = new String[rank.length*suit.length];
for(int i = 0; i < rank.length; i++) {
  for(int j = 0; j < suit.length; j++) {
    deck[rank.length*j + i] = rank[i] + " of " + suit[j];
  }
}
}
void drawAllCards() {
  for(int i = 0; i < deck.length; i++) {
   String rank_str = split(deck[i], ' ')[0];
   String suit_str = split(deck[i], ' ')[2];
  if(i % 13 == 0 && i != 0) { 
     currentYPos+=80;
     currentXPos = 50;
   }
   drawCard(suit_str, rank_str, currentXPos, currentYPos); 

   currentXPos+=55;
  }
}

void draw(){
   if(timer > 6) {
   timer = 1; 
   random = Math.random();
   currentIndex++;
  }
    if(currentIndex > 51) {
      currentIndex = 0;
      setup();
    }
  if(timer == 6) { 
     background(150, 200, 150);
  shuffleCard(random, currentIndex);
  timer++;
  }
  int r = currentIndex + (int) (random * (deck.length-currentIndex));
  if(timer == 4) highlightCard(r);
  if(timer == 5) highlightCard(currentIndex);
  drawButton();
  drawSuitRankTable();
  drawAllCards();
  currentXPos = 50;
  currentYPos = 50;
  drawForLoop(random, currentIndex);
  if(auto) timer++;
}

void highlightCard(int index) {
 int row = ((int) floor(index/13));
 int column = index % 13;
 int xpos = 50 + column * 55;
 int ypos = 50 + row * 80;
 if(index == 0) {
   ypos = 50;
   xpos = 50;
 }
 
 pushMatrix();
 fill(100, 100, 100);
 rect(xpos-3, ypos-3, 53, 78);
 popMatrix();
 
}

void drawCard(String suit, String rank, int xpos, int ypos){
  boolean red = false;
  if(suit.equals("diamond") || suit.equals("heart")) red = true;
  pushMatrix();
  fill(255);
  stroke(255);
  rect(xpos, ypos, 50, 75);
  int r = 0;
  int b = 0;
  int g = 0;
  if(red) r = 255;
  drawShape(xpos+10, ypos+10, r, g, b, suit);
  textSize(18);
  text(rank, xpos+28, ypos+68); 
  popMatrix();
 
}

void drawButton(){
  String buttonText = "Next";
  int size = 20;
  if(currentIndex == 51 && timer > 6) { 
    buttonText = "Restart";
  }
  pushMatrix();
  stroke(100, 140, 100);
  fill(button);
  rect(60, 390, 100, 50);
  textSize(size);
  fill(100, 140, 100);
  text(buttonText, 75, 420);
  popMatrix();
  
  String text2 = "Play All";
  //if(!(currentRank > rank.length -1 && currentSuit > suit.length-1)) { 
  pushMatrix();
  stroke(100, 140, 100);
  fill(button2);
  rect(160, 390, 100, 50);
  textSize(size);
  fill(100, 140, 100);
  text(text2, 175, 420);
  popMatrix();
  }
//}

void drawSuitRankTable() {
  int r = 0; 
  int b = 0; 
  int g = 0;
for(int i = 0; i < suit.length; i++) {
/*if(i==currentSuit) {
  r = 200;
  b = 240;
  g = 240;
}
else {
 r = 0;
 b = 0;
 g = 0; 
}*/
 drawShape(20, 60+i*80, r,g,b, suit[i]); 
}

for(int i = 0; i < rank.length; i++) {
textSize(16);
//if(i == currentRank) fill(200, 240, 240);
//else fill(0);
text(rank[i], 70+i*55, 20, 150, 60+i*50); 
  }
}
void shuffleCard(double random, int index) {
  int N = deck.length;
   int r = index + (int) (random * (N-index));
   String t = deck[r];
   deck[r] = deck[index];
   deck[index] = t; 
}
             
void drawForLoop(double random, int index) {
  String loop = "int N = deck.length;\n"+
                "for (int i = 0; i < N; i++) {\n"+
                "  int r = i + (int) (Math.random() * (N-i));\n"+
                "  String t = deck[r];\n"+
                "  deck[r] = deck[i];\n"+
                "  deck[i] = t;\n"+
                "}";
  int r = index + (int) (random * (52-index));

  String intN =  "int N = deck.length = 52\n";
  String inti = "int i = "+index + "\n";
  String intr = "int r = i + (int) ( Math.random() * 52 - index))\n" +
                 "      = "  + index + " (int) ( Math.random() * " + (52-index) + "\n" +
                 "      = " + r + "\n";
   String stringT = "String t = deck[r] = " + deck[r] + "\n";
   String deckR =  "deck[r] = deck[i] = " + deck[index] + "\n";
   String decki =  "deck[i] = t";
   String[] infoArray = {intN, inti, intr, stringT, deckR, decki, ""};
   String info = "";
   for(int i = 0; i < timer; i++) {
    info = info + infoArray[i]; 
   }
  pushMatrix();
  int line = timer;
  if(timer >= 6) line--;

  //background for extra info:
  noStroke();
  fill(100, 150, 100);
  rect(50, 450, 350, 225);
  //extra info:
  textSize(11);
  fill(20);
  text(info, 60, 475);
  
  //background for code
  fill(200);
  rect(375, 450, 325, 225);
  //highlight line of code
  fill(230);
  rect(375, 462+13*line, 325, 15); 
  //code text
  fill(20);
  textSize(11);
  text(loop, 400, 475);
  
  popMatrix();
}

void drawShape(int xpos, int ypos, int r, int g, int b, String suit){
  pushMatrix();
  String file = suit + ".svg";
  PShape s = loadShape(file);
  s.disableStyle();
  fill(r, g, b);
  stroke(r, g, b);
  shape(s, xpos, ypos, 25, 25);
  popMatrix();
}
void mousePressed() {
 if(mouseX > 60 && mouseX < 160 && mouseY > 390 && mouseY < 440) {
   button = color(220, 235, 220);
    timer++;
    swap = true;
 }
 
  if(mouseX > 160 && mouseX < 260 && mouseY > 390 && mouseY < 440) {
   button2 = color(220, 235, 220);
   auto = true;
}
}

void mouseReleased() {
  button = color(240, 255, 240);
  button2 = color(240, 255, 240);
}

void stop() {
  timer = 0;
  auto = false;
}

