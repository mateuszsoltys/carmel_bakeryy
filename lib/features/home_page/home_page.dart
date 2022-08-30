import 'package:carmel_bakeryy/features/collect_page/collect_page.dart';
import 'package:carmel_bakeryy/features/offer_page/page_main/OfferPage.dart';
import 'package:carmel_bakeryy/features/profile_page/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screens = [OfferPage(), CollectPage(), ProfilePage()];

    return Scaffold(
      body: screens[0],
      // bottomNavigationBar: BottomNavyBar(),
    );
  }
}
