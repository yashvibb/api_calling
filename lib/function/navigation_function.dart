import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

nextScreen(BuildContext context, Widget page) async {
  await Navigator.push(context, CupertinoPageRoute(builder: (context) => page));
}
