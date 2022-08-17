import 'package:flutter/material.dart';
import '../../../models/widgets/AnimatedArrowWidget.dart';
import '../../../models/widgets/OfferWidgetModel.dart';

class OfferPageDrinks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Column(
          children: [
            AnimatedArrowLeft(),
            const Text("CIASTA"),
          ],
        ),
        title: const Center(
          child: Text('NAPOJE'),
        ),
        actions: [
          Column(
            children: [
              AnimatedArrowRight(),
              const Text("INNE"),
            ],
          )
        ],
      ),
      backgroundColor: Color.fromARGB(255, 12, 145, 168),
      body: ListView(
        children: const [Text('dane z firebase')],
      ),
    );
  }
}
