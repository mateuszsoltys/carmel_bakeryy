import 'package:carmel_bakeryy/app/theme/global_theme.dart';
import 'package:carmel_bakeryy/features/auth_page/auth_page.dart';
import 'package:flutter/material.dart';

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
