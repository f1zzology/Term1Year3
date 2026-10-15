import '../model/student.dart';

List<Student> students = [];

Student? _findStudentOrNull(String studentId) {
  for (var student in students) {
    if (student.id == studentId) {
      return student;
    }
  }
  return null;
}

void removeStudent({required String studentId}) {
Student? student = _findStudentOrNull(studentId);
if (student == null) {
throw Exception('Student $studentId not found');
}
// 1- Remove student from the students list
students.removeWhere((student) => student.id == studentId);
}
