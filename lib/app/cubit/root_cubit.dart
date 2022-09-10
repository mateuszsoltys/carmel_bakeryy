import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:carmel_bakeryy/data/remote_data_sources/global_remote_data_source.dart';
import 'package:carmel_bakeryy/models/data/GlobalDataModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'root_state.dart';

class RootCubit extends Cubit<RootState> {
  RootCubit(this._globalRemoteDataSource)
      : super(RootState(open: null, admin: false));

  final GlobalRemoteDataSource _globalRemoteDataSource;
  StreamSubscription? _streamSubscription;

  Future<void> initGlobalSteram() async {
    _streamSubscription =
        _globalRemoteDataSource.getGlobalStateStream().listen((state) {
      emit(RootState(open: state.open, admin: state.admin));
    });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
