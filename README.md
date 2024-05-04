
# ElResponsive 

Flutter package for Responsive Layout. MediaQuery alternative that triggers rebuild only when the screen type changes, You set list of the screens for the package and the rebuild get trigges only when certain breakpoint of the screens reached instead of triggering it on every screen change (pixel by pixel)


## Usage 

1. Add the latest version of package to your pubspec.yaml (and run`dart pub get`):
```yaml
dependencies:
  el_responsive: ^0.0.1
```
2. Import the package and use it in your Flutter App.
```dart
import 'package:el_responsive/el_responsive.dart';
```

## How to use
1. Add `ElResponsiveContainer` widget to top level of your app, and specify list of screens `List<ElScreen>` you want to listen to.
  `ElScreen` has name and breakpoint value
  - `name` can be any type, example:
    - `String` ([Example 1](https://github.com/Errechydy/el_responsive/blob/main/example/example.dart))
    - `enum` ([Example 2](https://github.com/Errechydy/el_responsive/blob/main/example/example2.dart))
  - `breakpoint` is of type `int`
```dart
ElResponsiveContainer(
  screens: [
    ElScreen(name: "mobile", breakpoint: 480),
    ElScreen(name: "tablet", breakpoint: 768),
    ElScreen(name: "desktop", breakpoint: 1024),
  ],
  child: const MyHomePage(),
),
```

2. Listen to `ElResponsive` inside `build` method the same way you use `MediaQuery`
  Notice that we casted `ElResponsive.of(context)!.screen` to `String` in this example because the type of the `name` we gave to `ElScreen` is `String`
```dart
  @override
  Widget build(BuildContext context) {
    final String screenType = ElResponsive.of(context)!.screen as String;

    return .......
```

This `widget` now will get rebuilt only when the screen type we provided changes instead of rebuilding on every single pixel change when using `MediaQuery`.

## Examples
- Checkout the full exmaple that uses screen's `name` as `String` in [here](https://github.com/Errechydy/el_responsive/blob/main/example/example.dart)
- the full example that uses screen's `name` as `enum` in [here](https://github.com/Errechydy/el_responsive/blob/main/example/example2.dart)
