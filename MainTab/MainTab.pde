import g4p_controls.*;
boolean profilePageADD, profilePageEDIT, schedulePage;
String[] stat = new String[7]; // name, age, weight, mbp, ms, md, email
String typing = "";
int i, personCount;
PrintWriter pw;
Leaderboard leaderboard; // Added leaderboard instance
Person p1 = new Person("Oweis", 167, 17, "oweisthemoneky@gmail.com");
Person p2 = new Person("Baraa", 177, 17, "baraa@wrdsb.ca");
//Leaderboard leaderboard; // Added leaderboard instance


//BUGS TO FIX//
// -> make shift button work
// -> make sure last value doesn't carry over to next one
// -> remove tab from first entry of first person

// CODE TO DO //
// -> Edit feature
//    - get files from dropdown
//    - display files data on screen (so looks same as finished Add Person)
//    - start from beginning (and users will backspace edit from here)

void setup() {

  createGUI();
  size(1000, 500);
  for ( int a = 0; a < stat.length; a ++ ){
    stat[a] = "";
  }
}

void draw() {
  if ( profilePageADD == true ) {
    background(255);
    addProfile();
  } else if (schedulePage == true) {
    background(255);
    drawSchedule();
    dateAndTime();
    drawScheduleText();
    drawWO();

    if (showPushWindow) {
      PushdrawWindow();
    } else if (showArmsWindow) {
      ArmsdrawWindow();
    } else if (showLegsWindow) {
      LegsdrawWindow();
    }

  }
}

void addProfile(){
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
  if ( key == TAB ){
    println("HULLO");
    profilePageADD = true;
  }
  if( key == BACKSPACE ) {
    int L = typing.length();
    if ( L > 0 )
      typing = typing.substring(0, L-1);
  } 
  else if ( key == ENTER ) {
    if ( i != stat.length -1 ) {
      i += 1;
      typing = "";
    } 
    else {
      print("YAYYYY now i can commit identity theft...") ;
      personCount ++;
      for ( int b = 0; b < stat.length; b ++ ) {
        pw.println(stat[b]);
        stat[b] = "";
        i = 0;
      }
      pw.close();
      profilePageADD = false;
    }
  } 
  else if ( key == CODED ) {
    if ( key == SHIFT ) {
      print("You are typing in Shift");
    }
  } 
  else
    typing = typing + key;
}
