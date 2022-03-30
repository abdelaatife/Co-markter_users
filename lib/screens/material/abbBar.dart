import 'package:backdrop/backdrop.dart';
import 'package:badges/badges.dart';
import 'package:comarkter/screens/homeScreens/homePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '../../const.dart';

class backdop extends StatelessWidget {
  const backdop({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropScaffold(
      backLayerBackgroundColor: red,
      appBar: BackdropAppBar(
        automaticallyImplyLeading: false,
        leading: const BackdropToggleButton(
          icon: AnimatedIcons.close_menu,
        ),
        //notification action

        backgroundColor: red,
        actions: [
          Badge(
            position: BadgePosition.bottomStart(start: 22, bottom: 20),
            //badge notifcation

            badgeContent: const Text(
              '9',
              style: TextStyle(color: Colors.red),
            ),
            badgeColor: Colors.white,

            child: IconButton(
                onPressed: () {
                  //notification action
                },
                icon: const Icon(
                  LineIcons.bell,
                  size: 30,
                  color: yellow,
                )),
          ),
        ],
      ),
      backLayer: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            child: const Text(
              'Drawer Header',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.messenger_outline_rounded,
              color: light,
            ),
            title: Text(
              
              'Messages',
              style: TextStyle(color: Colors.white),
            ),
          ),
          ListTile(
            leading: Icon(
              LineIcons.user,
              color: light,
            ),
            title: Text(
              'Profile',
              style: TextStyle(color: Colors.white),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.settings_sharp,
              color: light,
            ),
            title: Text(
              'Settings',
              style: TextStyle(color: Colors.white),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.help_outline_rounded,
              color: light,
            ),
            title: Text(
              'support',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      //front layer
      frontLayer: homepage(),
    );
  }
}
