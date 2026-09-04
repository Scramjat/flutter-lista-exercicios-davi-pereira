import 'package:flutter/material.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TelaConversorTemperatura(),
    );
  }
}

class TelaConversorTemperatura extends StatefulWidget {
  const TelaConversorTemperatura({super.key});

  @override
  State<TelaConversorTemperatura> createState() =>
      _TelaConversorTemperaturaState();
}

class _TelaConversorTemperaturaState extends State<TelaConversorTemperatura> {
  final TextEditingController celsiusController = TextEditingController();

  String resultado = '';

  void converter() {
    double celsius = double.tryParse(celsiusController.text) ?? 0;
    double fahrenheit = (celsius * 9 / 5) + 32;

    setState(() {
      resultado =
          'Temperatura em Fahrenheit: ${fahrenheit.toStringAsFixed(1)} °F';
    });
  }

  void limpar() {
    celsiusController.clear();
    setState(() {
      resultado = '';
    });
  }

  @override
  void dispose() {
    celsiusController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conversor de Temperatura'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: celsiusController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Temperatura em Celsius',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: converter,
                  child: const Text('Converter'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: limpar,
                  child: const Text('Limpar'),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Text(
              resultado,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
