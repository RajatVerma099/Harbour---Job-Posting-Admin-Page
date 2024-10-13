import 'package:flutter/material.dart';

void goTo(Widget nextPage, BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>nextPage));
}

void goBack(BuildContext context) {
  Navigator.of(context).pop();
}

void jumpTo(Widget nextPage, BuildContext context) {
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>nextPage));
}