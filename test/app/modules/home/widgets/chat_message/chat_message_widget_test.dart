// import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:chat_app/app/modules/home/widgets/chat_message/chat_message_widget.dart';

main() {
  testWidgets('ChatMessageWidget has message', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(ChatMessageWidget({},true)));
    final textFinder = find.text('ChatMessage');
    expect(textFinder, findsOneWidget);
  });
}
