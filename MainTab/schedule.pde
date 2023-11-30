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
  textSize(45);
  textSize(35);
  text("mon", 155, 185);
  text("tues", 260, 185);
  text("wed", 365, 185);
  text("thurs", 475, 185);
  text("fri", 605, 185);
  text("sat", 695, 185);
  text("sun", 795, 185);


}

void drawSchedule() {
  fill(255);
  rect(150, 150, 700, 300);
  line(150, 200, 850, 200);
}
