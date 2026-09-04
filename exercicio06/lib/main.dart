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
      home: TelaCalculadora(),
    );
  }
}

class TelaCalculadora extends StatefulWidget {
  const TelaCalculadora({super.key});

  @override
  State<TelaCalculadora> createState() => _TelaCalculadoraState();
}

class _TelaCalculadoraState extends State<TelaCalculadora> {
  final TextEditingController numero1Controller = TextEditingController();
  final TextEditingController numero2Controller = TextEditingController();

  String resultado = '';

  double lerNumero1() {
    return double.tryParse(numero1Controller.text) ?? 0;
  }

  double lerNumero2() {
    return double.tryParse(numero2Controller.text) ?? 0;
  }

  void somar() {
    double n1 = lerNumero1();
    double n2 = lerNumero2();
    setState(() {
      resultado = 'Resultado: ${n1 + n2}';
    });
  }

  void subtrair() {
    double n1 = lerNumero1();
    double n2 = lerNumero2();
    setState(() {
      resultado = 'Resultado: ${n1 - n2}';
    });
  }

  void multiplicar() {
    double n1 = lerNumero1();
    double n2 = lerNumero2();
    setState(() {
      resultado = 'Resultado: ${n1 * n2}';
    });
  }

  void dividir() {
    double n1 = lerNumero1();
    double n2 = lerNumero2();
    setState(() {
      if (n2 != 0) {
        resultado = 'Resultado: ${n1 / n2}';
      } else {
        resultado = 'Não é possível dividir por zero.';
      }
    });
  }

  void limpar() {
    numero1Controller.clear();
    numero2Controller.clear();
    setState(() {
      resultado = '';
    });
  }

  @override
  void dispose() {
    numero1Controller.dispose();
    numero2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: numero1Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Primeiro número',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: numero2Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Segundo número',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: somar, child: const Text('+')),
                ElevatedButton(onPressed: subtrair, child: const Text('-')),
                ElevatedButton(onPressed: multiplicar, child: const Text('×')),
                ElevatedButton(onPressed: dividir, child: const Text('÷')),
              ],
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: limpar,
              child: const Text('Limpar'),
            ),
            const SizedBox(height: 30),
            Text(
              resultado,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
