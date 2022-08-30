import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(HomePageState(currentIndex: 0));

  Future<void> getActualIndex(int index) async {
    int _actualIndex = index;
    emit(HomePageState(currentIndex: _actualIndex));
  }
}
