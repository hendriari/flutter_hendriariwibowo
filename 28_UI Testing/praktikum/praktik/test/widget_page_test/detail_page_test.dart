import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:praktik/detail_page.dart';

void main(){
  testWidgets('Home Page Widget Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: DetailPage(),
      ),
    );

    expect(find.text('Hallo'), findsOneWidget);
  });
}