import 'package:lms_layered_architecture_example/model/course.dart';
import '../model/result.dart';
import '../model/student.dart';

class LmsSystem {
  final List<Student> students = [];
  final List<Course> courses = [];
  final List<Result> results = [];

  void addStudent({required String studentId, required String studentName}) {
    // ! Student shall not exist already
    Student? student = _findStudentOrNull(studentId);
    if (student != null) {
      throw Exception('Student $student already exists');
    }

    students.add(Student(id: studentId, name: studentName));
  }

  void removeStudent({required String studentId}) {
    Student? student = _findStudentOrNull(studentId);
    if (student == null) {
      throw Exception('Student $studentId not found');
    }
    // 1- Remove student from the students list
    students.removeWhere((student) => student.id == studentId);
  }

  Student? _findStudentOrNull(String studentId) {
    for (Student s in students) {
      if (s.id == studentId) {
        return s;
      }
    }
    return null; // not found
  }

  void addCourse({required String courseId, required String courseName}) {
    Course? course = _findCourseOrNull(courseId);
    if (course != null) {
      throw Exception("Course $course already exists");
    }
    courses.add(Course(id: courseId, name: courseName));
  }

  void removeCourse({required String courseId, required String courseName}) {
    Course? course = _findCourseOrNull(courseId);
    if (course == null) {
      throw Exception("Course $course is not found");
    }
    courses.removeWhere((course) => course.id == courseId);
  }

  Course? _findCourseOrNull(String courseId) {
    for (Course c in courses) {
      if (c.id == courseId) {
        return c;
      }
    }
    return null; // not found
  }

  void enrollStudent({required String studentId, required String courseId}) {
    Student? student = _findStudentOrNull(studentId);
    if (student == null) {
      throw Exception("Student $student not found");
    }
    Course? course = _findCourseOrNull(courseId);
    if (course == null) {
      throw Exception("Course $course not found");
    }
    if (student.courseIds.contains(courseId)) {
      throw Exception(
          'Student $studentId is already enrolled in course $courseId');
    }
    student.courseIds.add(courseId);
  }

  void discardStudentFromCourse(
      {required String studentId, required String courseId}) {
    Student? student = _findStudentOrNull(studentId);
    if (student == null) {
      throw Exception("student $student not found");
    }
    Course? course = _findCourseOrNull(courseId);
    if (course == null) {
      throw Exception("Course $course not found");
    }
    if (!student.courseIds.contains(courseId)) {
      throw Exception('Student $studentId is not enrolled $courseId');
    }
    student.courseIds.remove(courseId);
  }

  void addResult(
      {required String studentId,
      required String courseId,
      required double score}) {
    Student? student = _findStudentOrNull(studentId);
    if (student == null) {
      throw Exception("Student $student not found");
    }
    Course? course = _findCourseOrNull(courseId);
    if (course == null) {
      throw Exception("Course $course not found");
    }
    if (!student.courseIds.contains(courseId)) {
      throw Exception(
          'Student $studentId is already enrolled in course $courseId');
    }
    if (score < 0 || score > 100) {
      throw Exception("score range must be 0 - 100");
    }
    bool alreadyHaveResult = results.any(
      (result) => result.studentId == studentId && result.courseId == courseId,
    );
    if (alreadyHaveResult) {
      throw Exception('A result already exists for student $studentId'
          'in course $courseId');
    }
    results.add(Result(courseId: courseId, studentId: studentId, score: score));
  }

  void removeResult(
      {required String studentId,
      required String courseId,
      }) {
    bool alreadyHaveResult = results.any((result) =>
        result.studentId == studentId && result.courseId == courseId);
    if (alreadyHaveResult) {
      throw Exception("a result already exist for student $studentId"
          'in course $courseId');
    }
    results.removeWhere((result) => result.studentId == studentId && result.courseId == courseId);
  }
}
