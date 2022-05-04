import 'package:animated_text_kit/animated_text_kit.dart';
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
    width = 428;
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
            duration: const Duration(seconds: 5),
            height: height,
            width: width,
            color: bgColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedOpacity(
                  duration: const Duration(seconds: 5),
                  opacity: imageOpacity,
                  child:
                      // Stack(
                      //   alignment: Alignment.center,
                      //   children: [
                      //     Image.asset(
                      //       kEarthImage,
                      //       height: 200,
                      //       width: 200,
                      //     ),
                      const RotationPage(),
                  //   ],
                  // ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: AnimatedOpacity(
                    duration: const Duration(seconds: 5),
                    opacity: textOpacity,
                    child: TextLiquidFill(
                      text: kSolorSystemTitle,
                      waveColor: Colors.blueAccent,
                      textStyle: const TextStyle(
                          color: kSolorSystmTextColor, fontSize: 30),
                      boxHeight: 100.0,
                    ),
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
