import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:estote_parati/src/models/models.dart';

class GroupPlanSectionRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<GroupPlanSection>> getGroupPlanSections(String groupPlanId, String workArea) async {
    final QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore
        .collection('groupPlans')
        .doc(groupPlanId)
        .collection(workArea)
        .get();
    return snapshot.docs.map((doc) => GroupPlanSection.fromSnapshot(doc)).toList();
  }
}