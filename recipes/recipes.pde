ArrayList<Thing> things; //thing phrases
ArrayList<Thing> devices; //complete list

String t = "Door Lock"; 
String[] i = {
  "unlocked", "locked", "open", "closed"
}; 
String[] o = {
  "lock", "unlock"
}; 

String t2 = "Hue"; 
String[] i2 = {
  "on", "off"
}; 
String[] o2 = {
  "turn on", "turn off"
}; 

String t3 = "Camera";  
String[] i3 = {
  "on", "off", "recording", "not recording", "motion detected"
}; 
String[] o3 = {
  "turn on", "turn off", "record", "stop recording"
}; 

String t4 = "Roomba"; 
String[] i4 = {
  "on", "off", "running", "not running"
}; 
String[] o4 = {
  "turn on", "turn off", "run", "stop running"
}; 

Joint first;


int curLoc; 
Word hello; 

int xLoc, yLoc; 

boolean showDevices = false;
boolean showThings = false; 
boolean canAddThing = false; 



void setup() {
  size (800, 400); 

  things = new ArrayList<Thing>(); 
  devices = new ArrayList<Thing>(); 

  devices.add(new Thing (t, i, o)); 
  devices.add(new Thing (t2, i2, o2)); 
  devices.add(new Thing (t3, i3, o3)); 
  devices.add(new Thing (t4, i4, o4)); 

  xLoc = 20; 
  yLoc = 100; 

  first = new Joint();
  first.addPlus = true; 
}

void draw() {
  background (255); 

  textSize (30); 
  fill (0); 
  text ("When", xLoc, yLoc); //thsis will eventually be a joint object

  //first blank disappears after the first device is added
  curLoc = xLoc + (int)textWidth("When");
  if (things.size() < 1) first.show(curLoc, yLoc, 30, 30); 
  if (first.clicked()) {
    showDevices = true; 
    canAddThing = true;
  }
  if (showDevices) showDeviceList(); 

  //arrange things in a sentence

  for (int i = 0; i < things.size(); i++) {
    Thing t = things.get(i);   
    t.setLoc(curLoc, yLoc); 
    t.show(); 
    if (t.state == 3 && t.actionBlank.clicked()) {
      showThings = true; 
      //t.state = 1; 
    }
    if (showThings) {
      //if (t.state == 1) {
      showList(t); 
      //t.setState(); 
    }
    
    curLoc += t.totalWi; 
  }
}

void showList(Thing t) {
  for (int i = 0; i < t.inputs.length; i++) {
    t.inputs[i].setLoc (10, 150+(i*40));
    //t.inputs[i].isHover(mouseX, mouseY); 
        if (t.inputs[i].isClicked()) {
      t.setAction(t.inputs[i].word);  
      t.setState(1); 
      showThings = false; 
    }
    t.inputs[i].display();
  }
}

void showDeviceList() {
  for (int i = 0; i < devices.size(); i++) {
    Thing d = devices.get(i); 
    d.name.setLoc (10, 150+(i*40));
    if (d.name.isClicked()) {
      if (canAddThing) {
        makeNewThing(d); 
        canAddThing = false;
      }
    }
    d.name.display();
  }
}

void makeNewThing(Thing t) {
  t.setState(3); 
  things.add(t);
  showDevices = false; 
}

