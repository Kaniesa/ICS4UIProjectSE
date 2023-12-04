class Leaderboard {
  ArrayList<Person> persons;

  Leaderboard() {
    persons = new ArrayList<Person>();
  }

  void addPerson(Person person) {
    persons.add(person);
  }

  //void displayTotalMaxLiftsLeaderboard() {
  //  bubbleSortTotalMaxLifts(persons);
  //  displayLeaderboard("Leaderboard (Total Max Lifts):", "totalMaxLifts");
  //}

  //void displayLiftMaxLeaderboard(String chosenLift) {
  //  bubbleSortLiftMax(persons, chosenLift);
  //  displayLeaderboard("Leaderboard (Based on " + chosenLift + " Max Lift):", chosenLift);
  //}

 void displayLeaderboard(String title, String extractMethod) {
    textAlign(LEFT);
    textSize(20);
    fill(0);
    // Display the title
    text(title, 50, 30);

    // Display the leaderboard on the canvas
    for (int i = 0; i < persons.size(); i++) {
      Person person = persons.get(i);
      float value = extractMethod.equals("totalMaxLifts") ? person.getTotalMaxLifts() : person.getLiftMax(extractMethod);
      fill(255,0,0);
      text((i + 1) + ". " + person.name + " - " + value + " lb", 50, 70 + i * 30);
    }
  }


}
