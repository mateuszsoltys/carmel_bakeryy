import 'package:flutter/material.dart';
import '../../../models/widgets/AnimatedArrowWidget.dart';
import '../../../models/widgets/OfferWidgetModel.dart';

class OfferPageCakes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(
          height: 30,
          width: 50,
        ),
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
      backgroundColor: const Color.fromARGB(255, 12, 145, 168),
      body: ListView(
        children: const [Text('dane z Firebase')],
      ),
    );
  }
}
