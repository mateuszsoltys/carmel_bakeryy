import 'package:carmel_bakeryy/models/widgets/AnimatedGreenLight.dart';
import 'package:carmel_bakeryy/models/widgets/AnimatedRedLight.dart';
import 'package:flutter/material.dart';

class PlaceStatusIndicator extends StatelessWidget {
  const PlaceStatusIndicator({
    required this.indicator,
    Key? key,
  }) : super(key: key);
  final indicator;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: FittedBox(
        fit: BoxFit.contain,
        child: Column(
          children: [
            indicator ? AnimatedGreenLight() : AnimatedRedLight(),
            SizedBox(
              height: 5,
            ),
            indicator ? Text("OTWARTE") : Text("ZAMKNIĘTE"),
          ],
        ),
      ),
    );
  }
}
