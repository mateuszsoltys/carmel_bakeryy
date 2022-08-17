import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:carmel_bakeryy/data/remote_data_sources/other_remote_data_source.dart';
import 'package:carmel_bakeryy/models/data/OfferDataModel.dart';
import 'package:meta/meta.dart';

part 'page_other_state.dart';

class PageOtherCubit extends Cubit<PageOtherState> {
  PageOtherCubit(this._otherRemoteDataSource)
      : super(PageOtherState(dataOther: []));

  final OtherRemoteDataSource _otherRemoteDataSource;
  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    _streamSubscription =
        _otherRemoteDataSource.getOtherOfferStream().listen((dataOther) {
      emit(PageOtherState(dataOther: dataOther));
    });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
