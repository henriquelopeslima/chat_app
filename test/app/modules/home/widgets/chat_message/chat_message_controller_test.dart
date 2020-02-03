import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:chat_app/app/modules/home/widgets/chat_message/chat_message_controller.dart';
import 'package:chat_app/app/modules/home/home_module.dart';

void main() {
  initModule(HomeModule());
  ChatMessageController chatmessage;

  setUp(() {
    chatmessage = HomeModule.to.get<ChatMessageController>();
  });

  group('ChatMessageController Test', () {
    test("First Test", () {
      expect(chatmessage, isInstanceOf<ChatMessageController>());
    });

    test("Set Value", () {
      expect(chatmessage.value, equals(0));
      chatmessage.increment();
      expect(chatmessage.value, equals(1));
    });
  });
}
