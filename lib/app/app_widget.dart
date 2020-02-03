import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Slidy',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        iconTheme: IconThemeData(
          color: Colors.purple,
        ),
      ),
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
