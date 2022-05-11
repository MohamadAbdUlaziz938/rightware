import 'package:flutter/material.dart';

MaterialPageRoute? buildRoute(RouteSettings settings) {
  switch (settings.name) {
  }
}

class NoTransitionMaterialRoute extends MaterialPageRoute {
  NoTransitionMaterialRoute({
    @required builder,
    RouteSettings? settings,
    maintainState = true,
    bool fullscreenDialog = false,
  }) : super(
            builder: builder,
            settings: settings,
            maintainState: maintainState,
            fullscreenDialog: fullscreenDialog);

  @override
  Duration get transitionDuration => const Duration(milliseconds: 10);
}
