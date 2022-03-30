import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comarkter/const.dart';
import 'package:comarkter/screens/home.dart';
import 'package:flutter/material.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  late final String documentId;

  CollectionReference users = FirebaseFirestore.instance.collection('users');
  Future getData() async {
    users.doc(documentId).get();
  }

  CollectionReference prodect = FirebaseFirestore.instance.collection('offers');
  getoffer() async {
    listeoffer = [];
    var responsebody = await prodect.get();
    responsebody.docs.forEach((element) {
      setState(() {
        listeoffer.add(element.data());
      });
    });
  }

  @override
  void initState() {
    getoffer();
    super.initState();
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
          print(listeoffer);
        }),
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
    );
  }
}
