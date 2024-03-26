// ignore_for_file: curly_braces_in_flow_control_structures
import 'package:flutter/foundation.dart';

import 'package:estote_parati/src/models/models.dart';
import 'package:estote_parati/src/repositories/repositories.dart';

class EventProvider with ChangeNotifier {
  final EventRepository _eventRepository = EventRepository();
  bool _loaded = false;
  List<Event>? _events;

  List<Event> get events => _events ?? [];
  bool get loaded => _loaded;

  Future<void> init() async {
    _events = await _eventRepository.getEvent();
    if(_events == null) return;
    _loaded = true;
    notifyListeners();
  }

  Future<void> addEvent(Event event) => _eventRepository.addEvent(event);

  Event? getNextEvent(){
    _events?.sort((a, b) => a.from.compareTo(b.from));
    return _events?.firstWhere((e) => DateTime.now().isBefore(e.from.toDate()) && e.branch == TargetBranch.group);
  }
}