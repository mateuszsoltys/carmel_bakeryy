import 'package:carmel_bakeryy/features/collect_page/collect_page.dart';
import 'package:carmel_bakeryy/features/home_page/cubit/home_page_cubit.dart';
import 'package:carmel_bakeryy/features/offer_page/page_main/OfferPage.dart';
import 'package:carmel_bakeryy/features/profile_page/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomePageCubit(),
      child: BlocBuilder<HomePageCubit, HomePageState>(
        builder: (context, state) {
          int currentIndex = state.currentIndex;
          final screens = [OfferPage(), CollectPage(), ProfilePage()];
          return Scaffold(
            body: screens[currentIndex],
            bottomNavigationBar: BottomNavyBar(
              backgroundColor: Colors.brown,
              items: [
                BottomNavyBarItem(
                    activeColor: Colors.red,
                    icon: Icon(
                      Icons.list_alt_outlined,
                      color: Color.fromARGB(255, 238, 186, 109),
                    ),
                    title: Text(
                      'MENU',
                      style:
                          TextStyle(color: Color.fromARGB(255, 238, 186, 109)),
                    )),
                BottomNavyBarItem(
                    activeColor: Colors.red,
                    icon: Icon(Icons.qr_code_scanner,
                        color: Color.fromARGB(255, 238, 186, 109)),
                    title: Text('PIECZĄTKI',
                        style: TextStyle(
                            color: Color.fromARGB(255, 238, 186, 109)))),
                BottomNavyBarItem(
                    activeColor: Colors.red,
                    icon: Icon(Icons.person,
                        color: Color.fromARGB(255, 238, 186, 109)),
                    title: Text('PROFIL',
                        style: TextStyle(
                            color: Color.fromARGB(255, 238, 186, 109)))),
              ],
              selectedIndex: currentIndex,
              onItemSelected: context.read<HomePageCubit>().getActualIndex,
            ),
          );
        },
      ),
    );
  }
}
