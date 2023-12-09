//global variables
int month = month();
int day = day();
int year = year();
String d = String.valueOf(day);
String m = String.valueOf(month);
String y = String.valueOf(year);
boolean ppl, arnold, threeday;

//Booleans for the ppl and arnold split windows
boolean pause = false;
boolean showPushWindow = false;
boolean showArmsWindow = false;
boolean showLegsWindow = false;
boolean AshowPushWindow = false;
boolean AshowArmsWindow = false;
boolean AshowLegsWindow = false;

void dateAndTime() { //Date and Time Function
  fill(red, green, blue);
  textSize(20);
  text(y, 900, 20);
  text(",", 940, 20);
  text(m, 950, 20);
  text(",", 970, 20);
  text(d, 978, 20);
}

void drawScheduleText() { //Schedule Maintext
  fill(red, green, blue);
  textSize(65);
  text("Schedule", 374, 75);
  textSize(35);
  text("mon", 165, 185);
  text("tues", 270, 185);
  text("wed", 370, 185);
  text("thurs", 463, 185);
  text("fri", 584, 185);
  text("sat", 679, 185);
  text("sun", 774, 185);
}

void wos() {
  // Display workout schedule based on the selected split
  switch (selectedWorkoutSplit) {//for the drop down menu
  case "PushPullLeg": //Toggles based on dropdown
    drawPushPullLegSplit();
    ppl = true;
    arnold = false;
    threeday = false;
    break;

  case "ArnoldSplit": //Toggles based on dropdown
    drawArnoldSplit();
    ppl = false;
    arnold = true;
    threeday = false;
    break;

  case "3DaySplit": //Toggles based on dropdown
    draw3DaySplit();
    ppl = false;
    arnold = false;
    threeday = true;
    break;

  default:
    // Default to Push Pull Leg Split if no valid selection
    drawPushPullLegSplit();
  }
}

void drawPushPullLegSplit() {  //Fills in Calandar for PPL Split
  fill(0);
  textSize(25);
  text("Push", 175, 245);
  text("Push", 175, 330);
  text("Push", 175, 415);
  text("Pull", 280, 245);
  text("Pull", 280, 330);
  text("Pull", 280, 415);
  text("Legs", 375, 245);
  text("Legs", 375, 330);
  text("Legs", 375, 415);
  text("Push", 475, 245);
  text("Push", 475, 330);
  text("Push", 475, 415);
  text("Pull", 582, 245);
  text("Pull", 582, 330);
  text("Pull", 582, 415);
  text("Legs", 678, 245);
  text("Legs", 678, 330);
  text("Legs", 678, 415);
  text("Rest", 777, 245);
  text("Rest", 777, 330);
  text("Rest", 777, 415);
}


void drawArnoldSplit() { //Fills in Calandar for Arnold Split
  fill(0);
  textSize(25);
  text("Push", 175, 245);
  text("Push", 175, 330);
  text("Push", 175, 415);
  text("Arms", 276, 245);
  text("Arms", 276, 330);
  text("Arms", 276, 415);
  text("Legs", 375, 245);
  text("Legs", 375, 330);
  text("Legs", 375, 415);
  text("Push", 475, 245);
  text("Push", 475, 330);
  text("Push", 475, 415);
  text("Arms", 574, 245);
  text("Arms", 574, 330);
  text("Arms", 574, 415);
  text("Legs", 678, 245);
  text("Legs", 678, 330);
  text("Legs", 678, 415);
  text("Rest", 777, 245);
  text("Rest", 777, 330);
  text("Rest", 777, 415);
}

void draw3DaySplit() { //Fills in Calandar for 3 day Split
  fill(0);
  textSize(25);
  text("Push", 175, 245);
  text("Push", 175, 330);
  text("Push", 175, 415);
  text("Rest", 276, 245);
  text("Rest", 276, 330);
  text("Rest", 276, 415);
  text("Pull", 380, 245);
  text("Pull", 380, 330);
  text("Pull", 380, 415);
  text("Rest", 475, 245);
  text("Rest", 475, 330);
  text("Rest", 475, 415);
  text("Legs", 578, 245);
  text("Legs", 578, 330);
  text("Legs", 578, 415);
  text("Rest", 678, 245);
  text("Rest", 678, 330);
  text("Rest", 678, 415);
  text("Rest", 777, 245);
  text("Rest", 777, 330);
  text("Rest", 777, 415);
}

