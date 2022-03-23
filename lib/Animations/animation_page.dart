import '../Setting/resources.dart';
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
  Color bgColor = kSolorSystemColor;

  animationContainer() async {
    await Future.delayed(const Duration(seconds: 1));
    height = MediaQuery.of(context).size.height * 0.75;
    width = MediaQuery.of(context).size.height * 1;
    textOpacity = 0;
    imageOpacity = 1;
    bgColor = kSolorSystmBGColor;
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
            color: bgColor,
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
                        kEarthImage,
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
                    kSolorSystemTitle,
                    style: TextStyle(color: kSolorSystmTextColor, fontSize: 30),
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
