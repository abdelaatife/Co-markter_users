import 'package:comarkter/const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  _profileState createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  child: Icon(
                    LineIcons.user,
                    size: 40,
                  ),
                  maxRadius: 45,
                )
              ],
            ),
            SizedBox(
              height: 18,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('user Name')],
            ),
            SizedBox(
              height: 18,
            ),
            Divider(),
            ListTile(
              trailing: const Icon(Icons.payment),
              title: const Text('payment'),
            ),
            ListTile(
              onTap: () {},
              trailing: const Icon(Icons.settings),
              title: const Text('settings'),
            ),
            ListTile(
              onTap: () {},
              trailing: const Icon(Icons.info),
              title: const Text('more info'),
            ),
            ListTile(
              onTap: () {},
              trailing: const Icon(Icons.contact_support),
              title: const Text('contact support'),
            ),
            const SizedBox(
              height: 40,
            ),
            const Divider(),
            ListTile(
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                
              },
              trailing: Icon(Icons.logout),
              title: Text('logout'),
            ),
            const SizedBox(
              height: 60,
            ),
          ],
        ),
      ),
    );
  }
}
