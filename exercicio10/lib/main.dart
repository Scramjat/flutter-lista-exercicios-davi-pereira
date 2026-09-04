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
      home: TelaControleEstoque(),
    );
  }
}

class TelaControleEstoque extends StatefulWidget {
  const TelaControleEstoque({super.key});

  @override
  State<TelaControleEstoque> createState() => _TelaControleEstoqueState();
}

class _TelaControleEstoqueState extends State<TelaControleEstoque> {
  final TextEditingController quantidadeController = TextEditingController();

  int estoque = 0;
  String mensagem = '';

  void entrada() {
    int quantidade = int.tryParse(quantidadeController.text) ?? 0;
    setState(() {
      estoque = estoque + quantidade;
      mensagem = 'Entrada realizada com sucesso.';
    });
  }

  void saida() {
    int quantidade = int.tryParse(quantidadeController.text) ?? 0;
    setState(() {
      if (quantidade > estoque) {
        mensagem = 'Quantidade indisponível em estoque.';
      } else {
        estoque = estoque - quantidade;
        mensagem = 'Saída realizada com sucesso.';
      }
    });
  }

  void limparCampo() {
    quantidadeController.clear();
    setState(() {
      mensagem = '';
    });
  }

  @override
  void dispose() {
    quantidadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Controle de Estoque'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              'Quantidade atual em estoque: $estoque',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: quantidadeController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Quantidade',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: entrada,
                  child: const Text('Entrada'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: saida,
                  child: const Text('Saída'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: limparCampo,
                  child: const Text('Limpar campo'),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Text(
              mensagem,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
