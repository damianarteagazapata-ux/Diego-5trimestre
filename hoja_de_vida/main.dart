
import 'package:flutter/material.dart';

void main() {
  runApp(const MiHojaDeVida());
}

class MiHojaDeVida extends StatelessWidget {
  const MiHojaDeVida({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mi Hoja de Vida',
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
      ),
      home: const HojaDeVidaPage(),
    );
  }
}

class HojaDeVidaPage extends StatelessWidget {
  const HojaDeVidaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F6FC),
      appBar: AppBar(
        title: const Text('Mi Hoja de Vida'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // Primera Card: Información personal
          Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.blue,
                    child: Icon(
                      Icons.person,
                      size: 45,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Heiler Damian Arteaga Zapata',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Desarrollador de software en formación',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                  const Divider(height: 25),
                  const Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.blue),
                      SizedBox(width: 8),
                      Text('Medellín, Colombia'),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 15),

          // Segunda Card: Información académica
          Card(
            elevation: 4,
            child: const Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.school,
                    color: Colors.blue,
                    size: 35,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Información académica',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Estudiante de ADSO '
                    '(Análisis y Desarrollo de Software) en el SENA.',
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 15),

          // Tercera Card: Experiencia laboral
          Card(
            elevation: 4,
            child: const Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.work_outline,
                    color: Colors.blue,
                    size: 35,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Experiencia laboral',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text('N/A - Sin experiencia laboral formal.'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

