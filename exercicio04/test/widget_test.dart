import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:exercicio04/main.dart';

void main() {
  testWidgets('Tela inicial exibe o titulo e o botao Converter',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MeuApp());

    expect(find.text('Conversor de Temperatura'), findsOneWidget);
    expect(find.widgetWithText(ElevatedButton, 'Converter'), findsOneWidget);
    expect(find.widgetWithText(ElevatedButton, 'Limpar'), findsOneWidget);
  });
}
