class Square {
  double height = 0;

  Square(double height) {
    this.height = height;
  }
  double getArea() {
    return height * height;
  }

  double getPerimiter() {
    return 4 * height;
  }

  @override
  String toString() {
    return ("El cuadrado tiene $height de lado y su area es ${getArea()}");
  }
}
