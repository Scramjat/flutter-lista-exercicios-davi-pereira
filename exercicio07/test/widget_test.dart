import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:exercicio07/main.dart';

void main() {
  testWidgets('Tela inicial exibe o titulo e o botao Calcular',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MeuApp());

    expect(find.text('Reajuste Salarial'), findsOneWidget);
    expect(find.widgetWithText(ElevatedButton, 'Calcular'), findsOneWidget);
    expect(find.widgetWithText(ElevatedButton, 'Limpar'), findsOneWidget);
  });
}
