class Student {
  final String name;
  final String id;
  Student({required this.id, required this.name});

  @override
  String toString() => '$name (ID: $id)';
}
