// POWERLIFT PRO
// Unlock your true fitness potential...
// By Bilal Albezreh, Kaniesa Deswal, Matthew Singer

import g4p_controls.*;

//Global Variables
boolean profilePageADD, profilePageEDIT, schedulePage, LeaderboardPage, benchpressPage, squatPage, deadliftPage, resetNameStat; //for switching between 'pages'
String[] stat = new String[7]; //name, age, weight, mbp, ms, md, email, extra
String typing = ""; // variable to track what user types
int i, personCount; // adding a person's profile variables
PrintWriter pw;  // for saving profile information to files
String[] personNames = {"--"};  //list of people
String selectedProfile;  //name of person selected to edit
float red = 165;//red color slider
float green = 5;//green color slider
float blue = 5;//blue color slider
PImage img; //POWERLIFT PRO IMAGE
Leaderboard globalleaderboard;

void setup() { //setup
  globalleaderboard = new Leaderboard();
  String[] resetProfiles = loadStrings("list_330604");
  for ( int r = 0; r < resetProfiles.length; r ++ ) {
    resetProfiles[r] = "";
  }
  resetProfiles[0] = "--";
  saveStrings("data/list_330604", resetProfiles);

  createGUI();
  size(1000, 500);
  for ( int a = 0; a < stat.length; a ++ ) {
    stat[a] = "";
  }
  img = loadImage("logo.png"); //loads the image onto the sketch
}

void draw() {
  //Draws the welcome text and Giant Powerlift Pro Logo
  welcome();
  image(img, 250, 20);

  if ( profilePageADD == true ) {
    background(255);
    openProfile();
    image(img, 860, 20, width/8, height/4);
  } else if ( profilePageEDIT == true ) {
    if ( selectedProfile.equals("--") ) {
      profilePageEDIT = false;
      background(255);
    } else {
      if ( i == 0 ) {
        String[] allData = loadStrings( "data/" + selectedProfile + ".txt" );
        for ( int j = 0; j < allData.length; j++ ) {
          stat[j] = allData[j];
        }
      }
      background(255);
      openProfile();
      image(img, 860, 20, width/8, height/4);
    }
  } else if (schedulePage == true) { //if the schedule page was clicked in the GUI...
    background(255);
    stroke(red, green, blue); //Theme
    drawSchedule(); //drawing the schedule, date, and schedule TEXT
    dateAndTime();
    drawScheduleText();
    wos(); //Drop down registration
    image(img, 860, 20, width/8, height/4); //Logo in the top right

     //Draws windows based on which splits are displayed and which windows are currenttly clicked open
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
  } else if ( LeaderboardPage == true) {
    if (leaderboardsortmethod == "total") { // the person selects the drop down in GUI (bench)
      background(255);
      image(img, 860, 20, width/8, height/4);
      globalleaderboard.SpecificExcerDraw("all");
    } else if (leaderboardsortmethod == "benchpress") { // the person selects the drop down in GUI (bench)
      background(255);
      image(img, 860, 20, width/8, height/4);
      globalleaderboard.SpecificExcerDraw("benchPress");
    } else if ( leaderboardsortmethod == "squat" ) {
      background (255);
      image(img, 860, 20, width/8, height/4);
      globalleaderboard.SpecificExcerDraw("squat");
    } else if ( leaderboardsortmethod == "deadlift" ) {
      background (255);
      image(img, 860, 20, width/8, height/4);
      globalleaderboard.SpecificExcerDraw("deadlift");
    }
  }
}


void openProfile() {
  fill(red, green, blue);
  textSize(30);
  stat[i] = typing;
  if ( resetNameStat == true) {
    if ( profilePageEDIT == true ) {
      typing = selectedProfile;
    } else {
      typing = "";
    }
    resetNameStat = false;
  }
  text("Name: " + stat[0], 50, 50 );
  text("Age: " + stat[1], 50, 100 );
  text("Weight: " + stat[2], 50, 150 );
  text("Max Benchpress: " + stat[3], 50, 200 );
  text("Max Squat: " + stat[4], 50, 250 );
  text("Max Deadlift: " + stat[5], 50, 300 );
  text("Email: " + stat[6], 50, 350 );
  text("Click Enter to Move to Next Entry!", 50, 450);
  textSize(15);
  text("Note: Click on Window first to start typing!", 550, 450);
  text("If you are editing a profile, you must check everything before exiting!", 50, 480);
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
    if ( i == 0 && profilePageEDIT == false ) {
      pw = createWriter("data/" + stat[0] + ".txt");
      i += 1;
      typing = "";
    } else if ( i != stat.length -1 ) {
      i += 1;
      typing = "";
    } else if ( profilePageEDIT == true ) {
      saveStrings("data/" + selectedProfile, stat);
      i = 0;
      profilePageEDIT = false;
      replaceOldFile(selectedProfile);
      stat[0] = "";
      background(255);
    } else {
      print("YAYYYY now i can commit identity theft...") ;
      personNames = append(personNames, stat[0]);
      Person newPerson = new Person(
        stat[0], // Name
        Integer.parseInt(stat[1]), // Age
        Float.parseFloat(stat[2]), // Weight
        Float.parseFloat(stat[3]), // Max Benchpress
        Float.parseFloat(stat[4]), // Max Squat
        Float.parseFloat(stat[5]), // Max Deadlift
        stat[6]                       // Email
        );

      // Add the person to the leaderboard
      globalleaderboard.addPerson(newPerson);
      println("Person added to the leaderboard successfully.");
      personCount ++;
      for ( int b = 0; b < stat.length; b ++ ) {
        pw.println(stat[b]);
        stat[b] = "";
      }
      i = 0;
      pw.close();
      saveStrings("data/list_330604", personNames);
      profilePageADD = false;
      EditPerson.setItems(loadStrings("list_330604"), 0);
      stat[0] = "";
      background(255);
    }
  } else if ( key == CODED ) {
    if ( key == SHIFT ) {
    }
  } else
    typing = typing + key;
}

void replaceOldFile(String fileName) {
  pw = createWriter("data/" + fileName + ".txt");
  for ( int b = 0; b < stat.length; b ++ ) {
    pw.println(stat[b]);
    stat[b] = "";
  }
  pw.close();
}