void displayPushPullLegDays() { //Displays PPL Split
  fill(0);
  textSize(25);
  text("Push", 175, 245);
  text("Push", 175, 330);
  text("Push", 175, 415);
  text("Pull", 280, 245);
  text("Pull", 280, 330);
  text("Pull", 280, 415);
  text("Legs", 375, 245);
  text("Legs", 375, 330);
  text("Legs", 375, 415);
  text("Push", 475, 245);
  text("Push", 475, 330);
  text("Push", 475, 415);
  text("Pull", 582, 245);
  text("Pull", 582, 330);
  text("Pull", 582, 415);
  text("Legs", 678, 245);
  text("Legs", 678, 330);
  text("Legs", 678, 415);
  text("Rest", 777, 245);
  text("Rest", 777, 330);
  text("Rest", 777, 415);
}


void displayArnoldDays() { //Displays arnold Split
  fill(0);
  textSize(25);
  text("Push", 175, 245);
  text("Push", 175, 330);
  text("Push", 175, 415);
  text("Arms", 274, 245);
  text("Arms", 274, 330);
  text("Arms", 274, 415);
  text("Legs", 375, 245);
  text("Legs", 375, 330);
  text("Legs", 375, 415);
  text("Push", 475, 245);
  text("Push", 475, 330);
  text("Push", 475, 415);
  text("Arms", 568, 245);
  text("Arms", 568, 330);
  text("Arms", 568, 415);
  text("Legs", 678, 245);
  text("Legs", 678, 330);
  text("Legs", 678, 415);
  text("Rest", 777, 245);
  text("Rest", 777, 330);
  text("Rest", 777, 415);
}

void display3DaySplitDays() { //Displays 3 day Split
  fill(0);
  textSize(25);
  text("Push", 175, 245);
  text("Push", 175, 330);
  text("Push", 175, 415);
  text("Rest", 276, 245);
  text("Rest", 276, 330);
  text("Rest", 276, 415);
  text("Pull", 380, 245);
  text("Pull", 380, 330);
  text("Pull", 380, 415);
  text("Rest", 475, 245);
  text("Rest", 475, 330);
  text("Rest", 475, 415);
  text("Legs", 578, 245);
  text("Legs", 578, 330);
  text("Legs", 578, 415);
  text("Rest", 678, 245);
  text("Rest", 678, 330);
  text("Rest", 678, 415);
  text("Rest", 777, 245);
  text("Rest", 777, 330);
  text("Rest", 777, 415);
}

void drawSchedule() { //Draws schedule lines
  fill(255);
  rect(150, 150, 700, 300);
  line(150, 200, 850, 200);
  line(150, 275, 850, 275);
  line(150, 365, 850, 365);
  int numDays = 7;
  float daySpacing = 700.0 / numDays;

  for (int i = 1; i < numDays; i++) {
    float x = 150 + i * daySpacing;
    line(x, 150, x, 450);
  }
}

void mousePressed() { //Mouse click functions based off the clicking handlers tab
  if (pause) {
    loop();
  } else {
    noLoop();
  }

  if (schedulePage) { //if its the schedule page
    if (ppl) { //ppl dropdown selected
      PushclickHandler();
    } else if (arnold) {//arnold dropdown selected
      ArnoldclickHandler();
    } else if (threeday) {//3 day dropdown selected
      ThreedayclickHandler();
    }
    buttonClickHandler();
  }
}

//else if (threeday){
//  ThreedayclickHandler();
//}


