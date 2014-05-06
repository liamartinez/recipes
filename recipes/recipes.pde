ArrayList<Thing> things; //thing phrases
ArrayList<Thing> devices; //complete list

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

Joint first;


int curLoc; 
Word hello; 

int xLoc, yLoc; 

boolean showDevices = false;

void setup() {
  size (800, 400); 

  things = new ArrayList<Thing>(); 
  devices = new ArrayList<Thing>(); 
  
  devices.add(new Thing (t,i,o)); 
  devices.add(new Thing (t2,i2,o2)); 
  devices.add(new Thing (t3,i3,o3)); 
  devices.add(new Thing (t4,i4,o4)); 
  
  xLoc = 20; 
  yLoc = 100; 
  
  first = new Joint(); 
}

void draw() {
  background (255); 
  
  textSize (30); 
  fill (0); 
  text ("When", xLoc, yLoc); //this will eventually be a joint object
  
  if (things.size() < 1) first.show(xLoc + (int)textWidth("When"), yLoc, 30, 30);
  if (first.clicked()) showDevices = true; 
  if (showDevices) showDeviceList(); 
  
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

void showDeviceList() {
  for (int i = 0; i < devices.size(); i++) {
  Thing d = devices.get(i); 
  d.name.setLoc (10, 150+(i*40));
  d.name.isHover (mouseX, mouseY); 
  d.name.display(); 
  }
}

