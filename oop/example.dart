void main() {
  final teacher1 = Producto(
    id: 'jp',
    nombre: '10101',
    precio: 55555,
    stock: '88',
  ); //instansciando
  print(teacher1);
  print("dasdas");
}

class Producto {
  String? id;
  String? nombre;
  int? precio;
  String? stock;

  Producto({this.id, this.nombre, this.precio, this.stock});

  void mostrarPrecioIncrementado() {
    if (precio != null) {
      int precioNuevo = precio! + 10;
      print(
        "Precio original: \$$precio | Precio incrementado (+10): \$$precioNuevo",
      );
    } else {
      print("No se puede incrementar porque el precio es nulo.");
    }
  }

  @override
  String toString() {
    return 'Producto(id: $id, nombre: $nombre, precio: $precio, stock: $stock)';
  }
}
