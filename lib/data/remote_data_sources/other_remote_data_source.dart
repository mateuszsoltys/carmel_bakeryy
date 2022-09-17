import 'package:carmel_bakeryy/models/data/OfferDataModel.dart';
import 'package:carmel_bakeryy/models/data/OfferDetailsDataModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OtherRemoteDataSource {
  Stream<List<OfferDataModel>> getOtherOfferStream() {
    return FirebaseFirestore.instance
        .collection('offer')
        .doc('menu')
        .collection('other')
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map((doc) {
        return OfferDataModel(
            Av_URL: doc['Av_URL'],
            Availability: doc['Availability'],
            Name: doc['Name'],
            Price: doc['Price'],
            id: doc.id);
      }).toList();
    });
  }

  Future<OfferDetailsDataModel> getDetails({required String id}) async {
    final details = await FirebaseFirestore.instance
        .collection('offer')
        .doc('menu')
        .collection('other')
        .doc(id)
        .get();
    return OfferDetailsDataModel(
        Av_URL: details['Av_URL'],
        Availability: details['Availability'],
        Description: details['Description'],
        Ingredients: details['Ingredients'],
        Name: details['Name']);
  }

  // Future do zmiany stanu avalibility
  Future<void> updateAvailability(
      {required String id, required bool avability}) async {
    await FirebaseFirestore.instance
        .collection('offer')
        .doc('menu')
        .collection('other')
        .doc(id)
        .update({'Availability': avability});
  }
}
