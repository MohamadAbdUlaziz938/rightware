import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rightware/utils/text.dart';

class BaseIndicator extends StatelessWidget {
  BaseIndicator({
    required this.title,
    this.assetPath,
    this.message,
    this.onTryAgain,
    this.compact = false,
    Key? key,
  }) : super(key: key);
  final String title;
  final String? message;
  final String? assetPath;
  final VoidCallback? onTryAgain;
  final bool compact;

  Widget _icon(BuildContext context) {
    if (assetPath!.endsWith('svg')) {
      return ConstrainedBox(
          constraints: BoxConstraints(minHeight: 100, maxHeight: 100),
          child: SvgPicture.asset(
            assetPath!,
            height: 100.h,
            color: Theme.of(context).accentColor,
          ));
      return SvgPicture.asset(
        assetPath!,
        width: 200,
        height: 200,
        color: Theme.of(context).accentColor,
      );
      // return Image(image: AssetImage(assetPath), width: 74, height: 74);
    } else {
      return ConstrainedBox(
          constraints: BoxConstraints(minHeight: 100, maxHeight: 100),
          child: Image(
            image: AssetImage(assetPath!),
            height: 100.h,
            color: Theme.of(context).appBarTheme.color,
          ));
    }
  }

  Text _title(BuildContext context) {
    return text(title, color: Colors.grey);
  }

  Text _subtitle(BuildContext context) {
    return text(
      message!,
      singleLine: false,
      align: TextAlign.center,
    );
  }

  Widget _largeTryAgainButton(BuildContext context) {
    return SizedBox(
      height: 45,
      width: 150.w,
      child: RaisedButton.icon(
        onPressed: onTryAgain,
        color: Theme.of(context).appBarTheme.color,
        icon: const Icon(
          Icons.refresh,
        ),
        label: text('Try Again', size: 16),
      ),
    );
  }

  Widget _smallTryAgainButton() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        text(
          message ?? title,
          align: TextAlign.center,
        ),
        onTryAgain != null
            ? IconButton(icon: Icon(Icons.refresh), onPressed: onTryAgain)
            : Container(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (compact) {
      return _smallTryAgainButton();
    } else {
      final children = <Widget>[];
      assetPath != null ? children.add(_icon(context)) : null;
      children.add(SizedBox(height: 32));
      children.add(_title(context));
      if (message != null) {
        children.add(SizedBox(height: 10));
        children.add(_subtitle(context));
      }
      if (onTryAgain != null) {
        children.add(SizedBox(height: 10.h));
        //children.add(Spacer());
        children.add(_largeTryAgainButton(context));
      }
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // mainAxisSize: MainAxisSize.min,
        children: children,
      );
    }
  }
}
