class Rectangle {
  double side = 0;
  double base = 0;

  Rectangle(double base, double side) {
    this.base = base;
    this.side = side;
  }

  double getPerimeter() {
    return base * 2 + side * 2;
  }

  double getArea() {
    return base * side;
  }

  @override
String toString() {
    return ("El rectangulo tiene $side de lado y $base de base, su area es ${getArea()} y su perimetro es ${getPerimeter()}");
  }
  }

