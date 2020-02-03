import 'package:chat_app/app/modules/home/widgets/chat_message/chat_message_controller.dart';
import 'package:chat_app/app/modules/home/widgets/text_composer/text_composer_controller.dart';
import 'package:chat_app/app/modules/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:chat_app/app/modules/home/home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ChatMessageController()),
        Bind((i) => TextComposerController()),
        Bind((i) => HomeController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
