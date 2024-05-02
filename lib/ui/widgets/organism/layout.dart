import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  const Layout({
    required this.child,
    super.key,
    this.bottomNavigationBar,
    this.appBar,
  });

  final Widget? bottomNavigationBar;

  final PreferredSizeWidget? appBar;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: appBar,
        bottomNavigationBar: bottomNavigationBar,
        body: child,
      ),
    );
  }
}
