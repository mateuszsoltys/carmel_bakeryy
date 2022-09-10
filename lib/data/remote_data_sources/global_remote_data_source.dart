import 'package:carmel_bakeryy/models/data/GlobalDataModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GlobalRemoteDataSource {
//  one time read
  // Future<GlobalDataModel> getGlobalState() async {
  //   final globalState = await FirebaseFirestore.instance
  //       .collection('global')
  //       .doc('states')
  //       .get();
  //   return GlobalDataModel(admin: null, open: globalState['indicator']);
  // }

  Stream<GlobalDataModel> getGlobalStateStream() {
    return FirebaseFirestore.instance
        .collection('global')
        .doc('states')
        .snapshots()
        .map((documentSnapshot) {
      return GlobalDataModel(
          open: documentSnapshot.get('indicator'), admin: null);
    });
  }
}
