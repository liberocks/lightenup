import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Layout extends StatefulWidget {
  const Layout({
    required this.child,
    super.key,
    this.bottomNavigationBar,
    this.appBar,
    this.onInit,
    this.onDispose,
  });

  /// The widget to be displayed at the bottom of the scaffold.
  final Widget? bottomNavigationBar;

  /// The widget to be displayed at the top of the scaffold.
  final PreferredSizeWidget? appBar;

  /// The widget to be displayed in the body of the scaffold.
  final Widget child;

  /// The callback that is called when the widget is initialized.
  final VoidCallback? onInit;

  /// The callback that is called when the widget is disposed.
  final VoidCallback? onDispose;

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  @override
  void initState() {
    super.initState();
    if (widget.onInit != null) {
      widget.onInit!();
    } else {
      SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual,
        overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom],
      );
    }
  }

  @override
  void dispose() {
    if (widget.onDispose != null) {
      widget.onDispose!();
    } else {
      SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom],
      );
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: widget.appBar,
        bottomNavigationBar: widget.bottomNavigationBar,
        body: widget.child,
      ),
    );
  }
}
