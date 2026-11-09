import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const Page());
}



class Page extends StatelessWidget {
  const Page({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Api',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
          filled: true,
      ),
      ),
      home: const Api(),
    );
  }
}

class Api extends StatefulWidget {
  const Api({super.key});

  @override
  State<Api> createState() => _ApiState();
}

class _ApiState extends State<Api> {
  List users = [];
//url api
  final String url = 'https://jsonplaceholder.typicode.com/users';


Future<void> getUsers() async {
  final response = await http.get(Uri.parse(url));
  List data = jsonDecode(response.body);
  //print(response.body);
  print(response.statusCode);
  
  try {
    if (response.statusCode == 200) {
      print('Success');
      final data = jsonDecode(response.body);

      setState(() {
        users = data;
      });

      print(data);
    } else {
      print('Error: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Api'),
      ),
      body: Center(
        child: ElevatedButton(onPressed: () {
          getUsers();
        }, child: Text('Get User')),
       ListView.builder(
         itemCount: users.length,
         itemBuilder: (context, index) {
           return ListTile(
             title: Text(users[index]['name']),
             subtitle: Text(users[index]['email']),
           );
         },
       ),
      ),
    );
  }
}
