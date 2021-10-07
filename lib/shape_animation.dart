import 'package:flutter/material.dart';

class ShapeAnimation extends StatefulWidget {
  const ShapeAnimation({Key? key}) : super(key: key);

  @override
  _ShapeAnimationState createState() => _ShapeAnimationState();
}

class _ShapeAnimationState extends State<ShapeAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> animation;
  double pos = 0;
  double posTop = 0;
  double posLeft = 0;
  late Animation<double> animationTop;
  late Animation<double> animationLeft;
  double maxTop = 0;
  double maxLeft = 0;
  final int ballSize = 100;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3))
          ..repeat(reverse: true);
    // animation = Tween<double>(begin: 0, end: 200).animate(_controller)
    //   ..addListener(() {
    //     moveBall();
    //   });
    // animationLeft = Tween<double>(begin: 0, end: 200).animate(_controller);
    // animationTop = Tween<double>(begin: 0, end: 400).animate(_controller)
    //   ..addListener(() {
    //     moveBall();
    //   });
    animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut)
      ..addListener(() {
        moveBall();
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Animation Controller'),
        ),
        body: SafeArea(
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraint) {
              maxLeft = constraint.maxWidth - ballSize;
              maxTop = constraint.maxHeight - ballSize;
              print(maxTop);
              return Stack(
                children: [
                  AnimatedBuilder(
                    animation: _controller,
                    child: Positioned(
                      child: Ball(),
                      left: posLeft,
                      top: posTop,
                    ),
                    builder: (BuildContext context, Widget? child) {
                      return Positioned(
                        child: Ball(),
                        left: posLeft,
                        top: posTop,
                      );
                    },
                  )
                ],
              );
            },
          ),
        ));
  }

  void moveBall() {
    // setState(() {
    //   pos = animation.value;
    // });
    // setState(() {
    //   posTop = animationTop.value;
    //   posLeft = animationLeft.value;
    // });
    // setState(() {
    //   posTop = animation.value * maxTop;
    //   posLeft = animation.value * maxLeft;
    // });
    posTop = animation.value * maxTop;
    posLeft = animation.value * maxLeft;
  }
}

class Ball extends StatelessWidget {
  const Ball({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
    );
  }
}
