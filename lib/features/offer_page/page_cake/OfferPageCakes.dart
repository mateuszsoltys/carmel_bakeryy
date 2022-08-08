import 'package:flutter/material.dart';
import '../../../models/widgets/AnimatedArrowWidget.dart';
import '../../../models/widgets/OfferWidgetModel.dart';

class OfferPageCakes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AnimatedArrowLeft(),
        title: const Center(
          child: Text('Ciasta'),
        ),
        actions: [
          Column(
            children: [
              AnimatedArrowRight(),
              const Text("Napoje"),
            ],
          )
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 12, 145, 168),
      body: ListView(
        children: const [
          OfferWidgetModel(),
          OfferWidgetModel(),
          OfferWidgetModel(),
          OfferWidgetModel(),
          OfferWidgetModel(),
          OfferWidgetModel(),
          OfferWidgetModel(),
          OfferWidgetModel(),
          OfferWidgetModel(),
          OfferWidgetModel(),
          OfferWidgetModel(),
          OfferWidgetModel(),
          OfferWidgetModel(),
          OfferWidgetModel(),
        ],
      ),
    );
  }
}
