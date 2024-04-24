import 'dart:ui';
import 'package:flutter/widgets.dart';

import 'el_responsive_widget.dart';
import 'el_screen_class.dart';

class ElResponsiveContainer extends StatefulWidget {
  final Widget child;
  final List<ElScreen> screens;

  const ElResponsiveContainer({
    super.key,
    required this.child,
    required this.screens,
  }) : assert(screens.length >= 1, "Screens must have at least one element");

  @override
  State<ElResponsiveContainer> createState() => _ElResponsiveContainerState();
}

class _ElResponsiveContainerState extends State<ElResponsiveContainer>
    with WidgetsBindingObserver {
  late ElScreen elScreen;
  final FlutterView flutterView = PlatformDispatcher.instance.views.first;
  final double devicePixelRatio =
      PlatformDispatcher.instance.views.first.devicePixelRatio;

  ElScreen currentScreenType() {
    final double currentScreenWidth =
        flutterView.physicalSize.width / devicePixelRatio;

    for (final elScreen in widget.screens) {
      if (currentScreenWidth < elScreen.breakpoint) {
        return elScreen;
      }
    }

    return widget.screens.last;
  }

  @override
  void initState() {
    elScreen = currentScreenType();
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangeMetrics() {
    final ElScreen newElScreen = currentScreenType();
    if (elScreen == newElScreen) return;
    setState(() {
      elScreen = newElScreen;
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ElResponsive(
      screen: elScreen.name,
      child: widget.child,
    );
  }
}
