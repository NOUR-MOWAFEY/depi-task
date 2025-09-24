import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar({
  required BuildContext context,
  Object? exception,
  required Color color,
}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(exception.toString()), backgroundColor: color),
  );
}
