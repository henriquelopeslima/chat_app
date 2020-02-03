
import 'package:chat_app/app/modules/home/widgets/text_composer/text_composer_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';

class TextComposerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textComposerController = Modular.get<TextComposerController>();

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.photo_camera),
            onPressed: () async {
              textComposerController.imgFile = await ImagePicker.pickImage(source: ImageSource.camera);
              textComposerController.sendMessage();
            },
          ),
          Expanded(
            child: TextField(
              controller: textComposerController.menssageController,
              decoration: InputDecoration.collapsed(
                hintText: "Enviar uma mensagem!",
              ),
              onChanged: textComposerController.changeText
              ,
              onSubmitted: (text) async {
                textComposerController.sendMessage();
              },
            ),
          ),
          Observer(
            builder: (_) {
              return IconButton(
                icon: Icon(Icons.send),
                onPressed: textComposerController.isComposing
                    ? () async {
                        textComposerController.sendMessage();
                      }
                    : null,
              );
            },
          ),
        ],
      ),
    );
  }
}
