// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:estote_parati/src/models/models.dart';

class EventRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Event>> getEvent() async {
    final QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore
        .collection('events')
        .get();
    return snapshot.docs.map((DocumentSnapshot<Map<String, dynamic>> doc) => Event.fromSnapshot(doc)).toList();
  }

  Future<void> addEvent(Event event) async {
    try {
      await _firestore.collection('events').add(event.toJson());
    } catch (error) {
      rethrow;
    }
  }
}