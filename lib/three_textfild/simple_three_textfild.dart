import 'package:firebase/three_textfild/three_firebase_api.dart';
import 'package:flutter/material.dart';

class ThreeTextFild extends StatefulWidget {
  const ThreeTextFild({super.key});

  @override
  State<ThreeTextFild> createState() => _ThreeTextFildState();
}

class _ThreeTextFildState extends State<ThreeTextFild> {
  final TextEditingController _surname = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _lastname = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              controller: _surname,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            TextField(
              controller: _name,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            TextField(
              controller: _lastname,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                await ThreeFirebaseApi.setData(
                    firstName: _surname.text,
                    middleName: _name.text,
                    lastName: _lastname.text);
                setState(() {});
              },
              child: const Text('submit'),
            ),
          ],
        ),
      ),
    );
  }
}
