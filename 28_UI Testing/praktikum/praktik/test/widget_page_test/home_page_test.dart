import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:praktik/home_page.dart';

void main() {
  testWidgets('Home Page Widget Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: HomePage(),
      ),
    );

    expect(find.text('Follower'), findsOneWidget);
    expect(find.text('3.2 M followers'), findsOneWidget);
    expect(find.text('Post'), findsOneWidget);
    expect(find.text('1,084 post'), findsOneWidget);
    expect(find.text('Following'), findsOneWidget);
    expect(find.text('668 following'), findsOneWidget);
    expect(find.text('Naruto Uzumaki'), findsOneWidget);
    expect(find.text('10 Oktober 1998'), findsOneWidget);
    expect(find.text('Nijigen no Mori Theme Park, Konoha'), findsOneWidget);
    expect(
        find.text('Hai aku Naruto, Senang bertemu denganmu'), findsOneWidget);
    expect(find.text('Konoha'), findsOneWidget);

    expect(find.byIcon(Icons.arrow_forward_ios), findsOneWidget);
  });
}
