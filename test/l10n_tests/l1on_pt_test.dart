import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

import '../widget_tests/setup_widget_tester.dart';
import 'setup_l10n.dart';

void main() {
  testWidgets(
    'Testing support to pt translations',
    (tester) async {
      const widget = SetupWidgetTester(
        navigatorObservers: [],
        locale: Locale('pt'),
        child: Setupl10n(),
      );
      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();

      expect(find.text('pt'), findsOneWidget);
      expect(find.text('R\$'), findsOneWidget);
      expect(find.text('brl'), findsOneWidget);
      expect(find.text('Portfólio'), findsOneWidget);
      expect(find.text('Movimentações'), findsOneWidget);
      expect(find.text('Cripto'), findsOneWidget);
      expect(find.text('Valor total de moedas'), findsOneWidget);
      expect(find.text('Detalhes'), findsOneWidget);
      expect(find.text('Preço atual'), findsOneWidget);
      expect(find.text('Variação 24h'), findsOneWidget);
      expect(find.text('Quantidade'), findsOneWidget);
      expect(find.text('Valor'), findsOneWidget);
      expect(find.text('Converter Moeda'), findsOneWidget);
      expect(find.text('Saldo disponível'), findsOneWidget);
      expect(find.text('Total estimado'), findsOneWidget);
      expect(find.text('Quanto voçê gostaria de converter?'), findsOneWidget);
      expect(find.text('Selecione uma moeda para converter'), findsOneWidget);
      expect(find.text('Valor maior que o saldo disponível'), findsOneWidget);
      expect(find.text('Revise os dados da sua conversão'), findsOneWidget);
      expect(find.text('Converter'), findsOneWidget);
      expect(find.text('Receber'), findsOneWidget);
      expect(find.text('Câmbio'), findsOneWidget);
      expect(find.text('Coompletar Conversão'), findsOneWidget);
      expect(find.text('Conversão efetuada'), findsOneWidget);
      expect(find.text('Conversão efetuada com sucesso!'), findsOneWidget);
      expect(find.text('Erro ao Carregar'), findsOneWidget);
      expect(find.text('Tentar novamente'), findsOneWidget);
    },
  );
}
