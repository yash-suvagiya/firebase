import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class RagistrerPage extends StatefulWidget {
  const RagistrerPage({super.key});

  @override
  State<RagistrerPage> createState() => _RagistrerPageState();
}

class _RagistrerPageState extends State<RagistrerPage> {
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _middleName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  String gender = "gender";
  String male = 'Male';
  String female = 'female';
  bool cricket = false;
  bool footboll = false;
  bool swimming = false;
  double ageslider = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              controller: _firstName,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            TextField(
              controller: _middleName,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            TextField(
              controller: _lastName,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            Row(
              children: [
                const Text("Gender:-"),
                Radio(
                  value: male,
                  groupValue: gender,
                  onChanged: (value) {
                    gender = value!;
                    setState(() {});
                  },
                ),
                Text('male'),
                Radio(
                  value: female,
                  groupValue: gender,
                  onChanged: (value) {
                    gender = value!;
                    setState(() {});
                  },
                ),
                Text('female'),
              ],
            ),
            Row(
              children: [
                const Text('hobby:-'),
                Checkbox(
                  value: cricket,
                  onChanged: (value) {
                    cricket = value!;
                    setState(() {});
                  },
                ),
                const Text('cricket'),
                Checkbox(
                  value: footboll,
                  onChanged: (value) {
                    footboll = value!;
                    setState(() {});
                  },
                ),
                const Text('footboll'),
                Checkbox(
                  value: swimming,
                  onChanged: (value) {
                    swimming = value!;
                    setState(() {});
                  },
                ),
                Text('swimming'),
              ],
            ),
            Row(
              children: [
                Text('age'),
                Slider(
                  value: ageslider,
                  onChanged: (value) {
                    ageslider = value;
                    setState(() {});
                  },
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {});
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
