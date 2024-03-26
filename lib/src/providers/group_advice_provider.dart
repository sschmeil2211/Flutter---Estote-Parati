// ignore_for_file: curly_braces_in_flow_control_structures
import 'package:flutter/foundation.dart';

import 'package:estote_parati/src/models/models.dart';
import 'package:estote_parati/src/repositories/repositories.dart';

class GroupAdviceProvider with ChangeNotifier {
  final GroupAdviceRepository _groupAdviceRepository = GroupAdviceRepository();
  bool _loaded = false;
  List<GroupAdvice>? _groupAdvices;
  GroupAdvice? _nextAdvice;

  List<GroupAdvice> get groupAdvices => _groupAdvices ?? [];
  GroupAdvice? get nextAdvice => _nextAdvice;
  bool get loaded => _loaded;

  Future<void> init() async {
    _groupAdvices = await _groupAdviceRepository.getGroupAdvice();
    final advicesWithNonEmptyTopics = _groupAdvices!.where((advice) => advice.topics.values.any((value) => value.isNotEmpty)).toList();
    _nextAdvice = _groupAdvices!.firstWhere((advice) => advice.topics.values.every((value) => value.isEmpty));
    if (_nextAdvice != null)
      advicesWithNonEmptyTopics.removeWhere((advice) => advice.id == _nextAdvice!.id);
    _groupAdvices = advicesWithNonEmptyTopics;
    _loaded = true;
    notifyListeners();
  }
}