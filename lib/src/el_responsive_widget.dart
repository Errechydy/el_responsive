import 'package:flutter/widgets.dart';

class ElResponsive extends InheritedWidget {
  final Object screen;

  const ElResponsive({
    super.key,
    required super.child,
    required this.screen,
  });

  static ElResponsive? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ElResponsive>();
  }

  @override
  bool updateShouldNotify(ElResponsive oldWidget) {
    return oldWidget.screen != screen;
  }
}
