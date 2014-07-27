 String[] suit = { "club", "diamond", "heart", "spade" };
 String[] rank = {"2", "3", "4", "5", "6", "7", "8", "9", "10",
                    "J", "Q", "K", "A"};
                    
//index of current suit/rank while looping                    
int currentSuit = 0;
int currentRank = -1;
int currentXPos = 50; //xpos for card
int currentYPos = 50; //ypos for card
color button = color(240, 255, 240);
color button2 = color(240, 255, 240);
int timer = 0; //on 0, outer loop, on 1, inner loop, on 2 make card
int timer_prev = 0;
boolean auto = false;
void setup(){
size(800, 700);
background(150, 200, 150);
frameRate(60);
}

void draw(){
  drawButton();
  drawSuitRankTable();
  if(timer_prev == timer || auto) {
  if(currentSuit < suit.length) {
  //draw card
  if(timer == 2) {
    drawForLoop();
    drawCard(suit[currentSuit], rank[currentRank], currentXPos, currentYPos);
    currentXPos+=55;

  }
  //inner loop/rank change
  if(timer == 1) {
  drawForLoop();
  if(currentRank < rank.length-1) currentRank++; 
  else currentRank = 0;
  }
  //outerloop/suit change
  if(timer == 0) {
    if(currentSuit == 0 && currentRank == -1) drawForLoop();
    if(currentSuit < suit.length+1 && currentRank == rank.length-1) { 
    currentSuit++;
    currentYPos+=80;
    currentXPos = 50;
    drawForLoop();
  }
  }
  }
  timer_prev++;
  }
    if(auto) {
      timer++;
      if(timer == 3) timer = 0;
    }
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
  if(currentRank > rank.length -1 && currentSuit > suit.length-1) { 
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
  if(!(currentRank > rank.length -1 && currentSuit > suit.length-1)) { 
  pushMatrix();
  stroke(100, 140, 100);
  fill(button2);
  rect(160, 390, 100, 50);
  textSize(size);
  fill(100, 140, 100);
  text(text2, 175, 420);
  popMatrix();
  }
}

void drawSuitRankTable() {
  int r = 0; 
  int b = 0; 
  int g = 0;
for(int i = 0; i < suit.length; i++) {
if(i==currentSuit) {
  r = 200;
  b = 240;
  g = 240;
}
else {
 r = 0;
 b = 0;
 g = 0; 
}
 drawShape(20, 60+i*80, r,g,b, suit[i]); 
}

for(int i = 0; i < rank.length; i++) {
textSize(16);
if(i == currentRank) fill(200, 240, 240);
else fill(0);
text(rank[i], 70+i*55, 20, 150, 60+i*50); 
  }
}
void drawForLoop() {
  String loop = "String[] suit = { \"club\", \"diamond\", \"heart\", \"spade\" };\n"+
                "String[] rank = {\"2\", \"3\", \"4\", \"5\", \"6\", \"7\", \"8\", \"9\", \"10\",\n"+
                      "\"J\", \"Q\", \"K\", \"A\"};\n"+
               "String[] deck = new String[rank.length*suit.length]\n\n"+
                "for(int i = 0; i < suit.length; i++) {\n" +
                "  for(int j = 0; j < rank.length; j++) {\n" +
                "    //This card has the suit at index i of the suit array\n"+
                "    //And the rank at index j of the rank array\n"+
                "    deck[suit.length*j + i] = rank[j] + \"of\" + suit[i]\n"+
                "  }\n"+
                "}";
  int rank_ind = currentRank;
  int suit_ind = currentSuit;
  if(rank_ind == -1) rank_ind = 0;
  if(suit_ind > suit.length-1) suit_ind = suit.length-1;
  String info =  "i = " + suit_ind + "\nsuit["+suit_ind+"] is \""+ suit[suit_ind]+ "\"\n\n"+
                    "j = " + rank_ind + "\nrank["+rank_ind+"] is "+ rank[rank_ind]+ "\n\n"+
                    "deck[suits.length*i+j] = rank[i] \"of\" suit[i]\n"+
                    "deck["+ (suit.length*rank_ind + suit_ind) +"] = "+ rank[rank_ind] + " of " + suit[suit_ind] + "\n";
  pushMatrix();
  int line = timer;
  if(timer == 2) line = 4;
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
  rect(375, 530+14*line, 325, 15); 
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
 if(timer == 3) {
  timer = 0;
  timer_prev = 0;
 } 
 }
 
  if(mouseX > 160 && mouseX < 260 && mouseY > 390 && mouseY < 440) {
   button2 = color(220, 235, 220);
   auto = true;
   timer++;
 if(timer == 3) {
  timer = 0;
  timer_prev = 0;
 } 
}
}

void mouseReleased() {
  button = color(240, 255, 240);
  button2 = color(240, 255, 240);
}