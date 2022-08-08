import 'package:flutter/material.dart';
import '../../../models/widgets/OfferWidgetModel.dart';

class OfferPageDrinks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: const Text('Napoje'))),
      backgroundColor: Color.fromARGB(255, 12, 145, 168),
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
