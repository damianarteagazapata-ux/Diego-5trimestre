class discount {
  int amount = 0;
  double dsct = 0;

  discount(int amount, double dsct) {
    this.amount = amount;
    this.dsct = dsct;
  }
  double getDiscount() {
    if (amount <= 0) {
     print("manito asi no");
      
    } else if (amount > 100) {
      dsct = 10;
    } else if (amount > 10 && amount <= 100) {
      dsct = 8.8;
    } else if (amount >= 1 && amount <= 10) {
      dsct = 1.11;
    }

    return dsct;
  }

  @override
  String toString() {
    return ("el descuento seria ${getDiscount()}%");
  }
}
