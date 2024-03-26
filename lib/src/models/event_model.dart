// ignore_for_file: unnecessary_this

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:estote_parati/src/models/models.dart';
import 'package:estote_parati/src/utils/functions/objects_formatters.dart';

class Event{
  final String name;
  final Timestamp from;
  final Timestamp to;
  final TargetBranch branch;
  final bool isAllDay;
  final EventType eventType;

  const Event({
    required this.name,
    required this.from,
    required this.to,
    required this.branch,
    required this.isAllDay,
    required this.eventType,
  });

  factory Event.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final Map<String, dynamic>? data = document.data();

    return Event(
      name: data?['name'],
      from: data?['from'],
      to: data?['to'],
      branch: parseTargetBranch(data?['branch']),
      isAllDay: data?['isAllDay'],
      eventType: parseEventType(data?['eventType'])
    );
  }

  Map<String, dynamic> toJson() => {
    'name': this.name,
    'from': this.from,
    'to': this.to,
    'branch': this.branch.name,
    'isAllDay': this.isAllDay,
    'eventType': this.eventType.name,
  };
}

enum EventType{
  groupActivity,
  planning,
  advice,
  groupEvent,
  course,
  collection,
  branchActivity
}