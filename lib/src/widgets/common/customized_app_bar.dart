// ignore_for_file: unnecessary_this
import 'package:flutter/material.dart';

import 'package:estote_parati/src/utils/utils.dart';

class CustomizedAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final BuildContext context;

  const CustomizedAppBar({
    required this.title,
    required this.context,
    super.key
  });

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      backgroundColor: scoutColor,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back_ios_new_outlined, color: Colors.white),
      ),
      title: Text(this.title, style: subtitleStyle),
    );
  }

  @override
  Size get preferredSize => MediaQuery.of(context).size * 0.06;
}
