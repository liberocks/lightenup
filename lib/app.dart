import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:lightenup/cubit/cubit.dart';
import 'package:lightenup/router.dart';

import 'package:nested/nested.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, initialization);
  }

  void initialization() async {
    await Future.delayed(const Duration(seconds: 3));
    FlutterNativeSplash.remove();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <SingleChildWidget>[
        BlocProvider<ChoiceCubit>(
          create: (BuildContext context) => ChoiceCubit(),
        ),
        BlocProvider<PatientNavigationCubit>(
          create: (BuildContext context) => PatientNavigationCubit(),
        ),
        BlocProvider<DoctorNavigationCubit>(
          create: (BuildContext context) => DoctorNavigationCubit(),
        ),
        BlocProvider<PatientMoodTrackerCubit>(
          create: (BuildContext context) => PatientMoodTrackerCubit(),
        ),
      ],
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: MaterialApp.router(
          routerConfig: router.config(),
          title: 'LightenUp',
          localizationsDelegates: const [
            DefaultMaterialLocalizations.delegate,
            DefaultCupertinoLocalizations.delegate,
            DefaultWidgetsLocalizations.delegate,
          ],
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
