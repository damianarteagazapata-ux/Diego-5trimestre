void main() {
  Map<String, dynamic> persons = {
    'document': 111,
    'name': "gerardo",
    'salary': 40000,
    'status': true,
  };
  print(persons);
  persons.addAll({"functions": 'develop in Dart'});
  print(persons);
  print("-----------------------------------");
  print(persons[0]);
}
