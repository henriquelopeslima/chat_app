import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:chat_app/app/modules/home/widgets/text_composer/text_composer_widget.dart';

main() {
  testWidgets('TextComposerWidget has message', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(TextComposerWidget()));
    final textFinder = find.text('TextComposer');
    expect(textFinder, findsOneWidget);
  });
}
