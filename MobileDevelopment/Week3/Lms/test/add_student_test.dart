import '../service/AddStudent.dart';

void main() {
  print('Running AddStudent tests...\n');

  // Test 1: Successfully add a student
  try {
    addStudent(studentId: 's1', studentName: 'Alice');
    assert(students.length == 1, 'Expected 1 student in list');
    assert(students[0].id == 's1', 'Expected student ID to be s1');
    assert(students[0].name == 'Alice', 'Expected student name to be Alice');
    print('✓ Test 1 Passed: Successfully added student.');
  } catch (e) {
    print('✗ Test 1 Failed: $e');
  }

  // Test 2: Throws Exception when adding duplicate student ID
  try {
    addStudent(studentId: 's1', studentName: 'Alice Duplicate');
    print('✗ Test 2 Failed: Expected exception for duplicate student, but none was thrown.');
  } catch (e) {
    print('✓ Test 2 Passed: Correctly threw exception on duplicate ID ($e)');
  }

  // Test 3: Successfully add another student with a unique ID
  try {
    addStudent(studentId: 's2', studentName: 'Bob');
    assert(students.length == 2, 'Expected 2 students in list');
    assert(students[1].id == 's2', 'Expected student ID to be s2');
    assert(students[1].name == 'Bob', 'Expected student name to be Bob');
    print('✓ Test 3 Passed: Successfully added second student.');
  } catch (e) {
    print('✗ Test 3 Failed: $e');
  }

  print('\nAll tests completed!');
}
