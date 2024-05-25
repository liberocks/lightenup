import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lightenup/constants/colors.dart';
import 'package:lightenup/constants/size.dart';
import 'package:lightenup/cubit/cubit.dart';
import 'package:lightenup/router.dart';
import 'package:lightenup/ui/widgets/widgets.dart';

@RoutePage()
class DoctorHomeScreen extends StatefulWidget {
  const DoctorHomeScreen({super.key});

  @override
  State<DoctorHomeScreen> createState() => _DoctorHomeScreenState();
}

class _DoctorHomeScreenState extends State<DoctorHomeScreen> {
  @override
  void initState() {
    super.initState();

    final anyPatients =
        context.read<DoctorPatientListCubit>().state.patients.isNotEmpty;
    if (!anyPatients) {
      context.read<DoctorPatientListCubit>().resetPatientList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorNavigationCubit, DoctorNavigationState>(
      builder: (context, state) {
        return BlocBuilder<DoctorPatientListCubit, DoctorPatientListState>(
          builder: (context, doctorPatientListState) {
            final appBarHeight = 196 - MediaQuery.of(context).viewPadding.top;

            return Layout(
              onInit: () {
                SystemChrome.setEnabledSystemUIMode(
                  SystemUiMode.manual,
                  overlays: [SystemUiOverlay.bottom],
                );
              },
              appBar: AppBar(
                titleSpacing: 0,
                automaticallyImplyLeading: false,
                toolbarHeight: 0,
                leading: Container(),
                leadingWidth: 0,
                systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent,
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: appBarHeight,
                      padding: const EdgeInsets.all(0),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            ThemeColor.gradientStart,
                            ThemeColor.gradientEnd,
                          ],
                        ),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(18),
                          bottomRight: Radius.circular(18),
                        ),
                      ),
                      child: InkWell(
                        onLongPress: context
                            .read<DoctorPatientListCubit>()
                            .resetPatientList,
                        child: Container(
                          padding: const EdgeInsets.all(32.0),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Headline(
                                text: 'Good morning ☀️',
                                size: SizeOfThing.small,
                              ),
                              Display(text: 'Dr. Karina'),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Heading(
                                text: 'Patient List',
                                size: SizeOfThing.medium,
                                color: HexColor('#111111'),
                              ),
                              Label(
                                text: 'See more',
                                size: SizeOfThing.medium,
                                color: HexColor('#6750A4'),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Wrap(
                            children: doctorPatientListState.patients
                                .map(
                                  (e) => [
                                    PatientCard(
                                      name: e.name,
                                      diagnosis: e.diagnosis,
                                      profilePicture: e.profilePicture,
                                      onTap: () {
                                        if (e.name == 'Adelia Junianti') {
                                          AutoRouter.of(context).push(
                                            DoctorPatientDetailsRoute(
                                              patientId: e.id,
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                    Container(
                                      height: 16,
                                    ),
                                  ],
                                )
                                .flattened
                                .toList(),
                          ),
                          const SizedBox(height: 60),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
