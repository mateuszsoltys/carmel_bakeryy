import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class AnimatedArrowRight extends StatelessWidget {
  const AnimatedArrowRight({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 30,
        width: 50,
        child: const RiveAnimation.asset(
            'assets/animations/anim_arrow_right.riv'));
  }
}

class AnimatedArrowLeft extends StatelessWidget {
  const AnimatedArrowLeft({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 2,
      child: Container(
          height: 30,
          width: 50,
          child: const RiveAnimation.asset(
              'assets/animations/anim_arrow_right.riv')),
    );
  }
}

class AnimatedArrowDown extends StatelessWidget {
  const AnimatedArrowDown({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 1,
      child: Container(
          height: 30,
          width: 50,
          child: const RiveAnimation.asset(
              'assets/animations/anim_arrow_right.riv')),
    );
  }
}
