import 'package:flutter/material.dart';
import 'package:el_responsive/el_responsive.dart';

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
          ElScreen(name: "mobile", breakpoint: 480),
          ElScreen(name: "tablet", breakpoint: 768),
          ElScreen(name: "desktop", breakpoint: 1024),
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

    final String screenType = ElResponsive.of(context)!.screen as String;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Widget title"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          screenType == "mobile"
              ? const Icon(Icons.phone_android)
              : screenType == "tablet"
                  ? const Icon(Icons.tablet_android)
                  : const Icon(Icons.desktop_windows),
          const SizedBox(height: 24.0),
          Text(
            '$screenType Screen',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ],
      ),
    );
  }
}