void PushdrawWindow() { //Push day window
  fill(255);
  stroke(red, green, blue);
  rect(350, 75, 300, 325);
  // Exit button
  fill(255, 0, 0);
  rect(620, 80, 30, 20);
  // Text
  fill(0);
  textSize(35);
  text("Exercises", 433, 120);
  //Push Draw
  textSize(20);
  text("Bench Press: 3x6-8", 420, 190);
  text("Shoulder Press: 3x8-10", 408, 220);
  text("Incline Dumbbell Flyes: 3x10-15", 370, 250);
  text("Triceps Pushdowns: 3x10-15", 382, 280);
  text("Abs: 10 Mins of Misc. ab work", 380, 310);
}

void ArmsdrawWindow() { //pull day window
  fill(255);
  stroke(red, green, blue);
  rect(350, 75, 300, 325);
  // Exit button
  fill(255, 0, 0);
  rect(620, 80, 30, 20);
  // Text
  fill(0);
  textSize(35);
  text("Exercises", 433, 120);
  //Push Draw
  textSize(20);
  text("Pull Ups: 3x6-8", 440, 190);
  text("Lateral Pulldowns: 3x8-10", 390, 220);
  text("Cable Curls: 3x10-15", 410, 250);
  text("Hammer Curls: 3x10-15", 400, 280);
  text("Forearm Curls", 440, 310);
}

void LegsdrawWindow() { //leg day window
  fill(255);
  stroke(red, green, blue);
  rect(350, 75, 300, 325);
  // Exit button
  fill(255, 0, 0);
  rect(620, 80, 30, 20);
  // Text
  fill(0);
  textSize(35);
  text("Exercises", 433, 120);
  //Push Draw
  textSize(20);
  text("Barbell Squats: 3x6-8", 415, 190);
  text("Leg Press: 3x8-10", 430, 220);
  text("Leg Extensions: 3x10-15", 405, 250);
  text("Leg Curls: 3x10-15", 426, 280);
  text("Calf Raises", 456, 310);
}

void APushdrawWindow() { //arnold push day window
  fill(255);
  stroke(red, green, blue);
  rect(350, 75, 300, 325);
  // Exit button
  fill(255, 0, 0);
  rect(620, 80, 30, 20);
  // Text
  fill(0);
  textSize(35);
  text("Exercises", 433, 120);
  //Push Draw
  textSize(20);
  text("Bench Press: 3x6-8", 420, 190);
  text("Shoulder Press: 3x8-10", 408, 220);
  text("Incline Dumbbell Flyes: 3x10-15", 370, 250);
  text("Triceps Pushdowns: 3x10-15", 382, 280);
  text("Dips: 3x10-12", 447, 310);
}

void AArmsdrawWindow() { //arnold arm day window
  fill(255);
  stroke(red, green, blue);
  rect(350, 75, 300, 325);
  // Exit button
  fill(255, 0, 0);
  rect(620, 80, 30, 20);
  // Text
  fill(0);
  textSize(35);
  text("Exercises", 433, 120);
  //Push Draw
  textSize(20);
  text("Overhead Press: 4x6-8", 410, 190);
  text("Arnold Press: 4x8-10", 415, 220);
  text("Skull Crushers: 3x12-15", 406, 250);
  text("Face Pulls: 4x8-10", 423, 280);
  text("Bicep 21s: 3 sets", 434, 310);
}

void ALegsdrawWindow() { //arnold leg day window
  fill(255);
  stroke(red, green, blue);
  rect(350, 75, 300, 325);
  // Exit button
  fill(255, 0, 0);
  rect(620, 80, 30, 20);
  // Text
  fill(0);
  textSize(35);
  text("Exercises", 433, 120);
  //Push Draw
  textSize(20);
  text("Squats: 3x6-8", 442, 190);
  text("Leg Press: 3x8-10", 430, 220);
  text("Cable Crunches: 2x25", 410, 250);
  text("Hack Squat: 3x8-10", 420, 280);
  text("Calf Raises: 3x8-16", 426, 310);
}

void welcome() { //Welcome graphic
  fill(red, green, blue);
  textSize(105);
  text("Welcome To", 232, 85);
}
