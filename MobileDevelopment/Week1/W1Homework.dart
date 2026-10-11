List<String> getPassedStudent(Map<String, int> scores) => scores.entries
    .where((entry) => entry.value >= 50)
    .map((scores) => scores.key)
    .toList();

double computeAverage(List<int> scores) {
  if (scores.isEmpty) return 0;
  return scores.reduce((a, b) => a + b) / scores.length;
}

void main() {
  Map<String, int> result = {
    "Dara": 78,
    "Sokha": 45,
    "Lina": 62,
    "Vanna": 39,
    "Mony": 85,
  };
  print(getPassedStudent(result));

  List<Map<String, Object>> students = [
    {"name": "Dara", "Dart": 70, "Flutter": 80, "Database": 60},
    {"name": "Sokha", "Dart": 50, "Flutter": 90, "Database": 70},
    {"name": "Lina", "Dart": 80, "Flutter": 70, "Database": 90},
  ];
  List<String> courses = ["Dart", "Flutter", "Database"];
  for (String course in courses) {
    List<int> courseScore = [];

    for (var student in students) {
      if (student.containsKey(course)) {
        courseScore.add(student[course] as int);
      }
    }
    double average = computeAverage(courseScore);
    print('$course Average: ${average.toStringAsFixed(1)}');
    print(courseScore);
  }
}
