import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_api_bloc/app/core/contants/fonts.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.blueGrey.shade300,
      child: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const DrawerHeader(
            child: Icon(
              Icons.favorite,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: ListTile(
              leading: const Icon(Icons.home),
              title: Text(
                "Home",
                style: CustomizeFonts.subtittleBlack,
              ),
              onTap: () {
                context.router.maybePop();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: ListTile(
              leading: const Icon(
                Icons.person,
              ),
              title: Text(
                "Profile",
                style: CustomizeFonts.subtittleBlack,
              ),
              onTap: () {
                context.router.maybePop();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: ListTile(
              leading: const Icon(
                Icons.group,
              ),
              title: Text(
                "Users",
                style: CustomizeFonts.subtittleBlack,
              ),
              onTap: () {
                context.router.maybePop();
              },
            ),
          ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, bottom: 25),
            child: ListTile(
              leading: const Icon(
                Icons.logout,
              ),
              title: Text(
                "Logout",
                style: CustomizeFonts.subtittleBlack,
              ),
              onTap: () {
                context.router.maybePop();
              },
            ),
          ),
        ],
      ),
    );
  }
}
