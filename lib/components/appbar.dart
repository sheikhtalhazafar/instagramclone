import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  // final List<PopupMenuEntry<String>> menuItems;
  // final ValueChanged<String> onMenuItemSelected;
  final IconData icon;

  CustomAppBar({
    required this.title,
    // required this.menuItems,
    // required this.onMenuItemSelected,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Builder(
        builder: (context) => IconButton(
          icon: const Icon(Icons.menu, size: 30),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      ),
      title: Center(child: Text(title)),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Icon(icon, size: 30),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
