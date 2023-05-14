import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
