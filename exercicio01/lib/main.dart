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
      home: TelaIdentificacaoUsuario(),
    );
  }
}

class TelaIdentificacaoUsuario extends StatefulWidget {
  const TelaIdentificacaoUsuario({super.key});

  @override
  State<TelaIdentificacaoUsuario> createState() =>
      _TelaIdentificacaoUsuarioState();
}

class _TelaIdentificacaoUsuarioState extends State<TelaIdentificacaoUsuario> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController cidadeController = TextEditingController();

  String mensagem = '';

  void mostrar() {
    String nome = nomeController.text;
    String cidade = cidadeController.text;

    setState(() {
      mensagem = 'Olá, $nome! Você mora em $cidade.';
    });
  }

  void limpar() {
    nomeController.clear();
    cidadeController.clear();
    setState(() {
      mensagem = '';
    });
  }

  @override
  void dispose() {
    nomeController.dispose();
    cidadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Identificação do Usuário'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nomeController,
              decoration: const InputDecoration(
                labelText: 'Nome',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: cidadeController,
              decoration: const InputDecoration(
                labelText: 'Cidade',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: mostrar,
                  child: const Text('Mostrar'),
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
              mensagem,
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
