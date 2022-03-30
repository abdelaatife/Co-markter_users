import 'package:flutter/material.dart';

const Color light = Color(0xFFF1FAEE);
const Color dark = Color(0xFF1D3557);
const Color primary = Color(0xFF457B9D);
const Color red = Color(0xFF14213d);
const Color blue = Color(0xFFA8DADC);
const Color yellow = Color(0xFFfca311);



double getScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double getScreenheight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double top = 24;
double height = 3.5;
double topb = 36;
double pading = 90;
double topsignin = 24;
// image picker

final textname = new TextEditingController();
final textdescrption = new TextEditingController();
final textnumber = new TextEditingController();
//end image picker

//sign up page
Color lestcolor = dark;
var iconindex = 1;
List<IconData> icon = [Icons.done_rounded, Icons.navigate_next_outlined];
int pageindex = 0;
String textbutton = 'Next';
List listeoffer = [];