import g4p_controls.*;
boolean profilePageADD, profilePageEDIT, schedulePage, LeaderboardPage, benchpressPage, squatPage, deadliftPage;
String[] stat = new String[7]; //name, age, weight, mbp, ms, md, email, extra
String typing = "";
int i, personCount;
PrintWriter pw;
String[] personNames = new String[0];
String selectedProfile;
float red = 165;
float green = 5;
float blue = 5;
PImage img;
Leaderboard globalleaderboard;

void setup() {

  createGUI();
  size(1000, 500);
  for ( int a = 0; a < stat.length; a ++ ) {
    stat[a] = "";
  }
  img = loadImage("logo.png");
}

void draw() {

  welcome();
  image(img, 250, 20);
  
  if ( profilePageADD == true ) {
    background(255);
    openProfile();
    image(img, 860, 20, width/8, height/4);
  } 
  else if ( profilePageEDIT == true ){
    if ( i == 0 ){
      String[] allData = loadStrings( "data/" + selectedProfile + ".txt" );
      for ( int j = 0; j < allData.length; j++ ){
        stat[j] = allData[j];
      }
    }
    background(255);
    openProfile();
    image(img, 860, 20, width/8, height/4);
  }
  
  else if (schedulePage == true) {
    background(255);
    stroke(red, green, blue);
    drawSchedule();
    dateAndTime();
    drawScheduleText();
    drawWO();
    image(img, 860, 20, width/8, height/4);


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
    if (leaderboardmethod == "total") { // the person selects the drop down in GUI (bench)
      background(255);
      globalleaderboard.SpecificExcerDraw("all");
    } 
    else if (leaderboardmethod == "benchpress") { // the person selects the drop down in GUI (bench)
      background(255);
      globalleaderboard.SpecificExcerDraw("benchPress"); 
   }
   else if ( leaderboardmethod == "squat" ){
     background (255);
     globalleaderboard.SpecificExcerDraw("squat"); 
   }
    else if ( leaderboardmethod == "deadlift" ) {
      background (255);
      globalleaderboard.SpecificExcerDraw("deadlift"); 
    }
  }
}


void openProfile() {
  fill(red, green, blue);
  textSize(30);
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
    if ( i == 0 && profilePageEDIT == false ){
      pw = createWriter("data/" + stat[0] + ".txt"); 
      i += 1;
      typing = "";
    }
    else if ( i != stat.length -1 ) {
      i += 1;
      typing = "";
    } 
    else if ( profilePageEDIT == true ){
      saveStrings("data/" + selectedProfile, stat);
      i = 0;
      profilePageEDIT = false;
      replaceOldFile(selectedProfile);
    }
    else {
      print("YAYYYY now i can commit identity theft...") ;
      personNames = append(personNames, stat[0]);
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
    }
  } 
  else if ( key == CODED ) {
    if ( key == SHIFT ) {
    }
  } 
  else
    typing = typing + key;
}

void replaceOldFile(String fileName){
  pw = createWriter("data/" + fileName + ".txt"); 
  for ( int b = 0; b < stat.length; b ++ ) {
    pw.println(stat[b]);
    stat[b] = "";
  }
  pw.close();
}
