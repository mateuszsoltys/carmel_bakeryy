import 'package:carmel_bakeryy/models/data/GlobalDataModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GlobalRemoteDataSource {
  final model = GlobalDataModel(open: null, admin: null, user: null);

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

  Future<void> createUserDocIfDontExist(String id) async {
    final firestore = FirebaseFirestore.instance;
    const bool userAdmin = false;
    const int userPoints = 0;

    final userDoc = await firestore.collection('users').doc(id).get();

    if (!userDoc.exists) {
      await firestore
          .collection('users')
          .doc(id)
          .set({'admin': userAdmin, 'points': userPoints});
    }
  }

  Future<GlobalDataModel> getAdminInfo(String id) async {
    final admin =
        await FirebaseFirestore.instance.collection('users').doc(id).get();
    return model.copyWith(admin: admin['admin']);
  }

  Future<void> updateIndicator({required bool indicator}) async {
    await FirebaseFirestore.instance
        .collection('global')
        .doc('states')
        .update({'indicator': indicator});
  }
}
