import 'package:flutter/material.dart';
import 'package:qr_scan/presentation/screens/tabs_screen.dart';

//add color scheme
var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(121, 5, 163, 220));

//add Dark color scheme
var kDarkColorTheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 5, 90, 125),
);

void main() {
  runApp(
    const App(),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: kDarkColorTheme,

        //add button scheme for dark mode
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: kDarkColorTheme.primaryContainer)),
      ),
      theme: ThemeData().copyWith(
          useMaterial3: true,
          colorScheme: kColorScheme,

          //add button scheme
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  backgroundColor: kColorScheme.primaryContainer)),
          textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: kColorScheme.onPrimaryContainer,
                  fontSize: 18))),
      themeMode: ThemeMode.system,
      home: const TabsScreen(),
    );
  }
}
