import 'package:carmel_bakeryy/models/widgets/PlaceStatusIndicator.dart';
import 'package:flutter/material.dart';
import '../../../models/widgets/AnimatedArrowWidget.dart';
import '../../../models/widgets/AnimatedGreenLight.dart';
import '../../../models/widgets/OfferWidgetModel.dart';

class OfferPageCakes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: PlaceStatusIndicator(),
        title: const Center(
          child: Text('CIASTA'),
        ),
        actions: [
          Column(
            children: [
              AnimatedArrowRight(),
              const Text("NAPOJE"),
            ],
          )
        ],
      ),
      body: ListView(
        children: const [Text('dane z Firebase')],
      ),
    );
  }
}
