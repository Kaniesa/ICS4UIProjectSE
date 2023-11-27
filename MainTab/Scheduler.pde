class Scheduler {
  // constructor and Fields are not needed here

  // Workout schedule
  void generateWorkoutSchedule(Person person) {
    println("********************************");
    println("Weekly Workout Schedule:\n");

    int numDays = 7; // A weekly schedule ( Can be changed to monthly based on preference)

    for (int day = 1; day <= numDays; day++) {
      print("Day " + day + ": ");
      // simple overview Push means pushing type of excercises mainly targeting (chest, shoulders, and triceps) while Pull is the opposite pulling excercises mainly targeting(Back, arms)
      if (day == 1) {
        // Day 1: Push
        print("Push Day (e.g., Bench Press), ");
      } else if (day == 2) {
        // Day 2: Pull
        print("Pull Day (e.g., Deadlift), ");
      } else if (day == 3) {
        // Day 3: Legs
        print("Legs Day (e.g., Squat), ");
      } else if (day == 4) {
        // Day 4: Rest
        print("Rest, ");
      } else if (day == 5) {
        // Day 5: Determine the exercise based on goal and max
        if (bodyPreference.equals("Upper Body")) {
          if (benchPressProgress < squatProgress && benchPressProgress < deadliftProgress) {
            print("Bench Press, ");
          } else if (squatProgress < deadliftProgress) {
            print("Squat, ");
          } else {
            print("Deadlift, ");
          }
        } else {
          if (squatProgress < benchPressProgress && squatProgress < deadliftProgress) {
            print("Squat, ");
          } else if (deadliftProgress < benchPressProgress) {
            print("Deadlift, ");
          } else {
            print("Bench Press, ");
          }
        }
      } else if (day == 6) {
        // Day 6: Determine based on preference
        if (bodyPreference.equals("Upper Body")) {
          print("Pull Day (e.g., Deadlift), ");
        } else {
          print("Cardio, ");
        }
      } else {
        // Day 7: Rest
        print("Rest, ");
      }

      println();
    }
    println("********************************");
    println();
  }

  // Send email method
  //void sendEmail(String recipientEmail, String emailContent) {
    // Send email through JavaMail ( I am looking into this as it looks pretty complicated)
  //}
}
