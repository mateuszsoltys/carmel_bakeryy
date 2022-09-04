import 'package:carmel_bakeryy/app/theme/global_theme.dart';
import 'package:carmel_bakeryy/features/auth_page/auth_page.dart';
import 'package:carmel_bakeryy/features/home_page/home_page.dart';
import 'package:flutter/material.dart';
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
      theme: GlobalTheme(),
      home: AuthGate(),
    );
  }
}
