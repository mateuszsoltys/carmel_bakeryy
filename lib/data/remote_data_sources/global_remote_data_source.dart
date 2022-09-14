import 'package:carmel_bakeryy/models/data/GlobalDataModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GlobalRemoteDataSource {
  final model =
      GlobalDataModel(open: null, admin1: null, admin2: null, user: null);
  Stream<GlobalDataModel> getGlobalStateStream() {
    return FirebaseFirestore.instance
        .collection('global')
        .doc('states')
        .snapshots()
        .map((documentSnapshot) {
      return model.copyWith(open: documentSnapshot.get('indicator'));
    });
  }

  Future<GlobalDataModel> getUserID() async {
    String? userID = FirebaseAuth.instance.currentUser?.uid;
    return model.copyWith(user: userID);
  }

  Future<GlobalDataModel> getAdminID() async {
    final admin = await FirebaseFirestore.instance
        .collection('global')
        .doc('states')
        .get();
    return model.copyWith(admin1: admin['admin1'], admin2: admin['admin2']);
  }

  Future<void> updateIndicator({required bool indicator}) async {
    await FirebaseFirestore.instance
        .collection('global')
        .doc('states')
        .update({'indicator': indicator});
  }
}
