// ignore_for_file: curly_braces_in_flow_control_structures
import 'package:flutter/foundation.dart';

import 'package:estote_parati/src/models/models.dart';
import 'package:estote_parati/src/repositories/repositories.dart';

class ActivityProvider with ChangeNotifier {
  final ActivityRepository _activityRepository = ActivityRepository();
  bool _loaded = false;
  List<Activity>? _activities;

  ActivityProvider(){
    init();
  }

  List<Activity> get activities => _activities ?? [];
  bool get loaded => _loaded;

  Future<void> init() async {
    _activities = await _activityRepository.getActivity();
    if(_activities == null) return;
    _loaded = true;
    notifyListeners();
  }
}