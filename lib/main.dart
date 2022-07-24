import 'package:flutter/material.dart';
import 'features/offer_page/page/OfferPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Carmel Bakery',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OfferPage(),
    );
  }
}
