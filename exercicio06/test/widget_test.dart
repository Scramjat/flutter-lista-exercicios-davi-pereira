import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:exercicio06/main.dart';

void main() {
  testWidgets('Soma dois numeros corretamente', (WidgetTester tester) async {
    await tester.pumpWidget(const MeuApp());

    await tester.enterText(find.byType(TextField).at(0), '10');
    await tester.enterText(find.byType(TextField).at(1), '5');
    await tester.tap(find.widgetWithText(ElevatedButton, '+'));
    await tester.pump();

    expect(find.text('Resultado: 15.0'), findsOneWidget);
  });

  testWidgets('Divisao por zero mostra mensagem de erro',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MeuApp());

    await tester.enterText(find.byType(TextField).at(0), '10');
    await tester.enterText(find.byType(TextField).at(1), '0');
    await tester.tap(find.widgetWithText(ElevatedButton, '÷'));
    await tester.pump();

    expect(find.text('Não é possível dividir por zero.'), findsOneWidget);
  });
}
