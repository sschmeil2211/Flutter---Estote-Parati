import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:estote_parati/src/utils/utils.dart';

class Activity{
  final String id;
  final String name;
  final String definition;
  final List<String> objectives;
  final List<String> materials;
  final String development;
  final ActivityType activityType;
  final DurationType durationType;
  final TargetBranch targetBranch;

  const Activity({
    required this.id,
    required this.name,
    required this.definition,
    required this.objectives,
    required this.materials,
    required this.development,
    required this.activityType,
    required this.durationType,
    required this.targetBranch,
  });

  factory Activity.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final Map<String, dynamic>? data = document.data();

    return Activity(
      id: document.id,
      name: data?['name'],
      definition: data?['definition'],
      objectives: List<String>.from(data?['objectives'] ?? []),
      materials: List<String>.from(data?['materials'] ?? []),
      development: data?['development'],
      activityType: parseActivityType(data?['activityType']),
      durationType: parseDurationType(data?['durationType']),
      targetBranch: parseTargetBranch(data?['targetBranch']),
    );
  }
}

enum ActivityType{
  integration
}

enum DurationType{
  short,
  long
}

enum TargetBranch{
  manada,
  unidad,
  caminantes,
  rover,
  group
}