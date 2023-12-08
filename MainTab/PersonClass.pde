class Person {
  // Fields
  String name;
  float weight;
  int age;
  float benchPressMax;
  float squatMax;
  float deadliftMax;
  String email;
  // Constructor
  Person(String n, int a , float w, float b,float s, float d ,String e) {
    this.name = n;
    this.weight = w;
    this.age = a;
    this.benchPressMax = b;
    this.squatMax = s;
    this.deadliftMax = d;
    this.email = e;
  }
  // Methods
  void setBenchPressMax(float max) {
    this.benchPressMax = max;
  }

  void setSquatMax(float max) {
    this.squatMax = max;
  }

  void setDeadliftMax(float max) {
    this.deadliftMax = max;
  }
  // Method to calculate the one-rep max (1RM) using Lander's formula
  void calculateOneRepMax(int weight, int reps) {
    if (reps <= 0) {
      println("No answer: Couldn't complete even one repetition");
    } else if (reps == 1) {
      println("1RM: " + weight + " lb");
    } else {
      float calculated1RM = round((100 * weight) / (101.3 - (2.67123 * reps)));
      println("Predicted 1RM: " + calculated1RM + " lb" + " based on " + weight + "lb for " + reps + " reps");
    }
  }

  float getLiftMax(String exercise) { // Checks which lift is picked and then the set the max to that lift
    float max = 0;
    if (exercise.equals("benchPress")) {
      max = benchPressMax;
    } else if (exercise.equals("squat")) {
      max = squatMax;
    } else if (exercise.equals("deadlift")) {
      max = deadliftMax;
    } else if (exercise.equals("all")) {
      max = benchPressMax + squatMax + deadliftMax;
    }
    return max;
  }

  float getTotalMaxLifts() { // adds up all the maxes
    return benchPressMax + squatMax + deadliftMax;
  }

  void displayOverview() { // prints an Overview of the Person
    println("----------------------------------------");
    println("Name: " + name);
    println("Weight: " + weight + " lb");
    println("Age: " + age + " years");
    println("Bench Press Max: " + benchPressMax + " lb");
    println("Squat Max: " + squatMax + " lb");
    println("Deadlift Max: " + deadliftMax + " lb");
    println("Email: " + email);
  }
}
