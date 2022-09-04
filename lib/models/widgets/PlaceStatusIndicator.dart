import 'package:carmel_bakeryy/models/widgets/AnimatedGreenLight.dart';
import 'package:flutter/material.dart';

class PlaceStatusIndicator extends StatelessWidget {
  const PlaceStatusIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: FittedBox(
        fit: BoxFit.contain,
        child: Column(
          children: [
            AnimatedGreenLight(),
            SizedBox(
              height: 5,
            ),
            const Text("OTWARTE"),
          ],
        ),
      ),
    );
  }
}
