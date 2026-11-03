import 'package:flutter_test/flutter_test.dart';
import 'package:nuclear_akinator/main.dart';

void main() {
  testWidgets('mostra tela inicial e botão para começar', (tester) async {
    await tester.pumpWidget(const NuclearAkinatorApp());
    expect(find.text('COMEÇAR JOGO'), findsOneWidget);
    expect(find.textContaining('Pense em um objeto'), findsOneWidget);
  });

  testWidgets('navega para seleção de categoria', (tester) async {
    await tester.pumpWidget(const NuclearAkinatorApp());
    await tester.tap(find.text('COMEÇAR JOGO'));
    await tester.pumpAndSettle();
    expect(find.text('Escolha seu desafio'), findsOneWidget);
    expect(find.text('Alimentos'), findsOneWidget);
    expect(find.text('Objetos'), findsOneWidget);
  });
}
