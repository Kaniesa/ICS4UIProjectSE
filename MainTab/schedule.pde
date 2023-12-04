int month = month();
int day = day();
int year = year();
String d = String.valueOf(day);
String m = String.valueOf(month);
String y = String.valueOf(year);


//void setup() {
//  size(1000, 500);
//}


//void draw() {
//  background(255);
//  drawSchedule();
//  dateAndTime();
//  drawScheduleText();
//  drawWO();
//}
void dateAndTime() {
  fill(0);
  textSize(20);
  text(y, 900, 20);
  text(",", 940, 20);
  text(m, 950, 20);
  text(",", 970, 20);
  text(d, 978, 20);
}

void drawScheduleText() {
  fill(0);
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

void drawWO() {
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
  //Mkae this a loop when time is available
}

void drawSchedule() {
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

boolean pause = false;
boolean showPushWindow = false;
boolean showArmsWindow = false;
boolean showLegsWindow = false;

void mousePressed() {
  if (pause) {
    loop();
  } else {
    noLoop();
  }

  if (mouseX > 150 && mouseX < 250 && mouseY > 200 && mouseY < 450 || mouseX > 450 && mouseX < 550 && mouseY > 200 && mouseY < 450) {
    pause = false;
    showPushWindow = true;
  } else if (mouseX > 250 && mouseX < 350 && mouseY > 200 && mouseY < 450 || mouseX > 550 && mouseX < 650 && mouseY > 200 && mouseY < 450) {
    pause = false;
    showArmsWindow = true;
  } else if (mouseX > 350 && mouseX < 450 && mouseY > 200 && mouseY < 450 || mouseX > 650 && mouseX < 750 && mouseY > 200 && mouseY < 450) {
    pause = false;
    showLegsWindow = true;
  }

  // Check for exit button click
  if (showPushWindow || showArmsWindow || showLegsWindow) {
    if (mouseX > 620 && mouseX < 650 && mouseY > 80 && mouseY < 100) {
      pause = true;
      showPushWindow = false;
      showArmsWindow = false;
      showLegsWindow = false;
    }
  }


  if (pause == true) {
    loop();
  } else if (pause != true) {
    noLoop();
  }

  if (mouseX>150 && mouseX<250 && mouseY>200 && mouseY<450 ||mouseX>450 && mouseX<550 && mouseY>200 && mouseY<450  ) {
    println("push");
    stroke(0);
    pause = false;
    PushdrawWindow();
  } else if (mouseX>250 && mouseX<350 && mouseY>200 && mouseY<450 ||mouseX>550 && mouseX<650 && mouseY>200 && mouseY<450  ) {
    println("pull");
    stroke(0);
    pause = false;
    ArmsdrawWindow();
  } else if (mouseX>350 && mouseX<450 && mouseY>200 && mouseY<450 ||mouseX>650 && mouseX<750 && mouseY>200 && mouseY<450  ) {
    println("legs");
    stroke(0);
    pause = false;
    LegsdrawWindow();
  }


}


void PushdrawWindow() {
  fill(255);
  stroke(0, 145, 255);
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

void ArmsdrawWindow() {
  fill(255);
  stroke(0, 145, 255);
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

void LegsdrawWindow() {
  fill(255);
  stroke(0, 145, 255);
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
