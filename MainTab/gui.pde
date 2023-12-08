/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.
 
 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
 // It is safe to enter your event code here
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

synchronized public void win_draw1(PApplet appc, GWinData data) { //_CODE_:guiWindow:558243:
  appc.background(230);
} //_CODE_:guiWindow:558243:

public void addpersonMethod(GButton source, GEvent event) { //_CODE_:addperson:388698:
  profilePageADD = true;
  schedulePage = false;
  ppl = false;
  arnold = false;
  threeday = false;
  pause=true;
} //_CODE_:addperson:388698:

public void editpersonMethod(GDropList source, GEvent event) { //_CODE_:EditPerson:330604:
  editProfile = EditPerson.getSelectedText();
  profilePageEDIT = true;
  println("dropList1 - GDropList >> GEvent." + event + " @ " + millis());
} //_CODE_:EditPerson:330604:

public void scheduleMethod(GButton source, GEvent event) { //_CODE_:schedule:692670:
  schedulePage = true;
  profilePageADD = false;
} //_CODE_:schedule:692670:

String selectedWorkoutSplit = "PushPullLeg";  // Default workout split
String leaderboardmethod = "total";
public void scheduleorderMethod(GDropList source, GEvent event) { //_CODE_:ScheduleOrder:486547:
   if (event == GEvent.SELECTED) {
    // Get the selected workout split
    int index = source.getSelectedIndex();
    String[] splits = {"PushPullLeg", "ArnoldSplit", "3DaySplit"};
    selectedWorkoutSplit = splits[index];

    // Display the corresponding message
    displayWorkoutSplitMessage(selectedWorkoutSplit);
  }
} //_CODE_:ScheduleOrder:486547:

public void leaderboardMethod(GButton source, GEvent event) { //_CODE_:leaderboard:787741:
  profilePageADD = false;
  schedulePage = false;
  LeaderboardPage = true;
}
public void leaderboardStatMethod(GDropList source, GEvent event) { //_CODE_:LeaderboardStat:320203:
if (event == GEvent.SELECTED) {
int index = source.getSelectedIndex();
    String[] excercise = {"benchpress", "squat", "deadlift"};
    leaderboardmethod = excercise[index];
  }
  
  } //_CODE_:LeaderboardStat:320203:



// Create all the GUI controls.
// autogenerated do not edit
public void createGUI() {
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setMouseOverEnabled(false);
  surface.setTitle("Sketch Window");
  guiWindow = GWindow.getWindow(this, "GUI", 0, 0, 225, 300, JAVA2D);
  guiWindow.noLoop();
  guiWindow.setActionOnClose(G4P.KEEP_OPEN);
  guiWindow.addDrawHandler(this, "win_draw1");
  guiLabel = new GLabel(guiWindow, 50, 15, 120, 30);
  guiLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  guiLabel.setText("GUI");
  guiLabel.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  guiLabel.setOpaque(false);
  addperson = new GButton(guiWindow, 50, 65, 120, 25);
  addperson.setText("Add Person");
  addperson.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  addperson.addEventHandler(this, "addpersonMethod");
  EditPerson = new GDropList(guiWindow, 50, 95, 120, 100, 3, 10);
  EditPerson.setItems(loadStrings("list_330604"), 0);
  EditPerson.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  EditPerson.addEventHandler(this, "editpersonMethod");
  schedule = new GButton(guiWindow, 50, 135, 120, 25);
  schedule.setText("Schedule");
  schedule.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  schedule.addEventHandler(this, "scheduleMethod");
  ScheduleOrder = new GDropList(guiWindow, 50, 165, 120, 100, 3, 10);
  ScheduleOrder.setItems(loadStrings("list_486547"), 0);
  ScheduleOrder.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  ScheduleOrder.addEventHandler(this, "scheduleorderMethod");
  leaderboard = new GButton(guiWindow, 50, 205, 120, 25);
  leaderboard.setText("Leaderboard");
  leaderboard.setLocalColorScheme(GCScheme.RED_SCHEME);
  leaderboard.addEventHandler(this, "leaderboardMethod");
  LeaderboardStat = new GDropList(guiWindow, 50, 235, 120, 100, 3, 10);
  LeaderboardStat.setItems(loadStrings("list_320203"), 0);
  LeaderboardStat.setLocalColorScheme(GCScheme.RED_SCHEME);
  LeaderboardStat.addEventHandler(this, "leaderboardStatMethod");
  powerliftPro = new GLabel(guiWindow, 50, 283, 120, 15);
  powerliftPro.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  powerliftPro.setText("PowerLift Pro");
  powerliftPro.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  powerliftPro.setOpaque(false);
  guiWindow.loop();
}

// Variable declarations
// autogenerated do not edit
GWindow guiWindow;
GLabel guiLabel;
GButton addperson;
GDropList EditPerson;
GButton schedule;
GDropList ScheduleOrder;
GButton leaderboard;
GDropList LeaderboardStat;
GLabel powerliftPro;
