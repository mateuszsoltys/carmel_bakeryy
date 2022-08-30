import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: SimpleDialog(children: [
          Column(children: [
            CircularProgressIndicator(),
            Text('Ładowanie danych...')
          ])
        ]));
  }
}
