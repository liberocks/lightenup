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
    DoctorAssignmentFactOrOpinionTemplateRoute.name: (routeData) {
      final args =
          routeData.argsAs<DoctorAssignmentFactOrOpinionTemplateRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DoctorAssignmentFactOrOpinionTemplateScreen(
          assignment: args.assignment,
          key: args.key,
        ),
      );
    },
    DoctorAssignmentSocraticQuestionsTemplateRoute.name: (routeData) {
      final args = routeData
          .argsAs<DoctorAssignmentSocraticQuestionsTemplateRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DoctorAssignmentSocraticQuestionsTemplateScreen(
          assignment: args.assignment,
          key: args.key,
        ),
      );
    },
    DoctorHomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DoctorHomeScreen(),
      );
    },
    DoctorMainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DoctorMainScreen(),
      );
    },
    DoctorNewAssignmentRoute.name: (routeData) {
      final args = routeData.argsAs<DoctorNewAssignmentRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DoctorNewAssignmentScreen(
          assignment: args.assignment,
          key: args.key,
        ),
      );
    },
    DoctorPatientDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<DoctorPatientDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DoctorPatientDetailsScreen(
          assignment: args.assignment,
          key: args.key,
        ),
      );
    },
    PatientAssignmentDetailRoute.name: (routeData) {
      final args = routeData.argsAs<PatientAssignmentDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PatientAssignmentDetailScreen(
          assignment: args.assignment,
          key: args.key,
        ),
      );
    },
    PatientAssignmentFactOrOpinionRoute.name: (routeData) {
      final args = routeData.argsAs<PatientAssignmentFactOrOpinionRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PatientAssignmentFactOrOpinionScreen(
          assignment: args.assignment,
          key: args.key,
        ),
      );
    },
    PatientAssignmentListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PatientAssignmentListScreen(),
      );
    },
    PatientAssignmentSocratesQuestionsRoute.name: (routeData) {
      final args =
          routeData.argsAs<PatientAssignmentSocratesQuestionsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PatientAssignmentSocratesQuestionsScreen(
          assignment: args.assignment,
          key: args.key,
        ),
      );
    },
    PatientHomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PatientHomeScreen(),
      );
    },
    PatientMainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PatientMainScreen(),
      );
    },
    PatientMoodHistoryRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PatientMoodHistoryScreen(),
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
/// [DoctorAssignmentFactOrOpinionTemplateScreen]
class DoctorAssignmentFactOrOpinionTemplateRoute
    extends PageRouteInfo<DoctorAssignmentFactOrOpinionTemplateRouteArgs> {
  DoctorAssignmentFactOrOpinionTemplateRoute({
    required PatientAssignment assignment,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          DoctorAssignmentFactOrOpinionTemplateRoute.name,
          args: DoctorAssignmentFactOrOpinionTemplateRouteArgs(
            assignment: assignment,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'DoctorAssignmentFactOrOpinionTemplateRoute';

  static const PageInfo<DoctorAssignmentFactOrOpinionTemplateRouteArgs> page =
      PageInfo<DoctorAssignmentFactOrOpinionTemplateRouteArgs>(name);
}

class DoctorAssignmentFactOrOpinionTemplateRouteArgs {
  const DoctorAssignmentFactOrOpinionTemplateRouteArgs({
    required this.assignment,
    this.key,
  });

  final PatientAssignment assignment;

  final Key? key;

  @override
  String toString() {
    return 'DoctorAssignmentFactOrOpinionTemplateRouteArgs{assignment: $assignment, key: $key}';
  }
}

/// generated route for
/// [DoctorAssignmentSocraticQuestionsTemplateScreen]
class DoctorAssignmentSocraticQuestionsTemplateRoute
    extends PageRouteInfo<DoctorAssignmentSocraticQuestionsTemplateRouteArgs> {
  DoctorAssignmentSocraticQuestionsTemplateRoute({
    required PatientAssignment assignment,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          DoctorAssignmentSocraticQuestionsTemplateRoute.name,
          args: DoctorAssignmentSocraticQuestionsTemplateRouteArgs(
            assignment: assignment,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'DoctorAssignmentSocraticQuestionsTemplateRoute';

  static const PageInfo<DoctorAssignmentSocraticQuestionsTemplateRouteArgs>
      page = PageInfo<DoctorAssignmentSocraticQuestionsTemplateRouteArgs>(name);
}

class DoctorAssignmentSocraticQuestionsTemplateRouteArgs {
  const DoctorAssignmentSocraticQuestionsTemplateRouteArgs({
    required this.assignment,
    this.key,
  });

  final PatientAssignment assignment;

  final Key? key;

  @override
  String toString() {
    return 'DoctorAssignmentSocraticQuestionsTemplateRouteArgs{assignment: $assignment, key: $key}';
  }
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
/// [DoctorMainScreen]
class DoctorMainRoute extends PageRouteInfo<void> {
  const DoctorMainRoute({List<PageRouteInfo>? children})
      : super(
          DoctorMainRoute.name,
          initialChildren: children,
        );

  static const String name = 'DoctorMainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DoctorNewAssignmentScreen]
class DoctorNewAssignmentRoute
    extends PageRouteInfo<DoctorNewAssignmentRouteArgs> {
  DoctorNewAssignmentRoute({
    required PatientAssignment assignment,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          DoctorNewAssignmentRoute.name,
          args: DoctorNewAssignmentRouteArgs(
            assignment: assignment,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'DoctorNewAssignmentRoute';

  static const PageInfo<DoctorNewAssignmentRouteArgs> page =
      PageInfo<DoctorNewAssignmentRouteArgs>(name);
}

class DoctorNewAssignmentRouteArgs {
  const DoctorNewAssignmentRouteArgs({
    required this.assignment,
    this.key,
  });

  final PatientAssignment assignment;

  final Key? key;

  @override
  String toString() {
    return 'DoctorNewAssignmentRouteArgs{assignment: $assignment, key: $key}';
  }
}

/// generated route for
/// [DoctorPatientDetailsScreen]
class DoctorPatientDetailsRoute
    extends PageRouteInfo<DoctorPatientDetailsRouteArgs> {
  DoctorPatientDetailsRoute({
    required PatientAssignment assignment,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          DoctorPatientDetailsRoute.name,
          args: DoctorPatientDetailsRouteArgs(
            assignment: assignment,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'DoctorPatientDetailsRoute';

  static const PageInfo<DoctorPatientDetailsRouteArgs> page =
      PageInfo<DoctorPatientDetailsRouteArgs>(name);
}

class DoctorPatientDetailsRouteArgs {
  const DoctorPatientDetailsRouteArgs({
    required this.assignment,
    this.key,
  });

  final PatientAssignment assignment;

  final Key? key;

  @override
  String toString() {
    return 'DoctorPatientDetailsRouteArgs{assignment: $assignment, key: $key}';
  }
}

/// generated route for
/// [PatientAssignmentDetailScreen]
class PatientAssignmentDetailRoute
    extends PageRouteInfo<PatientAssignmentDetailRouteArgs> {
  PatientAssignmentDetailRoute({
    required PatientAssignment assignment,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          PatientAssignmentDetailRoute.name,
          args: PatientAssignmentDetailRouteArgs(
            assignment: assignment,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'PatientAssignmentDetailRoute';

  static const PageInfo<PatientAssignmentDetailRouteArgs> page =
      PageInfo<PatientAssignmentDetailRouteArgs>(name);
}

class PatientAssignmentDetailRouteArgs {
  const PatientAssignmentDetailRouteArgs({
    required this.assignment,
    this.key,
  });

  final PatientAssignment assignment;

  final Key? key;

  @override
  String toString() {
    return 'PatientAssignmentDetailRouteArgs{assignment: $assignment, key: $key}';
  }
}

/// generated route for
/// [PatientAssignmentFactOrOpinionScreen]
class PatientAssignmentFactOrOpinionRoute
    extends PageRouteInfo<PatientAssignmentFactOrOpinionRouteArgs> {
  PatientAssignmentFactOrOpinionRoute({
    required PatientAssignment assignment,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          PatientAssignmentFactOrOpinionRoute.name,
          args: PatientAssignmentFactOrOpinionRouteArgs(
            assignment: assignment,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'PatientAssignmentFactOrOpinionRoute';

  static const PageInfo<PatientAssignmentFactOrOpinionRouteArgs> page =
      PageInfo<PatientAssignmentFactOrOpinionRouteArgs>(name);
}

class PatientAssignmentFactOrOpinionRouteArgs {
  const PatientAssignmentFactOrOpinionRouteArgs({
    required this.assignment,
    this.key,
  });

  final PatientAssignment assignment;

  final Key? key;

  @override
  String toString() {
    return 'PatientAssignmentFactOrOpinionRouteArgs{assignment: $assignment, key: $key}';
  }
}

/// generated route for
/// [PatientAssignmentListScreen]
class PatientAssignmentListRoute extends PageRouteInfo<void> {
  const PatientAssignmentListRoute({List<PageRouteInfo>? children})
      : super(
          PatientAssignmentListRoute.name,
          initialChildren: children,
        );

  static const String name = 'PatientAssignmentListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PatientAssignmentSocratesQuestionsScreen]
class PatientAssignmentSocratesQuestionsRoute
    extends PageRouteInfo<PatientAssignmentSocratesQuestionsRouteArgs> {
  PatientAssignmentSocratesQuestionsRoute({
    required PatientAssignment assignment,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          PatientAssignmentSocratesQuestionsRoute.name,
          args: PatientAssignmentSocratesQuestionsRouteArgs(
            assignment: assignment,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'PatientAssignmentSocratesQuestionsRoute';

  static const PageInfo<PatientAssignmentSocratesQuestionsRouteArgs> page =
      PageInfo<PatientAssignmentSocratesQuestionsRouteArgs>(name);
}

class PatientAssignmentSocratesQuestionsRouteArgs {
  const PatientAssignmentSocratesQuestionsRouteArgs({
    required this.assignment,
    this.key,
  });

  final PatientAssignment assignment;

  final Key? key;

  @override
  String toString() {
    return 'PatientAssignmentSocratesQuestionsRouteArgs{assignment: $assignment, key: $key}';
  }
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
/// [PatientMainScreen]
class PatientMainRoute extends PageRouteInfo<void> {
  const PatientMainRoute({List<PageRouteInfo>? children})
      : super(
          PatientMainRoute.name,
          initialChildren: children,
        );

  static const String name = 'PatientMainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PatientMoodHistoryScreen]
class PatientMoodHistoryRoute extends PageRouteInfo<void> {
  const PatientMoodHistoryRoute({List<PageRouteInfo>? children})
      : super(
          PatientMoodHistoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'PatientMoodHistoryRoute';

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
