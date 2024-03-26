import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:estote_parati/src/models/group_plan_model.dart';

class GroupPlanRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<GroupPlan>> getGroupPlans() async {
    final QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore
        .collection('groupPlans')
        .get();
    return snapshot.docs.map((DocumentSnapshot<Map<String, dynamic>> doc) => GroupPlan.fromSnapshot(doc)).toList();
  }
}