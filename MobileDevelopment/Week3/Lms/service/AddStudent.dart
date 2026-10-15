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

void addStudent({required String studentId, required String studentName}) {

Student? student = _findStudentOrNull(studentId);
if (student != null) {
throw Exception('Student $student already exists');
}
students.add(Student(id: studentId, name: studentName));
}
