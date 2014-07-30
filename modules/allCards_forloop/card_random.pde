 String[] suit = { "club", "diamond", "heart", "spade" };
 String[] rank = {"2", "3", "4", "5", "6", "7", "8", "9", "10",
                    "J", "Q", "K", "A"};
  double random1 = Math.random();
  double random2 = Math.random();
  color button = color(240, 255, 240);
                    
//index of current suit/rank while looping                    
int timer = 0; //random i, random j, make card: 0, 1, 2 respectively
void setup(){
size(800, 700);
background(150, 200, 150);
frameRate(50);
}

void draw(){
 drawRandomCardCode();
 drawButton();
}
void drawButton(){
  String buttonText = "Next";
  int size = 20;
  if(timer == 2) { 
    buttonText = "Restart";
  }
  pushMatrix();
  stroke(100, 140, 100);
  fill(button);
  rect(60, 360, 100, 50);
  textSize(size);
  fill(100, 140, 100);
  text(buttonText, 75, 395);
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

void drawCardLarge(String suit, String rank, int xpos, int ypos){
  pushMatrix();
  boolean red = false;
  if(suit.equals("diamond") || suit.equals("heart")) red = true;
  fill(255);
  stroke(255);
  rect(xpos, ypos, 100, 125);
  int r = 0;
  int b = 0;
  int g = 0;
  if(red) r = 255;
  drawShape(xpos+10, ypos+10, r, g, b, suit);
  textSize(18);
  text(rank, xpos+80, ypos+120); 
  popMatrix();
 
}

void drawSuitsAndRanks() {

}

void drawRandomCardCode() {
  int suit_ind = (int) (random1*suit.length);
  int rank_ind = (int) (random2*rank.length);
   String code = "String[] suit = { \"club\", \"diamond\", \"heart\", \"spade\" };\n"+
                "String[] rank = {\"2\", \"3\", \"4\", \"5\", \"6\", \"7\", \"8\", \"9\", \"10\",\n"+
                      "\"J\", \"Q\", \"K\", \"A\"};\n\n"+
                "int i = (int) (Math.random() * suit.length)\n"+
                "int j = (int) (Math.random() * rank.length)\n"+
                "makeCard(suit[i], rank[j])";
                
    String info = "int i = (int) (" + random1 + " * suit.length)\n"+
                  "      = (int) (" + random1 + " * " + suit.length+ ")\n"+
                  "      = (int) (" + (random1 * suit.length) + ")\n"+
                  "      = " + ((int) (random1 * suit.length)) + "\n";
           
       String j = "int j = (int) (" + random2 + " * rank.length)\n"+
                  "      = (int) (" + random2 + " * " + rank.length+ ")\n"+
                  "      = (int) (" + (random2 * rank.length) + ")\n"+
                  "      = " + ((int) (random2 * rank.length)) + "\n\n";
                  
        String makeCard = "makeCard(suit[" + suit_ind +"],"+
                  "rank["+ rank_ind +"]);";
   
   if(timer == 1) info = info + j;
   if(timer == 2) info = info + j + makeCard;
                  
                
  pushMatrix();
  int line = timer;
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
  rect(375, 518+14*line, 325, 15); 
  //code text
  fill(20);
  textSize(11);
  text(code, 400, 475);
  if(timer == 2) {
  drawCardLarge(suit[suit_ind], rank[rank_ind], 300, 200);
  }
  popMatrix();  
}

void mousePressed() {
 if(mouseX > 60 && mouseX < 160 && mouseY > 360 && mouseY < 410) {
   button = color(220, 235, 220);
 timer++;
 if(timer == 3) {
  background(150, 200, 150);
  timer = 0;
  random1 = Math.random();
  random2 = Math.random();
 } 
 }
}
void mouseReleased() {
  button = color(240, 255, 240);
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

void stop() {
  timer = 0;
}