import 'package:flutter/material.dart';
import 'package:task_2/bottomNav.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.blue.shade50,
          secondary: Colors.white10,
        ),
      ),
      // home: const Home(),
      initialRoute: '/',
      routes: {
        '/': (context) => const BottomNav(),
      },
    );
  }
}
