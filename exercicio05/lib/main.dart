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
      home: TelaCalculadoraMedia(),
    );
  }
}

class TelaCalculadoraMedia extends StatefulWidget {
  const TelaCalculadoraMedia({super.key});

  @override
  State<TelaCalculadoraMedia> createState() => _TelaCalculadoraMediaState();
}

class _TelaCalculadoraMediaState extends State<TelaCalculadoraMedia> {
  final TextEditingController nota1Controller = TextEditingController();
  final TextEditingController nota2Controller = TextEditingController();
  final TextEditingController nota3Controller = TextEditingController();

  String resultado = '';

  void calcular() {
    double nota1 = double.tryParse(nota1Controller.text) ?? 0;
    double nota2 = double.tryParse(nota2Controller.text) ?? 0;
    double nota3 = double.tryParse(nota3Controller.text) ?? 0;

    double media = (nota1 + nota2 + nota3) / 3;
    String situacao = media >= 6 ? 'Aprovado' : 'Reprovado';

    setState(() {
      resultado = 'Média: ${media.toStringAsFixed(1)}\nSituação: $situacao';
    });
  }

  void limpar() {
    nota1Controller.clear();
    nota2Controller.clear();
    nota3Controller.clear();
    setState(() {
      resultado = '';
    });
  }

  @override
  void dispose() {
    nota1Controller.dispose();
    nota2Controller.dispose();
    nota3Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de Média'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nota1Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Nota 1',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: nota2Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Nota 2',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: nota3Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Nota 3',
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
