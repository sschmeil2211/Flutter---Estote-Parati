import 'package:estote_parati/src/utils/utils.dart';
import 'package:flutter/material.dart';

import 'package:estote_parati/src/models/models.dart';

Color darkenColor(Color color, {double factor = 0.1}) {
  assert(factor >= 0 && factor <= 1);
  final hslColor = HSLColor.fromColor(color);
  final darkerColor = hslColor.withLightness((hslColor.lightness - factor).clamp(0.0, 1.0));
  return darkerColor.toColor();
}

Color getBranchColor(TargetBranch targetBranch){
  switch(targetBranch){
    case TargetBranch.manada:
      return const Color(0xFFF2C832);
    case TargetBranch.unidad:
      return const Color(0xFF34A259);
    case TargetBranch.caminantes:
      return const Color(0xFF2D6FBF);
    case TargetBranch.rover:
      return const Color(0xFFC10E1A);
    case TargetBranch.group:
      return groupColor;
  }
}

Color getSectionColor(WorkArea workArea){
  switch(workArea){
    case WorkArea.groupValues:
      return const Color(0xFFFFE599);
    case WorkArea.youthProgram:
      return const Color(0xFFB6D7A8);
    case WorkArea.financialResources:
      return const Color(0xFFA2C4C9);
    case WorkArea.management:
      return const Color(0xFFB4A7D6);
    case WorkArea.adultsOnMove:
      return const Color(0xFFD5A6BD);
  }
}