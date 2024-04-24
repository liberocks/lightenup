import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lightenup/constants/constants.dart';
import 'package:lightenup/cubit/cubit.dart';
import 'package:lightenup/ui/widgets/widgets.dart';

@RoutePage()
class PatientHomeScreen extends StatelessWidget {
  const PatientHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PatientNavigationCubit, PatientNavigationState>(
      builder: (context, patientNavigationState) {
        final appBarHeight = 196 - MediaQuery.of(context).viewPadding.top;

        return Layout(
          appBar: AppBar(
            titleSpacing: 0,
            automaticallyImplyLeading: false,
            toolbarHeight: appBarHeight,
            title: Container(
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
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Headline(
                      text: 'Good morning ☀️',
                      size: SizeOfThing.small,
                    ),
                    Display(text: 'Chris H.'),
                  ],
                ),
              ),
            ),
            leading: Container(),
            leadingWidth: 0,
          ),
          child: Container(
            color: Colors.white,
            child: const Text('Home'),
          ),
        );
      },
    );
  }
}
