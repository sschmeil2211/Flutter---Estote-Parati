import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:estote_parati/src/models/models.dart';

class GroupAdviceRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<GroupAdvice>> getGroupAdvice() async {
    final QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore
        .collection('groupAdvices')
        .get();
    return snapshot.docs.map((DocumentSnapshot<Map<String, dynamic>> doc) => GroupAdvice.fromSnapshot(doc)).toList();
  }
}