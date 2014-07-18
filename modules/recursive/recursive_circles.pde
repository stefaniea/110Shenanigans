int depth = window.depth;

void setup() {
  size(640, 360);
  noStroke();
 // noLoop();
  depth = window.depth;
}

void draw() {

  depth = window.depth;
  if(depth != 0) {
  drawCircle(width/2, 280, depth);
  }
}

void drawCircle(int x, int radius, int level) {                    
 
  float mousecolorx = min(50, mouseX/50);
  float tt = 126 * level/5.0;
  float color = tt+mousecolorx;
  fill(color);
  ellipse(x, height/2, radius*2, radius*2);      
  if(level > 1) {
    level = level - 1;
    drawCircle(x - radius/2, radius/2, level);
    drawCircle(x + radius/2, radius/2, level);
  }
}
