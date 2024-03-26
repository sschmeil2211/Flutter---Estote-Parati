// ignore_for_file: curly_braces_in_flow_control_structures
import 'package:flutter/foundation.dart';

import 'package:estote_parati/src/models/models.dart';
import 'package:estote_parati/src/repositories/repositories.dart';

class GroupPlanProvider with ChangeNotifier {
  final GroupPlanRepository _groupPlanRepository = GroupPlanRepository();
  bool _loaded = false;
  List<GroupPlan>? _groupPlans;

  List<GroupPlan> get groupPlans => _groupPlans ?? [];
  bool get loaded => _loaded;

  Future<void> init() async {
    _groupPlans = await _groupPlanRepository.getGroupPlans();
    if(_groupPlans == null) return;
    _loaded = true;
    notifyListeners();
  }
}