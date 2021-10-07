import 'package:flutter/material.dart';
import 'package:flutter_animations/animated_list_screen.dart';
import 'package:flutter_animations/dismissible_screen.dart';
import 'package:flutter_animations/fade_transition_screen.dart';
import 'package:flutter_animations/list_screen.dart';
import 'package:flutter_animations/my_animation.dart';
import 'package:flutter_animations/shape_animation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: MyAnimation(),
      home: DismissibleScreen(),
    );
  }
}
