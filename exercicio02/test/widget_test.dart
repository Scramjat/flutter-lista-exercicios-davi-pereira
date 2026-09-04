import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:exercicio02/main.dart';

void main() {
  testWidgets('Tela inicial exibe o titulo e o botao Verificar',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MeuApp());

    expect(find.text('Verificador de Idade'), findsOneWidget);
    expect(find.widgetWithText(ElevatedButton, 'Verificar'), findsOneWidget);
    expect(find.widgetWithText(ElevatedButton, 'Limpar'), findsOneWidget);
  });
}
