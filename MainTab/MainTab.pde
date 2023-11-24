boolean profilePage;
Person p1 = new Person("Oweis", 167, 17, "oweisthemoneky@gmail.com");
Person p2 = new Person("Baraa", 177, 17, "baraa@wrdsb.ca");

void setup() {
  
  size(1000, 500);

  // Person 1 setup
  p1.setBenchPressMax(220);
  p1.setSquatMax(315);
  p1.setDeadliftMax(320);
  p1.displayOverview(); // Display the profile

  // Person 2 setup
  p2.setBenchPressMax(235);
  p2.setSquatMax(295);
  p2.setDeadliftMax(315);
  p2.displayOverview(); // (You can display the profile if needed)

// Person 3 setup
  Person p3 = new Person("Wajih", 220, 18, "wajih@gmail.ca");
  p3.setBenchPressMax(230);
  p3.setSquatMax(405);
  p3.setDeadliftMax(425);
  p3.displayOverview(); // Display the profile

  // Person 4 setup
  Person p4 = new Person("abooda", 300, 17, "saada@wrdsb.ca");
  p4.setBenchPressMax(255);
  p4.setSquatMax(355);
  p4.setDeadliftMax(365);
  p4.displayOverview(); // Display the profile

  // Person 5 setup
  Person p5 = new Person("Yaman", 165, 17, "albey@wrdsb.ca");
  p5.setBenchPressMax(220);
  p5.setSquatMax(275);
  p5.setDeadliftMax(335);
  p5.displayOverview(); // Display the profile

  // Person 6 setup
  Person p6 = new Person("Eren", 191, 17, "sezen@gmail.ca");
  p6.setBenchPressMax(165);
  p6.setSquatMax(200);
  p6.setDeadliftMax(250);
  p6.displayOverview(); // Display the profile

// Person 7 setup
  Person p7 = new Person("Mr. Schattman", 180, 35, "jason_schattman@wrdsb.ca");
  p7.setBenchPressMax(700);
  p7.setSquatMax(900);
  p7.setDeadliftMax(1320);
  p7.displayOverview(); // Display the profile

  // Calculating One Rep Max for Person 1
  p1.calculateOneRepMax(200, 3);

}

void draw(){
 if ( profilePage == true ){
   showProfile( p1 );
 }
}

void showProfile( Person person ){
  //text(
}
