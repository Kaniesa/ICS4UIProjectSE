int month = month();
int day = day();
int year = year();
String d = String.valueOf(day);
String m = String.valueOf(month);
String y = String.valueOf(year);

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
