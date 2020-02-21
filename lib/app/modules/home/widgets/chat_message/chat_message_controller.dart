import 'package:mobx/mobx.dart';

part 'chat_message_controller.g.dart';

class ChatMessageController = _ChatMessageBase with _$ChatMessageController;

abstract class _ChatMessageBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
