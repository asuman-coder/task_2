import 'package:flutter/material.dart';

class Hub extends StatefulWidget {
  const Hub({super.key});

  @override
  State<Hub> createState() => _HubState();
}

class _HubState extends State<Hub> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Hub",
          style: TextStyle(color: Colors.grey),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: const Center(child: Text("Hub")),
    );
  }
}
