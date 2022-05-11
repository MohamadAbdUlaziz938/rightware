import 'package:flutter/material.dart';

import 'root-navigator-key.dart';

Text text(String message, {
  BuildContext? context,
  bool singleLine = true,
  Color? color,
  bool capitalize = false,
  bool uppercase = false,
  bool translate = true,
  double? size,
  FontWeight? weight,
  double? height,
  TextStyle? style,
  TextAlign? align,
  Map<String, String>? replacements,
}) {
  context ??= rootNavigatorKey.currentContext;
  if (translate) {
    // message = trans(message, context: context!, replacements: replacements!);
  }

  if (capitalize) {
    message = message.capitalize();
  }

  if (uppercase) {
    message = message.toUpperCase();
  }

  return Text(
    message,
    softWrap: !singleLine,
    overflow: TextOverflow.fade,
    textAlign: align,
    style: style ?? TextStyle(
      color: color,
      fontSize: size,
      fontWeight: weight,
      height: height,
    ),
  );
}

String trans(String message, {BuildContext? context,  Map<String, String>? replacements}) {
  context ??= rootNavigatorKey.currentContext!;
  //message = BackendLocalizations.of(context).trans(message);
  // message = _replacePlaceHolders(message, replacements);
  return message;
}

String _replacePlaceHolders(String message, Map<String, String> replacements) {
  if (replacements != null) {
    for (var entry in replacements.entries) {
      message = message.replaceAll(RegExp(':${entry.key}'), entry.value);
    }
  }
  return message;
}
extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}