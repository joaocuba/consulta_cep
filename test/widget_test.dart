import 'package:flutter_test/flutter_test.dart';
import 'package:consulta_cep/main.dart';

void main() {
  testWidgets('Exibe a tela de consulta de CEP', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Consulta CEP'), findsOneWidget);
    expect(find.text('Pesquisar CEP'), findsOneWidget);
    expect(find.text('CEP: '), findsOneWidget);
  });
}
