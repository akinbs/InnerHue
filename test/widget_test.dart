import 'package:flutter_test/flutter_test.dart';
import 'package:inner_hue/app.dart';

void main() {
  testWidgets('App smoke test — SplashScreen renders', (WidgetTester tester) async {
    await tester.pumpWidget(const InnerHueApp());
    expect(find.text('InnerHue'), findsOneWidget);
  });
}
