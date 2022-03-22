import 'dart:math';
import 'package:flutter/material.dart';

class RotationPage extends StatefulWidget {
  const RotationPage({Key? key}) : super(key: key);

  @override
  _RotationPageState createState() => _RotationPageState();
}

class _RotationPageState extends State<RotationPage>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
    animation =
        Tween<double>(begin: 0, end: 2 * pi).animate(animationController!);
    animationController?.repeat();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotatingTransition(
        child: const MoonImage(), angle: animation as Animation<double>);
  }
}

class RotatingTransition extends StatelessWidget {
  const RotatingTransition({Key? key, required this.child, required this.angle})
      : super(key: key);
  final Widget child;
  final Animation<double> angle;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: angle,
        child: child,
        builder: (context, child) {
          return Transform.rotate(
            origin: const Offset(170, 0),
            angle: angle.value,
            child: child,
          );
        });
  }
}

class MoonImage extends StatelessWidget {
  const MoonImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "asset/animation/moon.png",
      height: 50,
      width: 50,
    );
  }
}
