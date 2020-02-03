import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:chat_app/app/modules/home/widgets/text_composer/text_composer_controller.dart';
import 'package:chat_app/app/modules/home/home_module.dart';

void main() {
  initModule(HomeModule());
  TextComposerController textcomposer;

  setUp(() {
    textcomposer = HomeModule.to.get<TextComposerController>();
  });

  group('TextComposerController Test', () {
    test("First Test", () {
      expect(textcomposer, isInstanceOf<TextComposerController>());
    });

    test("Set Value", () {
      expect(textcomposer.text, equals('0'));
      textcomposer.changeText('text');
      expect(textcomposer.text, equals('1'));
    });
  });
}
