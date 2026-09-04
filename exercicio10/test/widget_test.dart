import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:exercicio10/main.dart';

void main() {
  testWidgets('Entrada aumenta o estoque e saida acima do disponivel avisa',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MeuApp());

    expect(find.text('Quantidade atual em estoque: 0'), findsOneWidget);

    await tester.enterText(find.byType(TextField), '10');
    await tester.tap(find.widgetWithText(ElevatedButton, 'Entrada'));
    await tester.pump();
    expect(find.text('Quantidade atual em estoque: 10'), findsOneWidget);

    await tester.enterText(find.byType(TextField), '20');
    await tester.tap(find.widgetWithText(ElevatedButton, 'Saída'));
    await tester.pump();
    expect(find.text('Quantidade indisponível em estoque.'), findsOneWidget);
    expect(find.text('Quantidade atual em estoque: 10'), findsOneWidget);
  });
}
