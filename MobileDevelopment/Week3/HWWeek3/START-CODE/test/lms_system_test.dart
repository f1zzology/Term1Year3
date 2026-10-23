import 'package:test/test.dart';

import '../lib/service/lms_system.dart';

void main() {
  test('add a student', () {
    final lms = LmsSystem();

    lms.addStudent(studentId: 'S1', studentName: 'ronan');

    expect(lms.students.length, 1);
    expect(lms.students.first.id, 'S1');
    expect(lms.students.first.name, 'ronan');
  });

  test('add student with duplicate id', () {
    final lms = LmsSystem();
    lms.addStudent(studentId: 'S1', studentName: 'ronan');

    expect(
      () => lms.addStudent(studentId: 'S1', studentName: 'other'),
      throwsException,
    );
    expect(lms.students.length, 1);
  });

  test('remove a student', () {
    final lms = LmsSystem();
    lms.addStudent(studentId: 'S1', studentName: 'ronan');

    lms.removeStudent(studentId: 'S1');

    expect(lms.students.length, 0);
  });

  test('remove student that does not exist', () {
    final lms = LmsSystem();

    expect(
      () => lms.removeStudent(studentId: 'S99'),
      throwsException,
    );
  });

  test('add a course', () {
    final lms = LmsSystem();

    lms.addCourse(courseId: 'C1', courseName: 'MobileDev');

    expect(lms.courses.length, 1);
    expect(lms.courses.first.name, 'MobileDev');
  });

  test('add course with duplicate id', () {
    final lms = LmsSystem();
    lms.addCourse(courseId: 'C1', courseName: 'MobileDev');

    expect(
      () => lms.addCourse(courseId: 'C1', courseName: 'Dart'),
      throwsException,
    );
    expect(lms.courses.length, 1);
  });

  test('remove a course', () {
    final lms = LmsSystem();
    lms.addCourse(courseId: 'C1', courseName: 'MobileDev');

    lms.removeCourse(courseId: 'C1', courseName: 'MobileDev');

    expect(lms.courses.length, 0);
  });

  test('enroll a student in a course', () {
    final lms = LmsSystem();
    lms.addStudent(studentId: 'S01', studentName: 'Omra');
    lms.addCourse(courseId: 'C01', courseName: 'Dart');

    lms.enrollStudent(studentId: 'S01', courseId: 'C01');

    final student = lms.students.firstWhere((s) => s.id == 'S01');
    expect(student.courseIds, contains('C01'));
  });

  test('enroll student that does not exist', () {
    final lms = LmsSystem();
    lms.addCourse(courseId: 'C01', courseName: 'Dart');

    expect(
      () => lms.enrollStudent(studentId: 'S99', courseId: 'C01'),
      throwsException,
    );
  });

  test('enroll in course that does not exist', () {
    final lms = LmsSystem();
    lms.addStudent(studentId: 'S01', studentName: 'Omra');

    expect(
      () => lms.enrollStudent(studentId: 'S01', courseId: 'C99'),
      throwsException,
    );
  });

  test('enroll the same course twice', () {
    final lms = LmsSystem();
    lms.addStudent(studentId: 'S01', studentName: 'Omra');
    lms.addCourse(courseId: 'C01', courseName: 'Dart');
    lms.enrollStudent(studentId: 'S01', courseId: 'C01');

    expect(
      () => lms.enrollStudent(studentId: 'S01', courseId: 'C01'),
      throwsException,
    );

    final student = lms.students.firstWhere((s) => s.id == 'S01');
    expect(student.courseIds.length, 1);
  });

  test('discard a student from a course', () {
    final lms = LmsSystem();
    lms.addStudent(studentId: 'S01', studentName: 'Omra');
    lms.addCourse(courseId: 'C01', courseName: 'Dart');
    lms.enrollStudent(studentId: 'S01', courseId: 'C01');

    lms.discardStudentFromCourse(studentId: 'S01', courseId: 'C01');

    final student = lms.students.firstWhere((s) => s.id == 'S01');
    expect(student.courseIds.length, 0);
  });

  test('discard a course the student is not enrolled in', () {
    final lms = LmsSystem();
    lms.addStudent(studentId: 'S01', studentName: 'Omra');
    lms.addCourse(courseId: 'C01', courseName: 'Dart');

    expect(
      () => lms.discardStudentFromCourse(studentId: 'S01', courseId: 'C01'),
      throwsException,
    );
  });

  test('add a result', () {
    final lms = LmsSystem();
    lms.addStudent(studentId: 'S01', studentName: 'Omra');
    lms.addCourse(courseId: 'C01', courseName: 'Dart');
    lms.enrollStudent(studentId: 'S01', courseId: 'C01');

    lms.addResult(studentId: 'S01', courseId: 'C01', score: 85);

    expect(lms.results.length, 1);
    expect(lms.results.first.studentId, 'S01');
    expect(lms.results.first.courseId, 'C01');
    expect(lms.results.first.score, 85);
  });

  test('add result with score out of range', () {
    final lms = LmsSystem();
    lms.addStudent(studentId: 'S01', studentName: 'Omra');
    lms.addCourse(courseId: 'C01', courseName: 'Dart');
    lms.enrollStudent(studentId: 'S01', courseId: 'C01');

    expect(
      () => lms.addResult(studentId: 'S01', courseId: 'C01', score: -1),
      throwsException,
    );
    expect(
      () => lms.addResult(studentId: 'S01', courseId: 'C01', score: 101),
      throwsException,
    );
    expect(lms.results.length, 0);
  });

  test('add result for a course the student is not enrolled in', () {
    final lms = LmsSystem();
    lms.addStudent(studentId: 'S01', studentName: 'Omra');
    lms.addCourse(courseId: 'C01', courseName: 'Dart');
    lms.addCourse(courseId: 'C02', courseName: 'Flutter');
    lms.enrollStudent(studentId: 'S01', courseId: 'C01');

    expect(
      () => lms.addResult(studentId: 'S01', courseId: 'C02', score: 90),
      throwsException,
    );
  });

  test('add the same result twice', () {
    final lms = LmsSystem();
    lms.addStudent(studentId: 'S01', studentName: 'Omra');
    lms.addCourse(courseId: 'C01', courseName: 'Dart');
    lms.enrollStudent(studentId: 'S01', courseId: 'C01');
    lms.addResult(studentId: 'S01', courseId: 'C01', score: 85);

    expect(
      () => lms.addResult(studentId: 'S01', courseId: 'C01', score: 90),
      throwsException,
    );
    expect(lms.results.length, 1);
  });

  test('remove a result', () {
    final lms = LmsSystem();
    lms.addStudent(studentId: 'S01', studentName: 'Omra');
    lms.addCourse(courseId: 'C01', courseName: 'Dart');
    lms.enrollStudent(studentId: 'S01', courseId: 'C01');
    lms.addResult(studentId: 'S01', courseId: 'C01', score: 85);

    lms.removeResult(studentId: 'S01', courseId: 'C01');

    expect(lms.results.length, 0);
  });

  test('remove a result that does not exist', () {
    final lms = LmsSystem();
    lms.addStudent(studentId: 'S01', studentName: 'Omra');
    lms.addCourse(courseId: 'C01', courseName: 'Dart');
    lms.enrollStudent(studentId: 'S01', courseId: 'C01');

    expect(
      () => lms.removeResult(studentId: 'S01', courseId: 'C01'),
      throwsException,
    );
  });
}
