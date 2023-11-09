import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/core/fonts_manager.dart';

TextStyle _getTextStyle(
  double fontSize,
  Color color,
  FontWeight fontWeight,
  TextOverflow? textOverflow,
) {
  return TextStyle(
    overflow: textOverflow,
    // fontFamily: FontsConstans.fonntFamily,
    fontSize: fontSize,
    color: color,
  );
}

TextStyle getRegularStyle(
    {double fontSize = FontSize.s12,
    TextOverflow? textOverflow,
    required Color color,
    FontWeight = FontWightManager.regular}) {
  return _getTextStyle(fontSize, color, FontWeight, textOverflow);
}

TextStyle getMediumStyle(
    {double fontSize = FontSize.s12,
    TextOverflow? textOverflow,
    required Color color,
    FontWeight = FontWightManager.medium}) {
  return _getTextStyle(fontSize, color, FontWeight, textOverflow);
}

TextStyle getBoldStyle(
    {double fontSize = FontSize.s20,
    TextOverflow? textOverflow,
    required Color color,
    FontWeight = FontWightManager.bold}) {
  return _getTextStyle(fontSize, color, FontWeight, textOverflow);
}

TextStyle getLightStyle(TextOverflow? textOverflow,
    {double fontSize = FontSize.s12,
    required Color color,
    FontWeight = FontWightManager.light}) {
  return _getTextStyle(fontSize, color, FontWeight, textOverflow);
}
