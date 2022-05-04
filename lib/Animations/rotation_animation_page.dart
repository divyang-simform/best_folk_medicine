import 'package:flutter/material.dart';

import '../Setting/resources.dart';

class RotationPage extends StatefulWidget {
  const RotationPage({Key? key}) : super(key: key);

  @override
  _RotationPageState createState() => _RotationPageState();
}

class _RotationPageState extends State<RotationPage>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation<Offset>? animation;
  bool moonLocation = false;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
    animation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(7, 0.0),
    ).animate(CurvedAnimation(
      parent: animationController!,
      curve: Curves.easeIn,
    ))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          moonLocation = true;
          animationController?.reverse();
        } else if (status == AnimationStatus.dismissed) {
          moonLocation = false;
          animationController?.forward();
        }
      });
    // Tween<double>(begin: 0, end: 2 * pi).animate(animationController!);
    animationController?.forward();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // return RotatingTransition(
    //     child: const MoonImage(), angle: animation as Animation<Offset>);
    return Stack(
      alignment: Alignment.center,
      children: [
        (moonLocation == false)
            ? Align(
                alignment: Alignment.centerLeft,
                child: SlideTransition(
                  // origin: const Offset(170, 0),
                  // angle: angle.value,
                  position: animation as Animation<Offset>,
                  child: AnimatedOpacity(
                    duration: const Duration(seconds: 3),
                    opacity: 1.0,
                    child: Image.asset(
                      kMoonImage,
                      height: 50,
                      width: 50,
                    ),
                  ),
                ))
            : const Text(""),
        Align(
            alignment: Alignment.center,
            child: Image.asset(
              kEarthImage,
              height: 200,
              width: 200,
            )),
        (moonLocation)
            ? Align(
                alignment: Alignment.centerLeft,
                child: SlideTransition(
                  // origin: const Offset(170, 0),
                  // angle: angle.value,
                  position: animation as Animation<Offset>,
                  child: AnimatedOpacity(
                    duration: const Duration(seconds: 3),
                    opacity: 1.0,
                    child: Image.asset(
                      kMoonImage,
                      height: 50,
                      width: 50,
                    ),
                  ),
                ))
            : const Text(""),
        // const Align(
        //   child: RotationPage(),
        //   alignment: Alignment.centerLeft,
        // ),
      ],
    );

    //   SlideTransition(
    //   // origin: const Offset(170, 0),
    //   // angle: angle.value,
    //   position: animation as Animation<Offset>,
    //   child: AnimatedOpacity(
    //     duration: const Duration(seconds: 3),
    //     opacity: 1.0,
    //     child:
    //     Image.asset(
    //       "asset/animation/moon.png",
    //       height: 50,
    //       width: 50,
    //     ),
    //   ),
    // );
  }
}

// class RotatingTransition extends StatelessWidget {
//   const RotatingTransition({Key? key, required this.child, required this.angle})
//       : super(key: key);
//   final Widget child;
//   final Animation<Offset> angle;
//
//   @override
// Widget build(BuildContext context) {
//   return AnimatedBuilder(
//       animation: angle,
//       child: child,
//       builder: (context, child) {
//         return SlideTransition(
//           // origin: const Offset(170, 0),
//           // angle: angle.value,
//           position: angle,
//           child: child,
//         );
//       });
// }}
//
// class MoonImage extends StatelessWidget {
//   const MoonImage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Image.asset(
//       "asset/animation/moon.png",
//       height: 50,
//       width: 50,
//     );
//   }
// }
