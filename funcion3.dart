/*
crear funcion convertir pesos cop a dolares con parametros
opcionales en el precio del dollar
*/
void main() {
  int cop = 777777;
  int dollar = 4200;

  plata(cop);
}

plata(cop, [int dollar=3200]) {
  double resultadoDollar = cop / dollar;

  print("$resultadoDollar");
}
