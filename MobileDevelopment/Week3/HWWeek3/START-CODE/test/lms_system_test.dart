import 'package:test/test.dart';

import '../lib/service/lms_system.dart';

void main() {
  test('creates a student', () {
    final lms = LmsSystem();

    // Create a student
    lms.addStudent(studentId: 'S1', studentName: "ronan");

    expect(lms.students.first.name, 'ronan');

    // Remove the student
    lms.removeStudent(studentId: 'S1');
    expect(lms.students.length, 0);

    lms.addCourse(courseId: "C1", courseName: "MobileDev");
    expect(lms.courses.first.name, "MobileDev");

    lms.addStudent(
    studentId: 'S01',
    studentName: 'Omra',
  );

  lms.addCourse(
    courseId: 'C01',
    courseName: 'Dart',
  );

  // Enroll student
  lms.enrollStudent(
    studentId: 'S01',
    courseId: 'C01',
  );

  // Verify enrollment
  final student = lms.students.firstWhere(
    (s) => s.id == 'S01',
  );

  print(student.courseIds); // [C01]

  // Student does not exist
lms.enrollStudent(
  studentId: 'S99',
  courseId: 'C01',
);

// Course does not exist
lms.enrollStudent(
  studentId: 'S01',
  courseId: 'C99',
);

// Duplicate enrollment
lms.enrollStudent(
  studentId: 'S01',
  courseId: 'C01',
);
});
}
