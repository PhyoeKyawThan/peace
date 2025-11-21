import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Peace()));
}

class Peace extends StatefulWidget {
  const Peace({super.key});

  @override
  State<Peace> createState() => _PeaceState();
}

class _PeaceState extends State<Peace> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Peace Sign"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Icon(Icons.pan_tool, color: Colors.green, size: 200.0),
      ),
    );
  }
}
