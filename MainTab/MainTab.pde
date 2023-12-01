boolean profilePageADD, profilePageEDIT;
String[] stat = new String[7]; // name, age, weight, mbp, ms, md, email
String typing = "";
int i;
Person p1 = new Person("Oweis", 167, 17, "oweisthemoneky@gmail.com");
Person p2 = new Person("Baraa", 177, 17, "baraa@wrdsb.ca");
Leaderboard leaderboard; // Added leaderboard instance

void setup() {
  size(1000, 500);
  
  leaderboard = new Leaderboard(); // Initialize leaderboard
  leaderboard.addPerson(p1); // add people through GUI 
  for (int a = 0; a < stat.length; a++) {
    stat[a] = "";
  }

  profilePageADD = false;
}

void draw() {
  background(255);

  if (profilePageADD) {
    addProfile();
  } else {
    displayLeaderboard();
    
  }
}

void addProfile() {
  fill(0);
  textSize(30);
  stat[i] = typing;
  // name, age, weight, mbp, ms, md, email
  text("Name: " + stat[0], 50, 50);
  text("Age: " + stat[1], 50, 100);
  text("Weight: " + stat[2], 50, 150);
  text("Max Benchpress: " + stat[3], 50, 200);
  text("Max Squat: " + stat[4], 50, 250);
  text("Max Deadlift: " + stat[5], 50, 300);
  text("Email: " + stat[6], 50, 350);
}

void displayLeaderboard() {
  leaderboard.displayLeaderboard("Leaderboard (Total Max Lifts):", "totalMaxLifts");
 }

void keyPressed() {
  if (key == BACKSPACE) {
    int L = typing.length();
    if (L > 0)
      typing = typing.substring(0, L - 1);
  } else if (key == ENTER) {
    if (i != stat.length) {
      i += 1;
      typing = "";
    } else {
      print("YAYYYY now i can commit identity theft...");
    }
  } else
    typing = typing + key;
}
