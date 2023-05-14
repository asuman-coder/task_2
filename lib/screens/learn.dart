import 'package:flutter/material.dart';

class Learn extends StatefulWidget {
  const Learn({super.key});

  @override
  State<Learn> createState() => _LearnState();
}

class _LearnState extends State<Learn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Learn",
          style: TextStyle(color: Colors.grey),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: const Center(child: Text("Learn")),
    );
  }
}
