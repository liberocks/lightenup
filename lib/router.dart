import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lightenup/constants/constants.dart';
import 'package:lightenup/data/model/model.dart';
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
          page: ChoiceRoute.page,
          initial: true,
        ),

        // Doctor screens
        SlideRoute(
          path: RouteConstants.doctor,
          page: DoctorMainRoute.page,
        ),
        SlideRoute(
          path: RouteConstants.doctorHome,
          page: DoctorHomeRoute.page,
        ),

        // Patient screens
        SlideRoute(
          path: RouteConstants.patient,
          page: PatientMainRoute.page,
        ),
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
          path: RouteConstants.patientAssignmentList,
          page: PatientAssignmentListRoute.page,
        ),
        SlideRoute(
          path: RouteConstants.patientAssignmentDetail,
          page: PatientAssignmentDetailRoute.page,
        ),
        SlideRoute(
          path: RouteConstants.patientAssignmentSocraticQuestionsWorksheet,
          page: PatientAssignmentSocratesQuestionsRoute.page,
        ),
        SlideRoute(
          path: RouteConstants.patientAssignmentFactOrOpinionWorksheet,
          page: PatientAssignmentFactOrOpinionRoute.page,
        ),
        SlideRoute(
          path: RouteConstants.patientMoodHistory,
          page: PatientMoodHistoryRoute.page,
        ),

        // Doctor screens
        SlideRoute(
          path: RouteConstants.doctorHome,
          page: DoctorHomeRoute.page,
        ),
        SlideRoute(
          path: RouteConstants.doctorPatientDetails,
          page: DoctorPatientDetailsRoute.page,
        ),
        SlideRoute(
          path: RouteConstants.doctorPatientMoodHistory,
          page: DoctorPatientMoodHistoryRoute.page,
        ),
        SlideRoute(
          path: RouteConstants.doctorNewAssignment,
          page: DoctorNewAssignmentRoute.page,
        ),
        SlideRoute(
          path: RouteConstants.doctorAssignmentSocraticQuestionsTemplate,
          page: DoctorAssignmentSocraticQuestionsTemplateRoute.page,
        ),
        SlideRoute(
          path: RouteConstants.doctorAssignmentFactOrOpinionTemplate,
          page: DoctorAssignmentFactOrOpinionTemplateRoute.page,
        ),
      ];
}

final AppRouter router = AppRouter();
