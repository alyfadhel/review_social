import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:social_app/core/resources/color_manager.dart';

void showToast ({
  required String text,
  required ToastState state,
}) => Fluttertoast.showToast(
  msg: text,
  toastLength: Toast.LENGTH_LONG,
  gravity: ToastGravity.BOTTOM,
  timeInSecForIosWeb: 5,
  backgroundColor: chooseToastColor(state),
  textColor: ColorManager.sWhite,
  fontSize: 16.0,
);

enum ToastState{success,error,warning}

Color chooseToastColor(ToastState state)
{
  Color color;
  switch(state)
  {
    case ToastState.success:
      color = ColorManager.green;
      break;
    case ToastState.error:
      color = ColorManager.red;
      break;
    case ToastState.warning:
      color = ColorManager.amber;
      break;
  }
  return color;
}