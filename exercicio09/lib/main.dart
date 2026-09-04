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
      home: TelaSistemaVendas(),
    );
  }
}

class TelaSistemaVendas extends StatefulWidget {
  const TelaSistemaVendas({super.key});

  @override
  State<TelaSistemaVendas> createState() => _TelaSistemaVendasState();
}

class _TelaSistemaVendasState extends State<TelaSistemaVendas> {
  final TextEditingController produtoController = TextEditingController();
  final TextEditingController precoController = TextEditingController();
  final TextEditingController quantidadeController = TextEditingController();

  String resultado = '';

  void calcular() {
    String produto = produtoController.text;
    double preco = double.tryParse(precoController.text) ?? 0;
    int quantidade = int.tryParse(quantidadeController.text) ?? 0;

    double subtotal = preco * quantidade;
    double desconto = subtotal > 500 ? subtotal * 0.1 : 0;
    double total = subtotal - desconto;

    setState(() {
      resultado = 'Produto: $produto\n'
          'Quantidade: $quantidade\n'
          'Subtotal: R\$ ${subtotal.toStringAsFixed(2)}\n'
          'Desconto: R\$ ${desconto.toStringAsFixed(2)}\n'
          'Total: R\$ ${total.toStringAsFixed(2)}';
    });
  }

  void limpar() {
    produtoController.clear();
    precoController.clear();
    quantidadeController.clear();
    setState(() {
      resultado = '';
    });
  }

  @override
  void dispose() {
    produtoController.dispose();
    precoController.dispose();
    quantidadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sistema Simples de Vendas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: produtoController,
              decoration: const InputDecoration(
                labelText: 'Produto',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: precoController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Preço unitário',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
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
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
