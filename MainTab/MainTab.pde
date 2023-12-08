//BUGS TO FIX//
// -> make sure last value doesn't carry over to next one

// CODE TO DO //
// -> Edit feature
//    - get files from dropdown
//    - display files data on screen (so looks same as finished Add Person)
//    - start from beginning (and users will backspace edit from here)

import g4p_controls.*;
boolean profilePageADD, profilePageEDIT, schedulePage;
String[] stat = new String[7]; //name, age, weight, mbp, ms, md, email, extra
String typing = "";
int i, personCount;
PrintWriter pw;
String[] personNames = new String[0];
String editProfile;

void setup() {

  createGUI();
  size(1000, 500);
  for ( int a = 0; a < stat.length; a ++ ) {
    stat[a] = "";
  }
}

void draw() {
  if ( profilePageADD == true ) {
    background(255);
    addProfile();
  } else if (schedulePage == true) {
    background(255);
    stroke(0);
    drawSchedule();
    dateAndTime();
    drawScheduleText();
    drawWO();

    if (showPushWindow && ppl) {
      PushdrawWindow();
    } else if (showArmsWindow && ppl) {
      ArmsdrawWindow();
    } else if (showLegsWindow && ppl) {
      LegsdrawWindow();
    } else if (showPushWindow && arnold) {
      APushdrawWindow();
    } else if (showArmsWindow && arnold) {
      AArmsdrawWindow();
    } else if (showLegsWindow && arnold) {
      ALegsdrawWindow();
    } else if (showPushWindow && threeday) {
      PushdrawWindow();
    } else if (showArmsWindow && threeday) {
      ArmsdrawWindow();
    } else if (showLegsWindow && threeday) {
      LegsdrawWindow();
    }
  }
}

void addProfile() {
  fill(0);
  textSize(30);
  pw = createWriter("data/NewPerson" + personCount + " .txt");
  stat[i] = typing;
  text("Name: " + stat[0], 50, 50 );
  text("Age: " + stat[1], 50, 100 );
  text("Weight: " + stat[2], 50, 150 );
  text("Max Benchpress: " + stat[3], 50, 200 );
  text("Max Squat: " + stat[4], 50, 250 );
  text("Max Deadlift: " + stat[5], 50, 300 );
  text("Email: " + stat[6], 50, 350 );
  text("Click Enter to Move to Next Entry!", 50, 450);
}



void keyPressed() {
  //Profile: Delete last character entered when backspace pressed
  if ( key == BACKSPACE ) {
    int L = typing.length();
    if ( L > 0 )
      typing = typing.substring(0, L-1);
  }
  //Profile: Go to next entry when enter clicked
  else if ( key == ENTER ) {
    if ( i != stat.length -1 ) {
      i += 1;
      typing = "";
    } else {
      print("YAYYYY now i can commit identity theft...") ;
      personNames = append(personNames, "hi");
      personNames[personCount] = stat[0];
      personCount ++;
      for ( int b = 0; b < stat.length; b ++ ) {
        pw.println(stat[b]);
        stat[b] = "";
        i = 0;
      }
      pw.close();
      saveStrings("data/list_330604", personNames);
      profilePageADD = false;
      EditPerson.setItems(loadStrings("list_330604"), 0);
    }
  } else if ( key == CODED ) {
    if ( key == SHIFT ) {
      print("You are typing in Shift");
    }
  } else
    typing = typing + key;
}
