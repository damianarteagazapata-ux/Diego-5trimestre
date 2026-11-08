import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Reporte de Danos Medellín',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const ReporteFormularioPage(),
    );
  }
}

class ReporteFormularioPage extends StatefulWidget {
  const ReporteFormularioPage({super.key});

  @override
  State<ReporteFormularioPage> createState() => _ReporteFormularioPageState();
}

class _ReporteFormularioPageState extends State<ReporteFormularioPage> {
  // 1. Variables para cada dato (cumple el primer punto de la lista)
  String? _barrioSeleccionado;
  String? _tipoDanoSeleccionado;
  
  // Mapa para almacenar el estado de los checkboxes (Personas afectadas)
  final Map<String, bool> _personasAfectadas = {
    'Peatones': false,
    'Vehículos': false,
    'Comerciantes': false,
  };

  bool _deseaInformacion = false;

  // Listas de opciones basadas en la tabla del ejercicio
  final List<String> _barrios = ['Belén', 'Laureles', 'Robledo', 'Manrique'];
  final List<String> _tiposDano = ['Alumbrado', 'Basuras', 'Vías'];

  // Método para mostrar el resumen al presionar el botón
  void _enviarReporte() {
    // Filtrar cuáles checkboxes están seleccionados
    List<String> afectadosSeleccionados = _personasAfectadas.entries
        .where((entry) => entry.value)
        .map((entry) => entry.key)
        .toList();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Resumen del Reporte'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('**Barrio:** ${_barrioSeleccionado ?? "No seleccionado"}'),
                const SizedBox(height: 8),
                Text('**Tipo de dano:** ${_tipoDanoSeleccionado ?? "No seleccionado"}'),
                const SizedBox(height: 8),
                Text('**Personas afectadas:** ${afectadosSeleccionados.isEmpty ? "Ninguna" : afectadosSeleccionados.join(", ")}'),
                const SizedBox(height: 8),
                Text('**Recibir información:** ${_deseaInformacion ? "Sí" : "No"}'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cerrar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reporte de Danos - Medellín'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              'Reporte de dano en espacio público',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // --- CAMPO 1: BARRIO (Dropdown) ---
            const Text('Barrio:', style: TextStyle(fontWeight: FontWeight.w600)),
            DropdownButtonFormField<String>(
              value: _barrioSeleccionado,
              hint: const Text('Seleccione un barrio'),
              isExpanded: true,
              items: _barrios.map((String barrio) {
                return DropdownMenuItem<String>(
                  value: barrio,
                  child: Text(barrio),
                );
              }).toList(),
              onChanged: (String? nuevoValor) {
                // Uso de setState() para actualizar la selección
                setState(() {
                  _barrioSeleccionado = nuevoValor;
                });
              },
            ),
            const SizedBox(height: 20),

            //  TIPO DE DAñO (Radio Buttons) ---
            const Text('Tipo de dano:', style: TextStyle(fontWeight: FontWeight.w600)),
            ..._tiposDano.map((String tipo) {
              return RadioListTile<String>(
                title: Text(tipo),
                value: tipo,
                groupValue: _tipoDanoSeleccionado,
                onChanged: (String? nuevoValor) {
                  // Uso de setState() para actualizar la selección
                  setState(() {
                    _tipoDanoSeleccionado = nuevoValor;
                  });
                },
              );
            }),
            const SizedBox(height: 20),

            // --- CAMPO 3: PERSONAS AFECTADAS (Checkbox) ---
            const Text('Personas afectadas:', style: TextStyle(fontWeight: FontWeight.w600)),
            ..._personasAfectadas.keys.map((String persona) {
              return CheckboxListTile(
                title: Text(persona),
                value: _personasAfectadas[persona],
                controlAffinity: ListTileControlAffinity.leading,
                onChanged: (bool? nuevoValor) {
                  // Uso de setState() para actualizar la selección
                  setState(() {
                    _personasAfectadas[persona] = nuevoValor ?? false;
                  });
                },
              );
            }),
            const SizedBox(height: 20),

            // --- CAMPO 4: DESEA RECIBIR INFORMACIÓN (Switch) ---
            SwitchListTile(
              title: const Text('Desea recibir información'),
              value: _deseaInformacion,
              onChanged: (bool nuevoValor) {
                // Uso de setState() para actualizar la selección
                setState(() {
                  _deseaInformacion = nuevoValor;
                });
              },
            ),
            const SizedBox(height: 30),

            // --- BOTÓN DE ENVÍO ---
            ElevatedButton(
              onPressed: _enviarReporte,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              child: const Text('Enviar Reporte', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}
