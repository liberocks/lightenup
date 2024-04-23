// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    CanvasRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CanvasScreen(),
      );
    },
    ChoiceRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ChoiceScreen(),
      );
    },
    DoctorHomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DoctorHomeScreen(),
      );
    },
    PatientHomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PatientHomeScreen(),
      );
    },
    PatientMoodTrackerRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PatientMoodTrackerScreen(),
      );
    },
    PatientProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PatientProfileScreen(),
      );
    },
    PatientScheduleRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PatientScheduleScreen(),
      );
    },
  };
}

/// generated route for
/// [CanvasScreen]
class CanvasRoute extends PageRouteInfo<void> {
  const CanvasRoute({List<PageRouteInfo>? children})
      : super(
          CanvasRoute.name,
          initialChildren: children,
        );

  static const String name = 'CanvasRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ChoiceScreen]
class ChoiceRoute extends PageRouteInfo<void> {
  const ChoiceRoute({List<PageRouteInfo>? children})
      : super(
          ChoiceRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChoiceRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DoctorHomeScreen]
class DoctorHomeRoute extends PageRouteInfo<void> {
  const DoctorHomeRoute({List<PageRouteInfo>? children})
      : super(
          DoctorHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'DoctorHomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PatientHomeScreen]
class PatientHomeRoute extends PageRouteInfo<void> {
  const PatientHomeRoute({List<PageRouteInfo>? children})
      : super(
          PatientHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'PatientHomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PatientMoodTrackerScreen]
class PatientMoodTrackerRoute extends PageRouteInfo<void> {
  const PatientMoodTrackerRoute({List<PageRouteInfo>? children})
      : super(
          PatientMoodTrackerRoute.name,
          initialChildren: children,
        );

  static const String name = 'PatientMoodTrackerRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PatientProfileScreen]
class PatientProfileRoute extends PageRouteInfo<void> {
  const PatientProfileRoute({List<PageRouteInfo>? children})
      : super(
          PatientProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'PatientProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PatientScheduleScreen]
class PatientScheduleRoute extends PageRouteInfo<void> {
  const PatientScheduleRoute({List<PageRouteInfo>? children})
      : super(
          PatientScheduleRoute.name,
          initialChildren: children,
        );

  static const String name = 'PatientScheduleRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
