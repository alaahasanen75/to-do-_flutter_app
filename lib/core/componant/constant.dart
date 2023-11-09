import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/shard.dart';
import 'package:flutter_application_1/presentation/Layout_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';

const defaulltColor = Colors.deepOrange;

void ShowToast({required String? msg, required ToastStates? states}) {
  Fluttertoast.showToast(
      msg: msg!,
      //  state.model!.masage!,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: ChooseToastColor(states!),
      textColor: Colors.black,
      fontSize: 16.0);
}

enum ToastStates { SUCCESS, ERROR, WARNING }

Color? ChooseToastColor(ToastStates states) {
  Color color;

  switch (states) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}

const REGISTER = 'register';
const LOGIN = 'login';
String? token = '';
