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
  text("Schedule", 370, 75);
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


void mousePressed() {
  if (pause == true) {
  loop();
  }
  else if (pause != true) {
    noLoop();
  }
  
  
  if (mouseX>150 && mouseX<250 && mouseY>200 && mouseY<450 ||mouseX>450 && mouseX<550 && mouseY>200 && mouseY<450  ) {//Push Click Position Ranges
    println("push");
    stroke(0);
    pause = false;
    PushdrawWindow();
  }
  else if (mouseX>250 && mouseX<350 && mouseY>200 && mouseY<450 ||mouseX>550 && mouseX<650 && mouseY>200 && mouseY<450  ) {//Push Click Position Ranges
    println("pull");
    stroke(0);
  }
  else if (mouseX>350 && mouseX<450 && mouseY>200 && mouseY<450 ||mouseX>650 && mouseX<750 && mouseY>200 && mouseY<450  ) {//Push Click Position Ranges
    println("legs");
    stroke(0);
    }  
  }

void PushdrawWindow() {
  fill(255);
  stroke(0, 145, 255);
  rect(350, 75, 300, 375);
  // Text
  fill(0);
  textSize(35);
  text("Exersizes", 433, 120);

  //Push Draw
  textSize(20);
  text("Bench Press: 3x6-8", 420, 190);
  text("Shoulder Press: 3x8-10", 408, 220);
  text("Incline Dumbbell Flyes: 3x10-15", 370, 250);
  text("Triceps Pushdowns: 3x10-15", 382, 280);
  text("Abs: 10 Mins of Misc. ab work", 380, 310);
}
