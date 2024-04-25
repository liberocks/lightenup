import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lightenup/ui/widgets/widgets.dart';

@RoutePage()
class PatientMoodTrackerScreen extends StatelessWidget {
  const PatientMoodTrackerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      appBar: AppBar(
        title: const Text('Mood tracker'),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        child: PrimaryButton(
          text: 'Set mood',
          onPressed: () {},
        ),
      ),
      child: Container(),
    );
  }
}
