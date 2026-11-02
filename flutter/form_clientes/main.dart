import 'package:flutter/material.dart';

class PantallaClientes extends StatefulWidget {
  const PantallaClientes({super.key});

  @override
  State<PantallaClientes> createState() => _PantallaClientesState();
}

class _PantallaClientesState extends State<PantallaClientes> {
  // GlobalKey para gestionar el estado del formulario
  final _formKey = GlobalKey<FormState>();

  // Controladores de texto para leer la información ingresada
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _edadController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _telefonoController = TextEditingController();
  final TextEditingController _diasController = TextEditingController();

  @override
  void dispose() {
    // Liberación de recursos de los controladores
    _nombreController.dispose();
    _edadController.dispose();
    _emailController.dispose();
    _telefonoController.dispose();
    _diasController.dispose();
    super.dispose();
  }

  void _registrarCliente() {
    // Valida todos los campos mediante sus propiedades validator
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('El registro se realizó correctamente'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inscripción al Gimnasio'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // 1. Nombre completo
              TextFormField(
                controller: _nombreController,
                decoration: const InputDecoration(
                  labelText: 'Nombre completo',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'El nombre completo es obligatorio';
                  }
                  if (value.trim().length < 3) {
                    return 'El nombre debe tener mínimo 3 caracteres';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),

              // 2. Edad
              TextFormField(
                controller: _edadController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Edad',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.cake),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'La edad es obligatoria';
                  }
                  final edad = int.tryParse(value.trim());
                  if (edad == null || edad < 18) {
                    return 'Debe ser un número entero mayor o igual a 18';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),

              // 3. Correo electrónico
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Correo electrónico',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'El correo electrónico es obligatorio';
                  }
                  final emailRegExp = RegExp(
                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                  );
                  if (!emailRegExp.hasMatch(value.trim())) {
                    return 'Ingrese un correo electrónico válido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),

              // 4. Número de teléfono
              TextFormField(
                controller: _telefonoController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: 'Número de teléfono',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.phone),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'El número de teléfono es obligatorio';
                  }
                  final telefonoRegExp = RegExp(r'^\d{10}$');
                  if (!telefonoRegExp.hasMatch(value.trim())) {
                    return 'Debe contener exactamente 10 dígitos';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),

              // 5. Días de asistencia por semana
              TextFormField(
                controller: _diasController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Días de asistencia por semana',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.calendar_today),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Los días de asistencia son obligatorios';
                  }
                  final dias = int.tryParse(value.trim());
                  if (dias == null || dias < 1 || dias > 7) {
                    return 'Debe ser un número entero entre 1 y 7';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24.0),

              // Botón de envío
              ElevatedButton(
                onPressed: _registrarCliente,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                child: const Text('Registrar cliente'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}