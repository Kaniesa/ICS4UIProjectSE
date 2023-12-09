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
  
  //Reset profiles from previous runs of program
  String[] resetProfiles = loadStrings("list_330604");
  for ( int r = 0; r < resetProfiles.length; r ++ ) {
    resetProfiles[r] = "";
  }
  resetProfiles[0] = "--";
  saveStrings("data/list_330604", resetProfiles);
  
  //Reset every stat value
  for ( int a = 0; a < stat.length; a ++ ) {
    stat[a] = "";
  }
  
  //Create GUI and main window screen with logo
  createGUI();
  size(1000, 500);
  img = loadImage("logo.png"); //loads the image onto the sketch
}

void draw() {
  
  //Draws the welcome text and Giant Powerlift Pro Logo
  welcome();
  image(img, 250, 20);
  
  // If adding a person, set up background, logo, and open profile
  if ( profilePageADD == true ) {
    background(255);
    openProfile(); // calls function for making or editing a profile
    image(img, 860, 20, width/8, height/4);
  } 
  
  // If editing a profile, set up background, logo, and open profile as needed
  else if ( profilePageEDIT == true ) {
    
    // Ignores case of user selecting placeholder null option
      // null option to allow user to select profile tp edit even if only one profile in total
    if ( selectedProfile.equals("--") ) {
      profilePageEDIT = false;
      background(255);
    } 
    
    // Otherwise, load the profile data and call function for making or editing profile
    else {
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
  } 
  
  else if (schedulePage == true) { //if the schedule page was clicked in the GUI...
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
  } 
  
  else if ( LeaderboardPage == true) {
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

// Function for making or editing a profile
void openProfile() {
  fill(red, green, blue); // fill in text with GUI slider colour
  textSize(30);
  // save what the user types to the current stat
  stat[i] = typing;
  // if user just selected a person to edit, reset the current typing saved
  if ( resetNameStat == true) {
    if ( profilePageEDIT == true ) {
      typing = selectedProfile;
    } else {
      typing = "";
    }
    resetNameStat = false; // then carry on with regular editing
  }
  
  // Draw stats and what the user has entered so far
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


// Function for every time the user types something (used in Profile making/editing)
void keyPressed() {
  
  //Delete last character entered when backspace pressed
  if ( key == BACKSPACE ) {
    int L = typing.length();
    if ( L > 0 )
      typing = typing.substring(0, L-1);
  }
  
  //Go to next entry when enter clicked
  else if ( key == ENTER ) {
    
    // if pressed enter for first stat (name) after clicking create profile button
    if ( i == 0 && profilePageEDIT == false ) {
      // names file after the name of person in profile
      pw = createWriter("data/" + stat[0] + ".txt");
      i += 1;
      typing = "";
    } 
    
    // if pressed enter in between first and last entry (exclusive)
    else if ( i != stat.length -1 ) {
      // move onto next stat, and reset stored typed info
      i += 1;
      typing = "";
    } 
    
    // otherwise, pressed enter after last entry and IF in editing mode
    else if ( profilePageEDIT == true ) {
      // save the data on file and reset variables
      saveStrings("data/" + selectedProfile, stat);
      i = 0;
      profilePageEDIT = false;
      //replace old file information with new file information
      replaceOldFile(selectedProfile);
      stat[0] = "";
      background(255);
    } 
    
    // last enter case: pressed enter after last entry (and not caught in editing mode case above)
    else {
      // Add person's name to list of names from every profile
      personNames = append(personNames, stat[0]);
      
      // Save the information to person class (for leaderboard)
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
      
      // reset variables
      i = 0;
      pw.close();
      saveStrings("data/list_330604", personNames); // add person names to dropdown file (so users can now edit this added person)
      profilePageADD = false;
      EditPerson.setItems(loadStrings("list_330604"), 0); // update the GUI to include new dropdown option
      stat[0] = "";
      background(255);
    }
  } 
  // Make shift button work as capatilizer (not unrecognized letter)
  else if ( key == CODED ) {
    if ( key == SHIFT ) {
    }
  } 
  
  // else, pressed a regular key: save it to user typed info
  else
    typing = typing + key;
}

// Function to replace old file data with new file data
void replaceOldFile(String fileName) {
  pw = createWriter("data/" + fileName + ".txt");
  for ( int b = 0; b < stat.length; b ++ ) {
    pw.println(stat[b]);
    stat[b] = "";
  }
  pw.close();
}
