import 'package:cloud_firestore/cloud_firestore.dart';

class GroupAdvice{
  final String id;
  final Timestamp date;
  final Map<String, String> topics;

  const GroupAdvice({
    required this.id,
    required this.date,
    required this.topics,
  });

  factory GroupAdvice.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final Map<String, dynamic>? data = document.data();

    return GroupAdvice(
      id: document.id,
      date: data?['date'],
      topics: Map<String, String>.from(data?['topics'])
    );
  }
}