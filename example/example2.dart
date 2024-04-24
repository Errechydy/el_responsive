import 'package:flutter/material.dart';
import 'package:el_responsive/el_responsive.dart';

enum ScreenType {
  mobile,
  tablet,
  desktop,
}

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: ElResponsiveContainer(
        screens: [
          ElScreen(name: ScreenType.mobile, breakpoint: 480),
          ElScreen(name: ScreenType.tablet, breakpoint: 768),
          ElScreen(name: ScreenType.desktop, breakpoint: 1024),
        ],
        child: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("ChildScreen got build");

    final ScreenType screenType =
        ElResponsive.of(context)!.screen as ScreenType;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Widget title"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          screenType == ScreenType.mobile
              ? const Icon(Icons.phone_android)
              : screenType == ScreenType.tablet
                  ? const Icon(Icons.tablet_android)
                  : const Icon(Icons.desktop_windows),
          const SizedBox(height: 24.0),
          Text(
            '${screenType.name} Screen',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ],
      ),
    );
  }
}
