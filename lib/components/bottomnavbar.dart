import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagramclone/riverpod/bottomriverpod.dart';

Consumer bottomnavbar() {
  return Consumer(builder: (context, ref, child) {
    final selectedindex = ref.watch(bottomindexprovider);
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: selectedindex,
      onTap: (index) {
        ref.read(bottomindexprovider.notifier).state = index;
      },
      items: const [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30,
            ),
            label: ''),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: 30,
            ),
            label: ''),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.add_box_rounded,
              size: 30,
            ),
            label: ''),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.message,
              size: 30,
            ),
            label: ''),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 30,
            ),
            label: ''),
      ],
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
    );
  });
}
