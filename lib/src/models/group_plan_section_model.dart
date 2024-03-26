import 'package:cloud_firestore/cloud_firestore.dart';

class GroupPlanSection {
  final String diagnosis;
  final List<String> strategicObjective;
  final List<String> actions;
  final Timestamp concretionTime;
  final String responsible;
  final List<String> sections = ['diagnosis', 'strategicObjective', 'actions', 'concretionTime', 'responsible'];

  GroupPlanSection({
    required this.diagnosis,
    required this.strategicObjective,
    required this.actions,
    required this.concretionTime,
    required this.responsible,
  });

  factory GroupPlanSection.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final Map<String, dynamic>? data = document.data();

    return GroupPlanSection(
      diagnosis: data?['diagnosis'],
      strategicObjective: List<String>.from(data?['strategicObjective'] ?? []),
      actions: List<String>.from(data?['actions'] ?? []),
      concretionTime: data?['concretionTime'],
      responsible: data?['responsible'],
    );
  }
}