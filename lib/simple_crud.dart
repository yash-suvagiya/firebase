import 'package:firebase/firebase_api.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class SimpleCrudDemo extends StatefulWidget {
  const SimpleCrudDemo({super.key});

  @override
  State<SimpleCrudDemo> createState() => _SimpleCrudDemoState();
}

class _SimpleCrudDemoState extends State<SimpleCrudDemo> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: _controller,
          ),
          ElevatedButton(
            onPressed: () async {
              await FirebaseApi.setUserdata(username: _controller.text);
              setState(() {});
            },
            child: Text('submit'),
          )
        ],
      ),
    );
  }
}
