import 'package:carmel_bakeryy/features/details_page/other_details_page/other_details_page.dart';
import 'package:flutter/material.dart';
import 'features/offer_page/page_main/OfferPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
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
      // home: OtherDetailsPage(),
      home: OfferPage(),
    );
  }
}
