// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:estote_parati/src/models/models.dart';
import 'package:estote_parati/src/providers/providers.dart';
import 'package:flutter/foundation.dart';

import 'package:estote_parati/src/repositories/repositories.dart';

class GroupPlanSectionProvider with ChangeNotifier {
  final GroupPlanSectionRepository _groupPlanSectionRepository = GroupPlanSectionRepository();
  Map<String, List<GroupPlanSection>>? _groupPlanSections;
  bool _loaded = false;

  Map<String, List<GroupPlanSection>> get groupPlanSections => _groupPlanSections ?? {};
  bool get loaded => _loaded;

  Future<void> setProvider(GroupPlanProvider groupPlanProvider) async {
    if(!groupPlanProvider.loaded) return;
    List<GroupPlan> plans = groupPlanProvider.groupPlans;
    _groupPlanSections = {};
    for(var plan in plans)
      for (var workArea in plan.workAreas) {
        final List<GroupPlanSection> sections = await _groupPlanSectionRepository.getGroupPlanSections(plan.id, workArea.name);
        _groupPlanSections?.putIfAbsent(workArea.name, () => []);
        _groupPlanSections?[workArea.name]!.addAll(sections);
      }
    if(_groupPlanSections?.isEmpty ?? false) return;
    _loaded = true;
    notifyListeners();
  }
}