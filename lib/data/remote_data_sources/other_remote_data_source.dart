import 'package:carmel_bakeryy/models/data/OfferDataModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OtherRemoteDataSource {
  Stream<List<OfferDataModel>> getOtherOfferStream() {
    return FirebaseFirestore.instance
        .collection('others')
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map((doc) {
        return OfferDataModel(
            Av_URL: doc['Av_URL'],
            Availability: doc['Availability'],
            Name: doc['Name'],
            Price: doc['Price']);
      }).toList();
    });
  }
}
