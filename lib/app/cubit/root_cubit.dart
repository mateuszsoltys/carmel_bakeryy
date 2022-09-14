import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:carmel_bakeryy/data/remote_data_sources/global_remote_data_source.dart';
import 'package:carmel_bakeryy/models/data/GlobalDataModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'root_state.dart';

class RootCubit extends Cubit<RootState> {
  RootCubit(
    this._globalRemoteDataSource,
  ) : super(RootState(open: null, admin: false));

  final GlobalRemoteDataSource _globalRemoteDataSource;
  StreamSubscription? _streamSubscription;

  Future<void> initGlobalSteram() async {
    _streamSubscription =
        _globalRemoteDataSource.getGlobalStateStream().listen((field) {
      emit(state.copyWith(open: field.open));
    });
  }

  Future<void> initGlobalAdmin() async {
    final GlobalDataModel user = await _globalRemoteDataSource.getUserID();
    final GlobalDataModel admin = await _globalRemoteDataSource.getAdminID();
    if (user.user == admin.admin1 || user.user == admin.admin2) {
      print('PRAWDA USER ${user}');
      print('PRAWDA ADMIN_1 ${admin.admin1}');
      print('PRAWDA ADMIN_2 ${admin.admin2}');
      emit(state.copyWith(admin: true));
    } else {
      print('FAŁSZ USER ${user}');
      print('FAŁSZ ADMIN_1 ${admin.admin1}');
      print('FAŁSZ ADMIN_2 ${admin.admin2}');
      emit(state.copyWith(admin: false));
    }
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
