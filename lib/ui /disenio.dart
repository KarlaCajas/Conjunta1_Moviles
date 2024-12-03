import 'package:flutter/material.dart';

class Disenio extends StatefulWidget {
  @override
  _DisenioState createState() => _DisenioState();
}

class _DisenioState extends State<Disenio> {
  final _formKey = GlobalKey<FormState>();
  final _num1Controller = TextEditingController();
  final _num2Controller = TextEditingController();
  bool _hovering = false;

  void _calculateInterval() {
    if (_formKey.currentState!.validate()) {
      int num1 = int.parse(_num1Controller.text);
      int num2 = int.parse(_num2Controller.text);
      List<int> interval = [];

      if (num1 < num2) {
        interval = [for (var i = num1 + 1; i < num2; i++) i];
      } else if (num2 < num1) {
        interval = [for (var i = num2 + 1; i < num1; i++) i];
      }

      String message = interval.isEmpty
          ? "Ambos números son iguales o no hay números intermedios."
          : "Números intermedios: ${interval.join(', ')}";

      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("Resultado"),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: const Text("Cerrar"),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Números'),
        backgroundColor: const Color.fromARGB(255, 224, 150, 166),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.pinkAccent,
              Color.fromARGB(255, 222, 236, 92)
            ], // Colores pastel
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Título centrado y en negrita
                  MouseRegion(
                    onEnter: (_) => setState(() => _hovering = true),
                    onExit: (_) => setState(() => _hovering = false),
                    child: Text(
                      'Números en un intervalo',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold, // Negrita
                        color: _hovering ? Colors.deepOrange : Colors.black87,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Ícono principal
                  const Icon(
                    Icons.numbers,
                    size: 100,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 20),

                  // Campo para el primer número
                  TextFormField(
                    controller: _num1Controller,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Primer número',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    style: const TextStyle(fontSize: 18),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese el primer número.';
                      }
                      if (int.tryParse(value) == null) {
                        return 'Debe ingresar un número entero válido.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),

                  // Campo para el segundo número
                  TextFormField(
                    controller: _num2Controller,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Segundo número',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    style: const TextStyle(fontSize: 18),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese el segundo número.';
                      }
                      if (int.tryParse(value) == null) {
                        return 'Debe ingresar un número entero válido.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  // Botón para calcular
                  MouseRegion(
                    onEnter: (_) => setState(() => _hovering = true),
                    onExit: (_) => setState(() => _hovering = false),
                    child: ElevatedButton.icon(
                      onPressed: _calculateInterval,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _hovering
                            ? Colors.red
                            : const Color.fromARGB(
                                242, 219, 199, 196), // Cambio aquí
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50,
                          vertical: 15,
                        ),
                        textStyle: const TextStyle(fontSize: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      icon: const Icon(Icons.calculate),
                      label: const Text("Calcular"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
