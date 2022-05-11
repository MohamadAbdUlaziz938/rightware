import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'base_indicator.dart';

class NoResultsIndicator extends StatelessWidget {
  NoResultsIndicator(
      {required this.noResultTitle,
      this.noResultMessage,
       this.iconPath});
  final String noResultTitle;
  final String? noResultMessage;
  final String? iconPath;

  @override
  Widget build(BuildContext context) {
    return BaseIndicator(
      title: noResultTitle,
      message: noResultMessage,
      assetPath: iconPath,
    );
  }
}
