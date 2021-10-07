import 'package:flutter/material.dart';

class MyAnimation extends StatefulWidget {
  const MyAnimation({Key? key}) : super(key: key);

  @override
  _MyAnimationState createState() => _MyAnimationState();
}

class _MyAnimationState extends State<MyAnimation> {
  final List<Color> colors = [
    Colors.green,
    Colors.orange,
    Colors.red,
    Colors.blue,
    Colors.yellow
  ];
  int iteration = 0;
  final List<double> sizes = [100, 125, 150, 175, 200];
  final List<double> tops = [0, 50, 100, 150, 200];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Animations '),
        actions: [
          IconButton(
            icon: Icon(Icons.run_circle),
            onPressed: () {
              iteration < colors.length - 1 ? iteration++ : iteration = 0;
              setState(() {});
            },
          )
        ],
      ),
      body: Center(
          child: AnimatedContainer(
        width: sizes[iteration],
        height: sizes[iteration],
        duration: Duration(seconds: 2),
        color: colors[iteration],
        margin: EdgeInsets.only(top: tops[iteration]),
      )),
    );
  }
}
