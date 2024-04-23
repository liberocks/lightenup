import 'package:auto_route/auto_route.dart';
import 'package:lightenup/constants/constants.dart';
import 'package:lightenup/ui/screens/screens.dart';
import 'package:lightenup/ui/widgets/widgets.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => <AutoRoute>[
        // Common
        SlideRoute(
          path: RouteConstants.choice,
          page: CanvasRoute.page,
          initial: true,
        ),
        SlideRoute(
          path: RouteConstants.choice,
          page: ChoiceRoute.page,
          // initial: true,
        ),

        // Doctor screens
        SlideRoute(
          path: RouteConstants.doctorHome,
          page: DoctorHomeRoute.page,
        ),

        // Patient screens
        SlideRoute(
          path: RouteConstants.patientHome,
          page: PatientHomeRoute.page,
        ),
        SlideRoute(
          path: RouteConstants.patientMoodTracker,
          page: PatientMoodTrackerRoute.page,
        ),
        SlideRoute(
          path: RouteConstants.patientProfile,
          page: PatientProfileRoute.page,
        ),
        SlideRoute(
          path: RouteConstants.patientSchedule,
          page: PatientScheduleRoute.page,
        ),

        // Doctor screens
        SlideRoute(
          path: RouteConstants.doctorHome,
          page: DoctorHomeRoute.page,
        ),
      ];
}

final AppRouter router = AppRouter();
