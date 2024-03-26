import 'package:cloud_firestore/cloud_firestore.dart';

class GroupPlan {
  final String id;
  final Timestamp createdAt;
  final List<WorkArea> workAreas;

  const GroupPlan({
    required this.id,
    required this.createdAt,
    required this.workAreas,
  });

  factory GroupPlan.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final Map<String, dynamic>? data = document.data();

    final List<String> workAreasStrings = List<String>.from(data?['workAreas'] ?? []);
    final List<WorkArea> workAreas = workAreasStrings.map((String areaString) {
      return WorkArea.values.firstWhere((element) => element.toString().split('.').last == areaString, orElse: () => WorkArea.groupValues);
    }).toList();

    return GroupPlan(
      id: document.id,
      createdAt: data?['createdAt'],
      workAreas: workAreas,
    );
  }
}

enum WorkArea{
  groupValues,
  youthProgram,
  financialResources,
  management,
  adultsOnMove
}