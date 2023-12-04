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

  // Bubble sort to order persons by their total max lifts in descending order 
  void bubbleSortTotalMaxLifts(ArrayList<Person> persons) {
    int n = persons.size();   // Get the number of persons
    boolean swapped;          // track if any swaps were made
    do {
      swapped = false;        // Reset the swapped flag
      for (int i = 1; i < n; i++) {
        Person a = persons.get(i - 1);  // Get the person at the current position
        Person b = persons.get(i);      // Get the next person
        // Compare the total max lifts of two adjacent persons
        if (a.getTotalMaxLifts() < b.getTotalMaxLifts()) {
          persons.set(i - 1, b);  // Swap person a and person b in the list
          persons.set(i, a);
          swapped = true;     
        }
      }
      n--;  // Decrease n as the largest element is now at the end
    } while (swapped);  // Continue sorting until no more swaps are made
  }
  
  // Bubble sort to order persons by their max lift in the chosen exercise in descending order
  void bubbleSortLiftMax(ArrayList<Person> persons,  String chosenLift) {
    int n = persons.size();   // Get the number of persons
    boolean swapped;          // track if any swaps were made
    do {
      swapped = false;        // Reset the swapped flag
      for (int i = 1; i < n; i++) {
        Person a = persons.get(i - 1);  // Get the person at the current position
        Person b = persons.get(i);      // Get the next person
        // Compare the max lift in the chosen exercise of two adjacent persons
        if (a.getLiftMax(chosenLift) < b.getLiftMax(chosenLift)) {
          persons.set(i - 1, b);  // Swap person a and person b in the list
          persons.set(i, a);
          swapped = true;
        }
      }
      n--;  // Decrease n as the largest element is now at the end
    } while (swapped);  // Continue sorting until no more swaps are made
  }
}
