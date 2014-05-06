class Thing {
  Word[] inputs; 
  Word[] outputs; 
  
  Word name; 
  Word action; 
  int x, y; 
  float totalWi, curLoc; 
  
  boolean isInput; 
  
  boolean isSelected; 

  int state = 3; 
  
  Action actionBlank;

  Thing (String n, String[]in, String[] out) {
  
  name = new Word(n);   
  action = new Word (""); 
  inputs = new Word[in.length]; 
  outputs = new Word [out.length]; 
  actionBlank = new Action(); 
  actionBlank.addPlus = false; 

  for (int i = 0; i < in.length; i++) {
    inputs[i] = new Word(in[i]); 
  }
  
  for (int i = 0; i < out.length; i++) {
    outputs[i] = new Word(out[i]); 
  }

  }
  
  void setWord (String w) {
    name.word = w; 
  }
  
  void setAction (String a) {
    action.word = a; 
  }
  
  void setState (int s) {
    state = s; 
  }
  
  void setLoc (int x_, int y_) {
    x = x_; 
    y = y_; 
  }
  
  void show() {
    
   totalWi = name.wi + action.wi + textWidth("is"); //plus action plus other letters
   
   
   if (state <4) { //device has been chosen, set if input or output (think about that later), display blank action 
   name.setLoc (x, y); 
   name.display(); 
   //name.isHover(mouseX, mouseY); 
   text ("is", x + name.wi, y); 
   actionBlank.show(int(x + totalWi + textWidth("hi")),y, 100, (int)name.h); 
   }  
   
   if (state <3) { //blank has been selected and now options are being displayed
   }
   
   if (state <2) {  //action has been chosen and is now being displayed. mark it as "closed" and call it a day. joint blank appears
    actionBlank.showB = false; 
    action.setLoc (x + (int)name.wi + (int) textWidth("is"), y); 
    action.display(); 
   }
   
   if (state < 1) { //yes to 0


   }
   
   println (state); 
   /*
   
  switch (state) {
   case 0: //device has been chosen, set if input or output (think about that later), display blank action 
   name.setLoc (x, y); 
   name.display(); 
   //name.isHover(mouseX, mouseY); 
   text ("is", x + totalWi, y); 
   actionBlank.show(int(x + totalWi + textWidth("hi")),y, 100, (int)name.h); 
   
   
   break; 
   
   case 1: //blank has been selected and now options are being displayed
   break;
   
   case 2: //action has been chosen and is now being displayed. mark it as "closed" and call it a day. joint blank appears
   break; 
   
   case 3:
   //nothing
   break; 
  
  }
  */
  
  }
  
  
  
  //make constructor versions for no in, no out
}
