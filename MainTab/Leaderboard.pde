class Leaderboard {
  ArrayList<Person> persons;

  Leaderboard() {
    persons = new ArrayList<Person>();
  }

  void addPerson(Person person) {
    persons.add(person);
  }
  void SpecificExcerDraw(String a) {
      bubbleSortLiftMax(persons, a);

  // Display the leaderboard
  textSize(20);
  textAlign(LEFT);
  fill(0);  // Set the text color to black

  float x = 50;  // X-coordinate for the leaderboard entries
  float y = 50;  // Initial Y-coordinate for the first entry
  float spacing = 30;  // Adjust this variable for spacing between entries

  text("********************************", x, y);
  y += spacing;  // Move down for the next line

  text("Leaderboard (Lift Selected):", x, y);
  y += spacing;  // Move down for the next line

  for (int i = 0; i < persons.size(); i++) {
    Person person = persons.get(i);
    String leaderboardEntry = (i + 1) + ". " + person.name + " - Selected Lift: " + person.getLiftMax(a) + " lb";
    text(leaderboardEntry, x, y);
    y += spacing;  // Move down for the next entry
  }

  text("********************************", x, y);
  y += spacing;  // Move down for the next line
  println();  // Add extra space at the end
}
  //public Person getPerson(String email) {
  //  // Loop through existing persons in the leaderboard
  //  for (Person existingPerson : persons) {
  //    if (existingPerson.getEmail().equals(email)) {
  //      return existingPerson;
  //    }
  //  }

    // Return null if the person with the specified email is not found
  //  return null;
  //}

void drawLeaderboard() {
  bubbleSortTotalMaxLifts(persons);

  // Display the leaderboard
  textSize(20);
  textAlign(LEFT);
  fill(0);  // Set the text color to black

  float x = 50;  // X-coordinate for the leaderboard entries
  float y = 50;  // Initial Y-coordinate for the first entry
  float spacing = 30;  // Adjust this variable for spacing between entries

  text("********************************", x, y);
  y += spacing;  // Move down for the next line

  text("Leaderboard (Total Max Lifts):", x, y);
  y += spacing;  // Move down for the next line

  for (int i = 0; i < persons.size(); i++) {
    Person person = persons.get(i);
    String leaderboardEntry = (i + 1) + ". " + person.name + " - Total Max: " + person.getTotalMaxLifts() + " lb";
    text(leaderboardEntry, x, y);
    y += spacing;  // Move down for the next entry
  }

  text("********************************", x, y);
  y += spacing;  // Move down for the next line
  println();  // Add extra space at the end
}

  // Bubble sort to order persons by their total max lifts in descending order 
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
