abstract class Animal {
  int? paws;

  void MakeSound();
}

class Dog extends Animal {
  void MakeSound() {
    print("los recuerdos me consumieron");
  }
}

class Cat extends Animal {
  void MakeSound() {
    print("si no me proyecto no puedo manejar los problemas");
  }
}
