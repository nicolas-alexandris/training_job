import 'package:flutter_test/flutter_test.dart';
import 'package:training_job/weather/weather_main_page.dart';

void main() {
  testWidgets('WeatherMainPage widgets', (tester) async {
    await tester.pumpWidget(const WeatherMainPage());

    // TODO: mock api data to generate the widgets?
    expect(find.text('Greece'), findsOneWidget);
    expect(find.text('London'), findsOneWidget);
    expect(find.text('Istanbul'), findsOneWidget);
    expect(find.text('Nuuk'), findsOneWidget);
    expect(find.text('New York'), findsOneWidget);
    expect(find.text('Tokyo'), findsOneWidget);
    expect(find.text('Sydney'), findsOneWidget);
  });
}
