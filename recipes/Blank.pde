class Blank {
  
  color blue, lightBlue, c; 
  int xLoc, yLoc, wi, hi; 
  
  Blank() {
    blue = color (#3A7ADE);
    lightBlue = color(#99BDF5); 
  }
  
  void show(int x, int y, int w, int h) { //get longest word size?
   xLoc = x; 
   yLoc = y; 
   wi = w; 
   hi = h; 
   fill (c); 
   noStroke(); 
    rect (xLoc, yLoc-hi, wi, hi); 
    stroke (240); 
    //plus
    line (xLoc + wi/3, yLoc - (hi/2), (xLoc + wi) - wi/3, yLoc- (hi/2));
    line (xLoc + wi/2, yLoc - hi/3, xLoc + wi/2, yLoc -h + h/3); 
    clicked(); 
  }
  
  boolean clicked() {
    int x = mouseX; 
    int y = mouseY; 
    if (x > xLoc && x < xLoc + wi && y > yLoc  - hi && y < yLoc && mousePressed) {
      c= lightBlue; 
      return true; 
    } else {
       c = blue;
      return false;     
    }
  }

}
