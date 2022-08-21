import 'package:bloc/bloc.dart';
import 'package:carmel_bakeryy/data/remote_data_sources/other_remote_data_source.dart';
import 'package:carmel_bakeryy/models/data/OfferDetailsDataModel.dart';
import 'package:meta/meta.dart';

part 'other_details_state.dart';

class OtherDetailsCubit extends Cubit<OtherDetailsState> {
  OtherDetailsCubit(this._otherRemoteDataSource)
      : super(OtherDetailsState(detailsState: null));

  final OtherRemoteDataSource _otherRemoteDataSource;

  Future<void> getDetailsWithID(String id) async {
    final details = await _otherRemoteDataSource.getDetails(id: id);
    emit(OtherDetailsState(detailsState: details));
  }
}
