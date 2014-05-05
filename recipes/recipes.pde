ArrayList<Thing> things; 

String t = "Door Lock"; 
String[] i = {
  "is unlocked", "is locked", "is open", "is closed"
}; 
String[] o = {
  "lock", "unlock"
}; 

String t2 = "Hue"; 
String[] i2 = {
  "is on", "is off"
}; 
String[] o2 = {
  "turn on", "turn off"
}; 

String t3 = "Camera";  
String[] i3 = {
  "is on", "is off", "is recording", "is not recording", "motion detected"
}; 
String[] o3 = {
  "turn on", "turn off", "record", "stop recording"
}; 

String t4 = "Roomba"; 
String[] i4 = {
  "is on", "is off", "is running", "is not running"
}; 
String[] o4 = {
  "turn on", "turn off", "run", "stop running"
}; 


int curLoc; 
Word hello; 

void setup() {
  size (800, 400); 

  things = new ArrayList<Thing>(); 
  things.add(new Thing (t, i, o)); 
  things.add(new Thing (t2, i2, o2)); 
  things.add(new Thing (t3, i3, o3)); 
  things.add(new Thing (t4, i4, o4)); 

}

void draw() {
  background (255); 

  //arrange things in a sentence
  curLoc = 0; 
  for (int i = 0; i < things.size(); i++) {
    Thing t = things.get(i);   
    println (i, "curloc", curLoc, "wi", t.name.wi ); 
    t.name.setLoc (curLoc, 70); 
    t.name.isHover (mouseX, mouseY); 
    t.name.display(); 
    line (curLoc, 100, curLoc, 200); 
    if (t.name.isHover(mouseX, mouseY)) showList (t); 
    
    curLoc += t.name.wi; //this has to be last
  }

}

void showList(Thing t) {
  for (int i = 0; i < t.inputs.length; i++) {
    t.inputs[i].setLoc (10, 150+(i*30));
     t.inputs[i].display(); 
  }
}

