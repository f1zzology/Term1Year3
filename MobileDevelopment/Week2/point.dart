class Point {
  final int x;
  final int y;

  Point({required this.x, required this.y}) {}

  @override
  String toString() {
    return "Point x= $x, y=$y";
  }

  Point translate(int deltaX, int deltaY) {
    return Point(x: x + deltaX, y: y + deltaY);
  }
}

class Rectangle {
  Point bottomRight;
  Point topLeft;
  Rectangle({required this.bottomRight, required this.topLeft});
  int get width {
    return bottomRight.x - topLeft.x;
  }

  int get height {
    return bottomRight.y - topLeft.y;
  }

  int get area {
    return width * height;
  }
}

void main() {
  // test
  Point p1 = Point(x: 10, y: 15);
  Point p2 = p1.translate(10, 200);
  print(p2);

  print(p1);
  Point topLeft = Point(x: 6, y: 7);
  Point bottomRight = Point(x: 8, y: 9);
  Rectangle rectangle = Rectangle(bottomRight: bottomRight, topLeft: topLeft);
  print("Width: ${rectangle.width}");
  print("Height: ${rectangle.height}");
  print("Area: ${rectangle.area}");
}
