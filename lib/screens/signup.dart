import 'package:comarkter/const.dart';
import 'package:comarkter/screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class signup extends StatefulWidget {
  signup({Key? key}) : super(key: key);

  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signup> {
  var mypassword, myemail, name, country;
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();
  CollectionReference prodect = FirebaseFirestore.instance.collection('users');
  //auth firebase code sign up
  singin() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      formdata.save();

      try {
        await prodect.add({
          'name': name,
          'email': myemail,
          'country': country,
        });
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: myemail, password: mypassword);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const Home()));
    } else {
      print('error');
    }
  }
  //end auth firebase code sign up

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: AnimatedPadding(
          duration: const Duration(milliseconds: 700),
          padding: EdgeInsets.only(top: 120, left: 7, bottom: 20),
          child: Wrap(children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('CO-markter',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        )),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        margin: const EdgeInsets.only(left: 30, right: 30),
                        child: Text('your personnal inforamtion',
                            style: TextStyle(fontSize: 19, height: height))),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 30,
                    right: 30,
                  ),
                  child: Form(
                    key: formstate,
                    child: Column(
                      children: [
                        TextFormField(
                          onSaved: (val) {
                            name = val;
                          },
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "please add your name";
                            }
                            return null;
                          },
                          onTap: () {
                            setState(() {
                              pading = 38;
                              height = 3.5;
                              top = 60;
                              topsignin = 45;
                            });
                          },
                          decoration: const InputDecoration(
                              labelText: 'full name',
                              labelStyle: TextStyle(
                                fontSize: 14,
                              ),
                              prefixIcon: Icon(
                                Icons.person,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  width: 0.5,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(),
                              focusColor: blue),
                          keyboardType: TextInputType.text,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          onSaved: (val) {
                            country = val;
                          },
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "please add your country";
                            }
                            return null;
                          },
                          
                          decoration: const InputDecoration(
                              labelText: 'your city',
                              labelStyle: TextStyle(
                                fontSize: 14,
                              ),
                              prefixIcon: Icon(
                                Icons.location_city_rounded,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  width: 0.5,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(),
                              focusColor: blue),
                          keyboardType: TextInputType.text,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        /*email input */
                        TextFormField(
                          onSaved: (val) {
                            myemail = val;
                          },
                          validator: (val) {
                            if (val!.length < 10) {
                              return "phone number can't be less than 10 letter";
                            }
                            return null;
                          },
                          onTap: () {
                            setState(() {
                              pading = 38;
                              height = 3.5;
                              top = 60;
                              topsignin = 45;
                            });
                          },
                          decoration: const InputDecoration(
                              labelText: 'your email',
                              labelStyle: TextStyle(
                                fontSize: 14,
                              ),
                              prefixIcon: Icon(
                                Icons.phone,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  width: 0.5,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(),
                              focusColor: blue),
                          keyboardType: TextInputType.text,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        /*password input */
                        TextFormField(
                          onSaved: (val) {
                            mypassword = val;
                          },
                          validator: (val) {
                            if (val!.length < 5) {
                              return "password can't be less than 4 letter";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                              fillColor: Colors.white,
                              labelText: 'your password',
                              labelStyle: TextStyle(
                                fontSize: 14,
                              ),
                              prefixIcon: Icon(Icons.lock_outline_rounded),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  width: 0.5,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(),
                              focusColor: blue),
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        MaterialButton(
                          onPressed: () async {
                            await singin();
                            print(myemail);
                            print('**************************');
                            print(mypassword);
                          },
                          elevation: 1,
                          height: 50,
                          child: Container(
                            decoration: BoxDecoration(
                                color: dark,
                                borderRadius: BorderRadius.circular(8)),
                            height: 50,
                            width: 220,
                            padding: EdgeInsets.only(top: 15),
                            child: Text(
                              'Submit',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "you already have account ?",
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Signin"))
                    ],
                  ),
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
