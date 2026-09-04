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
      home: TelaAntecessorSucessor(),
    );
  }
}

class TelaAntecessorSucessor extends StatefulWidget {
  const TelaAntecessorSucessor({super.key});

  @override
  State<TelaAntecessorSucessor> createState() =>
      _TelaAntecessorSucessorState();
}

class _TelaAntecessorSucessorState extends State<TelaAntecessorSucessor> {
  final TextEditingController numeroController = TextEditingController();

  String resultado = '';

  void calcular() {
    int numero = int.tryParse(numeroController.text) ?? 0;
    int antecessor = numero - 1;
    int sucessor = numero + 1;

    setState(() {
      resultado = 'Número: $numero\nAntecessor: $antecessor\nSucessor: $sucessor';
    });
  }

  void limpar() {
    numeroController.clear();
    setState(() {
      resultado = '';
    });
  }

  @override
  void dispose() {
    numeroController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Antecessor e Sucessor'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: numeroController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Número',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: calcular,
                  child: const Text('Calcular'),
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
