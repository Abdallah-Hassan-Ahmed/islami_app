import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:islami_app/main.dart';

void main() {
  testWidgets('Islami app builds successfully', (WidgetTester tester) async {
    await tester.pumpWidget(
      const IslamiApp(isOnBoardingSeen: true),
    );

    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
