import 'package:firebase/register_form/register_form_api.dart';
import 'package:flutter/material.dart';

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
  bool active = false;
  List<String> stream = ['gaming', 'swimmig', 'footbll', 'traveling'];
  String? selectvalue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SafeArea(
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
                  const Text('male'),
                  Radio(
                    value: female,
                    groupValue: gender,
                    onChanged: (value) {
                      gender = value!;
                      setState(() {});
                    },
                  ),
                  const Text('female'),
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
                  const Text('swimming'),
                ],
              ),
              Row(
                children: [
                  const Text('age'),
                  Slider(
                    value: ageslider,
                    onChanged: (value) {
                      ageslider = value;
                      setState(() {});
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  const Text('is active?:-'),
                  Switch(
                    value: active,
                    onChanged: (value) {
                      active = value;
                      setState(() {});
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  const Text('stream:-'),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: DropdownButton(
                      hint: const Text(
                        'drop heare',
                        style: TextStyle(color: Colors.grey),
                      ),
                      items: stream
                          .map(
                            (e) => DropdownMenuItem(
                              // ignore: sort_child_properties_last
                              child: Text(e),
                              value: e,
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        selectvalue = value!;
                        setState(() {});
                      },
                    ),
                  )
                ],
              ),
              ElevatedButton(
                onPressed: () async {
                  await RagisterForm.setData(
                      firstName: _firstName.text,
                      middleName: _middleName.text,
                      lastName: _lastName.text);
                  setState(() {});
                },
                child: const Text('submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
