import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:estote_parati/src/models/models.dart';

class ActivityRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Activity>> getActivity() async {
    final QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore
        .collection('activities')
        .get();
    return snapshot.docs.map((DocumentSnapshot<Map<String, dynamic>> doc) => Activity.fromSnapshot(doc)).toList();
  }
}