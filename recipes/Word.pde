class Word {

  String word;
  int fontSize = 30; 
  float h, wi;
  float yLoc, xLoc; 
  boolean drawRect; 
  boolean isInput; //input or output? 

  Word(String w) {
    word = w; 
    h = textAscent() + textDescent();
    //wi = textWidth (word);
  }

  void setWord(String w) {
    word = w; 
    h = textAscent() + textDescent();
  }

  void setLoc (int x, float y) {
    xLoc = x;
    yLoc = y;
  }

  boolean isHover(int x, int y) {
    if (x > xLoc && x < xLoc + textWidth(word) && y > yLoc  - h && y < yLoc) {
      drawRect = true;
      return true;
    } 
    else {
      drawRect = false; 
      return false;
    }
  }
  
  boolean isClicked() {
    if (isHover(mouseX, mouseY) && mousePressed) return true; 
    else return false; 
  }

  void display() {
    textSize(fontSize); 
    h = textAscent() + textDescent(); 
    wi = (textWidth (word)) + (0); 
    //println (word, "width", textWidth(word), "wi", wi); 
    if (drawRect) {
      fill (200); 
      noStroke(); 
      rect (xLoc, yLoc - h, textWidth(word), h);
    }
    fill (0); 
    
    text (word, xLoc, yLoc);
  }
}

