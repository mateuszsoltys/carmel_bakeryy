import 'package:carmel_bakeryy/features/offer_page/page_cake/OfferPageCakes.dart';
import 'package:carmel_bakeryy/features/offer_page/page_drinks/OfferPageDrinks.dart';
import 'package:carmel_bakeryy/features/offer_page/page_other/OfferPageOther.dart';
import 'package:flutter/material.dart';

class OfferPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 12, 145, 168),
      body: MyPageViewCollecstion(),
    );
  }
}

class MyPageViewCollecstion extends StatelessWidget {
  const MyPageViewCollecstion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return PageView(
      controller: controller,
      children: [OfferPageCakes(), OfferPageDrinks(), OfferPageOther()],
    );
  }
}
