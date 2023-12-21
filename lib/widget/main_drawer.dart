import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.drawerNavigation});
  final void Function(String) drawerNavigation;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color.fromARGB(255, 35, 7, 114).withOpacity(0.9),
                  const Color.fromARGB(255, 33, 10, 96).withOpacity(0.8)
                ],
              ),
            ),
            curve: Curves.decelerate,
            child: const Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 30,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 16,
                ),
                Text(
                  "Cooking Up",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          ListTile(
            onTap: () {
              drawerNavigation("meals");
            },
            leading: const Icon(
              Icons.restaurant,
              size: 26,
            ),
            title: const Text(
              "Meal",
              style: TextStyle(fontSize: 26),
            ),
          ),
          ListTile(
            onTap: () {
              drawerNavigation("filters");
            },
            leading: const Icon(
              Icons.settings,
              size: 26,
            ),
            title: const Text(
              "Filters",
              style: TextStyle(fontSize: 26),
            ),
          )
        ],
      ),
    );
  }
}
