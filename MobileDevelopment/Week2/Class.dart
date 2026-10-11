// class Tree {
//   // attribute (data)
//   int size;

//   // constructor (to build your instance = object)
//   Tree(this.size);
//   @override
//   String toString() {
//     return "Tree = $size";
//   }

// }

// class House {
//   Tree leftTree;
//   Tree rightTree;
//   House(this.leftTree, this.rightTree);
// }

// class Door {}

// void main() {
//   Tree t1 = Tree(1);
//   Tree t2 = Tree(2);
//   print(t2);
//   print(t1);
// }

class Person {
  String firstName;
  String lastName;

  Person(this.firstName, this.lastName);
  String get FullName => "$firstName  $lastName";
}

void main() {
  Person person = Person("omra", "nhean");
  print("full name : ${person.FullName}");
}

