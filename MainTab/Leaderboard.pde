class Leaderboard {
  ArrayList<Person> persons;

  Leaderboard() {
    persons = new ArrayList<Person>();
  }

  void addPerson(Person person) {
    persons.add(person);
  }

  void displayLeaderboard() {
    bubbleSortTotalMaxLifts(persons);

    // Display the leaderboard
    println("********************************");
    println("Leaderboard (Total Max Lifts):");
    for (int i = 0; i < persons.size(); i++) {
      Person person = persons.get(i);
      println((i + 1) + ". " + person.name + " - Total Max: " + person.getTotalMaxLifts() + " lb");
    }
    println("********************************");
    println();
  }

  void changeRankingCriteria( String chosenLift) {
    bubbleSortLiftMax(persons, chosenLift);

    // Display the leaderboard based on the chosen lift
    println("********************************");
    println("Leaderboard (Based on " + chosenLift + " Max Lift):");
    for (int i = 0; i < persons.size(); i++) {
      Person person = persons.get(i);
      println((i + 1) + ". " + person.name + " - " + chosenLift + " Max: " + person.getLiftMax(chosenLift) + " lb");
    }
    println("********************************");
    println();
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
  void bubbleSortLiftMax(ArrayList<Person> persons, String chosenLift) {
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
