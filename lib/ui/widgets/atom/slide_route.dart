// ignore_for_file: must_be_immutable

import 'package:auto_route/auto_route.dart';

class SlideRoute extends CustomRoute {
  SlideRoute({
    /// The path of the route.
    required String super.path,

    /// The page information of the route.
    required PageInfo<void> super.page,

    /// The transition effect of the route
    super.transitionsBuilder = TransitionsBuilders.slideLeft,

    /// The list of child routes.
    super.children,

    /// Whether this route is the initial route.
    super.initial = false,
    super.guards,
    super.meta,
  }) : super(
          durationInMilliseconds: 200,
          reverseDurationInMilliseconds: 200,
        );
  late TransitionsBuilders? transitionsBuilder;
}
