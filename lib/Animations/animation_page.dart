import 'rotation_animation_page.dart';
import 'package:flutter/material.dart';

class AnimationPage extends StatefulWidget {
  const AnimationPage({Key? key}) : super(key: key);

  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  @override
  void initState() {
    super.initState();
    animationContainer();
  }

  double height = 450;
  double width = 250;
  double textOpacity = 1;
  double imageOpacity = 0;

  animationContainer() async {
    await Future.delayed(const Duration(seconds: 1));
    height = MediaQuery.of(context).size.height * 0.75;
    width = MediaQuery.of(context).size.height * 1;
    textOpacity = 0;
    imageOpacity = 1;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
            duration: const Duration(seconds: 3),
            height: height,
            width: width,
            color: Colors.black,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedOpacity(
                  duration: const Duration(seconds: 3),
                  opacity: imageOpacity,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      const Align(
                        child: RotationPage(),
                        alignment: Alignment.centerLeft,
                      ),
                      Image.asset(
                        "asset/animation/earth.png",
                        height: 200,
                        width: 200,
                      ),
                    ],
                  ),
                ),
                AnimatedOpacity(
                  duration: const Duration(seconds: 3),
                  opacity: textOpacity,
                  child: const Text(
                    "it is a solar system",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
