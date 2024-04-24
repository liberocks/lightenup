import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lightenup/ui/widgets/widgets.dart';

@RoutePage()
class DoctorHomeScreen extends StatelessWidget {
  const DoctorHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Container(),
      appBar: AppBar(
        title: Text("Doctor's Home"),
      ),
    );
  }
}
