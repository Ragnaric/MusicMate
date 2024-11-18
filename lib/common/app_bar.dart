import 'package:flutter/material.dart';
import 'package:music_mate/utils/utils.dart';

class CAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? subtitle;

  const CAppBar({
    super.key,
    required this.title,
    this.subtitle
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          ScreenUtils.openDrawer(context);
        },
        icon: const Icon(
          Icons.menu
        ),
      ),
      title: Text(title),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

}