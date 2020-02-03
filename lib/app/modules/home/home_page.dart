import 'package:chat_app/app/modules/home/home_controller.dart';
import 'package:chat_app/app/modules/home/widgets/chat_message/chat_message_widget.dart';
import 'package:chat_app/app/modules/home/widgets/text_composer/text_composer_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = Modular.get<HomeController>();

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.onAuthStateChanged.listen((user) {
      homeController.currentUser = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Observer(builder: (_) {
          return Text(homeController.currentUser != null
              ? homeController.currentUser.displayName
              : "Chat App");
        }),
        actions: <Widget>[
          Observer(builder: (_) {
            return homeController.currentUser != null
                ? IconButton(
                    icon: Icon(Icons.exit_to_app),
                    onPressed: homeController.singOut)
                : Container();
          }),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: Firestore.instance
                  .collection('messages')
                  .orderBy('time')
                  .snapshots(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return Center(child: CircularProgressIndicator());
                  default:
                    List<DocumentSnapshot> docs =
                        snapshot.data.documents.reversed.toList();
                    return ListView.builder(
                      itemCount: docs.length,
                      reverse: true,
                      itemBuilder: (context, index) {
                        return ChatMessageWidget(
                            docs[index].data,
                            docs[index].data['uid'] ==
                                    homeController.currentUser?.uid.toString()
                                ? true
                                : false);
                      },
                    );
                }
              },
            ),
          ),
          Observer(builder: (_) {
            return homeController.isLoading
                ? LinearProgressIndicator()
                : Container();
          }),
          TextComposerWidget(),
        ],
      ),
    );
  }
}
