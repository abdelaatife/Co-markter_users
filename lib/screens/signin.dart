import 'package:comarkter/screens/home.dart';
import 'package:comarkter/screens/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../const.dart';

class singin extends StatefulWidget {
  const singin({Key? key}) : super(key: key);

  @override
  _singinState createState() => _singinState();
}

class _singinState extends State<singin> {
  FirebaseAuth auth = FirebaseAuth.instance;
  var mypassword, myphone;
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();
  singin() async {
    var formdata = formstate.currentState;

    if (formdata!.validate()) {
      formdata.save();
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: myphone, password: mypassword);
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const Home()));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }
    } else {
      print('error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: AnimatedPadding(
          duration: const Duration(milliseconds: 700),
          padding: EdgeInsets.only(top: 140, left: 7, bottom: 20),
          child: Wrap(children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('CO-markter',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                        )),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        margin: const EdgeInsets.only(left: 30, right: 30),
                        child: Text('Login to your Account',
                            style: TextStyle(
                              fontSize: 19,
                            ))),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 30, right: 30, top: 10),
                  child: Form(
                    key: formstate,
                    child: Column(
                      children: [
                        /*phone input */
                        TextFormField(
                          onSaved: (val) {
                            myphone = val;
                          },
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "please add your email";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                              labelText: 'your email ',
                              labelStyle: TextStyle(
                                fontSize: 14,
                              ),
                              prefixIcon: Icon(
                                Icons.email_outlined,
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
                          height: 25,
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
                        Container(
                          margin: const EdgeInsets.only(top: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextButton(
                                style: TextButton.styleFrom(primary: primary),
                                onPressed: () {},
                                child: const Text(
                                  'forget your password ?',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        /*submit button */
                        Container(
                          margin: const EdgeInsets.only(top: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MaterialButton(
                                onPressed: () async {
                                  await singin();

                                  topb = 16;
                                },
                                child: const Text(
                                  'submit',
                                  style: TextStyle(color: light, fontSize: 17),
                                ),
                                minWidth: getScreenWidth(context) - 70,
                                height: 50,
                                color: dark,
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(9))),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("don't have accont?",
                      style: TextStyle(
                        fontSize: 17,
                      )),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => signup()));
                    },
                    child: const Text("Sign up",
                        style: TextStyle(
                          fontSize: 17,
                        )),
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
