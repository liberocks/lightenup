import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lightenup/ui/widgets/atom/atom.dart';
import 'package:lightenup/ui/widgets/widgets.dart';

@RoutePage()
class CanvasScreen extends StatelessWidget {
  const CanvasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(top: 100, left: 16, right: 16, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Label(text: 'Home'),
          const Heading(text: 'asdads'),
          const Headline(text: 'text'),
          const Body(text: 'Body'),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: PrimaryButton(text: 'Update Mood', onPressed: () {}),
          ),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              Chips(text: 'Updsate Mood', onPressed: () {}),
              Chips(text: 'Updsate Mood', onPressed: () {}),
              Chips(text: 'Updsate Mood', onPressed: () {}),
              Chips(text: 'Updsate Mood', onPressed: () {}),
            ],
          ),
        ],
      ),
    );
  }
}
