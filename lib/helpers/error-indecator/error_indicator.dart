import 'package:flutter/material.dart';

import 'package:rightware/helpers/http/backend-error.dart';
import 'package:rightware/utils/text.dart';


import 'base_indicator.dart';

class ErrorIndicator extends StatelessWidget {
  const ErrorIndicator({
    required this.error,
    required this.onTryAgain,
    this.compact = false,
    Key? key,
  })  : super(key: key);
  final BackendError error;
  final VoidCallback onTryAgain;
  final bool compact;
  @override
  Widget build(BuildContext context) {
    if (error.noInternet) {
      return BaseIndicator(
        title: 'No connection',
        message: 'Please check internet connection and try again.',
        assetPath: 'assets/icons/no-connection.svg',
        onTryAgain: onTryAgain,
        compact: compact,
      );
    } else {
      return BaseIndicator(
        title: trans('Something went wrong'),
        message: error.message,
        assetPath: 'assets/icons/warning-cyit.svg',
        onTryAgain: onTryAgain,
        compact: compact,
      );
    }
  }
}
