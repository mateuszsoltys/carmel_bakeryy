import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:carmel_bakeryy/data/remote_data_sources/global_remote_data_source.dart';
import 'package:carmel_bakeryy/models/data/GlobalDataModel.dart';
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
    final GlobalDataModel admin =
        await _globalRemoteDataSource.getAdminInfo(user.user!);
    emit(state.copyWith(admin: admin.admin));
  }

  Future<void> checkOrCreateUserDoc() async {
    final GlobalDataModel user = await _globalRemoteDataSource.getUserID();
    await _globalRemoteDataSource.createUserDocIfDontExist(user.user!);
    await initGlobalAdmin();
  }

  Future<void> switchOpenIndicator(
    bool indicator,
  ) async {
    await _globalRemoteDataSource.updateIndicator(indicator: !indicator);
  }

  // @override
  // Future<void> close() {
  //   _streamSubscription?.cancel();
  //   return super.close();
  // }
}
