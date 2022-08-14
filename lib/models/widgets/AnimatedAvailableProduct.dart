import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class AnimatedAvailableProduct extends StatelessWidget {
  const AnimatedAvailableProduct({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        width: 30,
        child: const RiveAnimation.asset(
            'assets/animations/available_product.riv'));
  }
}
