import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comarkter/const.dart';
import 'package:comarkter/screens/home.dart';
import 'package:flutter/material.dart';

class offers extends StatefulWidget {
  const offers({Key? key}) : super(key: key);

  @override
  _offersState createState() => _offersState();
}

class _offersState extends State<offers> {
  late final String documentId;

  CollectionReference users = FirebaseFirestore.instance.collection('users');
  Future getData() async {
    users.doc(documentId).get();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 9, horizontal: 15),
      child: RefreshIndicator(
        color: dark,
        displacement: 30,
        onRefresh: (() async {
          initState();
        }),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 14),
          child: ListView.builder(
            itemCount: listeoffer.length,
            itemBuilder: ((context, index) {
              return InkWell(
                //ondoubletap
                onLongPress: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Container(
                            margin: const EdgeInsets.only(left: 12),
                            child: const Text("More actions :"),
                          ),
                          content: Container(
                            height: getScreenheight(context) / 4,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ListTile(
                                  onTap: () {},
                                  leading: const Icon(Icons.edit),
                                  title: const Text("edit"),
                                ),
                                ListTile(
                                  onTap: () {},
                                  leading: const Icon(Icons.add),
                                  title: const Text("shaw detail"),
                                ),
                                ListTile(
                                  onTap: () {},
                                  iconColor: red,
                                  leading: const Icon(Icons.delete_outline),
                                  title: const Text(
                                    "Delete",
                                    style: TextStyle(color: red),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                },
                splashColor: Colors.grey,
                highlightColor: Colors.black12,
                borderRadius: BorderRadius.circular(10),

                child: Container(
                  height: 80,
                  margin: EdgeInsets.symmetric(
                      horizontal: getScreenWidth(context) / 20, vertical: 7),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: .25,
                        color: blue,
                        blurStyle: BlurStyle.outer,
                      ),
                    ],
                  ),
                  child: ListTile(
                    focusColor: red,
                    hoverColor: red,
                    title: Text('${listeoffer[index]['offername']} '),
                    subtitle: Text('${listeoffer[index]['discrption']}'),
                    leading: Text('${listeoffer[index]['prix']}DA'),
                    trailing: Text('${listeoffer[index]['date ']}'),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
