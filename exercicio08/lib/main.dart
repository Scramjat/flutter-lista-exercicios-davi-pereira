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
      home: TelaConsumoCombustivel(),
    );
  }
}

class TelaConsumoCombustivel extends StatefulWidget {
  const TelaConsumoCombustivel({super.key});

  @override
  State<TelaConsumoCombustivel> createState() =>
      _TelaConsumoCombustivelState();
}

class _TelaConsumoCombustivelState extends State<TelaConsumoCombustivel> {
  final TextEditingController distanciaController = TextEditingController();
  final TextEditingController litrosController = TextEditingController();

  String resultado = '';

  void calcular() {
    double distancia = double.tryParse(distanciaController.text) ?? 0;
    double litros = double.tryParse(litrosController.text) ?? 0;

    if (litros <= 0) {
      setState(() {
        resultado = 'Informe uma quantidade de combustível válida.';
      });
      return;
    }

    double consumo = distancia / litros;
    String classificacao = consumo >= 12 ? 'Econômico' : 'Consumo elevado';

    setState(() {
      resultado = 'Consumo médio: ${consumo.toStringAsFixed(1)} km/l\n'
          'Classificação: $classificacao';
    });
  }

  void limpar() {
    distanciaController.clear();
    litrosController.clear();
    setState(() {
      resultado = '';
    });
  }

  @override
  void dispose() {
    distanciaController.dispose();
    litrosController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consumo de Combustível'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: distanciaController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Distância percorrida (km)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: litrosController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Combustível utilizado (litros)',
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
