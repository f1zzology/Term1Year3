class Point {
  int x;
  int y;

  Point({required this.x, required this.y}) {}

  @override
  String toString() {
    return "Point x= $x, y=$y";
  }

  void translate({required int deltaX, required int deltaY}) {
    this.x += deltaX;
    this.y += deltaY;
  }
}

class Rectangle {
  Point topLeft;
  Point bottomRight;
  Rectangle({required this.topLeft, required this.bottomRight});

  int get width {
    return bottomRight.x - topLeft.x;
  }

  int get height {
    return bottomRight.y - topLeft.y;
  }

  int get area {
    return height * width;
  }
}

void main() {
  // test
  Point p1 = Point(x: 10, y: 20);
  print(p1);

  p1.translate(deltaX: 100, deltaY: 200);
  print(p1);
  Point topLeft = Point(x: 5, y: 7);
  Point bottomRight = Point(x: 10, y: 8);
  Rectangle rectangle = Rectangle(topLeft: topLeft,bottomRight: bottomRight,);

  print("Width: ${rectangle.width}");
  print("Height: ${rectangle.height}");
  print("Area: ${rectangle.area}");
}
