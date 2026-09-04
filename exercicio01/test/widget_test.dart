import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:exercicio01/main.dart';

void main() {
  testWidgets('Tela inicial exibe o titulo e o botao Mostrar',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MeuApp());

    expect(find.text('Identificação do Usuário'), findsOneWidget);
    expect(find.widgetWithText(ElevatedButton, 'Mostrar'), findsOneWidget);
    expect(find.widgetWithText(ElevatedButton, 'Limpar'), findsOneWidget);
  });
}
