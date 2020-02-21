import 'dart:io';
import 'package:chat_app/app/modules/home/home_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'text_composer_controller.g.dart';

class TextComposerController = _TextComposerBase with _$TextComposerController;

abstract class _TextComposerBase with Store {
  final menssageController = TextEditingController();
  final homeController = Modular.get<HomeController>();

  File imgFile;

  @observable
  String text = "";

  @observable
  bool isComposing = false;

  @action
  void changeText(String txt) {
    text = txt;
    if (text.isNotEmpty)
      isComposing = true;
    else
      isComposing = false;
  }

  @action
  Future sendMessage() async {
    final FirebaseUser user = await homeController.getUser();

    if (user == null) {
      print('--- usuario nulo ---');
    } else {
      Map<String, dynamic> data = {
        "uid": user.uid,
        "senderName": user.displayName,
        "senderPhotoUrl": user.photoUrl,
        "time": Timestamp.now(),
      };

      if (imgFile != null) {
        StorageUploadTask task = FirebaseStorage.instance
            .ref()
            .child('img')
            .child(user.uid + DateTime.now().millisecondsSinceEpoch.toString())
            .putFile(imgFile);

        homeController.isLoading = true;

        StorageTaskSnapshot taskSnapshot = await task.onComplete;
        String url = await taskSnapshot.ref.getDownloadURL();
        data["imgUrl"] = url;
        imgFile = null;

        homeController.isLoading = false;
      }

      if (text != null) data['text'] = text;
      text = "";

      menssageController.clear();
      isComposing = false;

      Firestore.instance.collection('messages').add(data);
    }
  }
}
