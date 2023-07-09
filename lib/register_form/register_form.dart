import 'package:firebase/register_form/register_form_api.dart';
import 'package:flutter/material.dart';

class RagistrerPage extends StatefulWidget {
  const RagistrerPage({super.key});

  @override
  State<RagistrerPage> createState() => _RagistrerPageState();
}

class _RagistrerPageState extends State<RagistrerPage> {
  static final TextEditingController _firstName = TextEditingController();
  static final TextEditingController _middleName = TextEditingController();
  static final TextEditingController _lastName = TextEditingController();
  List hobbie = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SafeArea(
            child: Column(
              children: [
                TextField(
                  controller: _firstName,
                  decoration: InputDecoration(
                    hintText: 'FirstName',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                TextField(
                  controller: _middleName,
                  decoration: InputDecoration(
                    hintText: 'MiddleName',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                TextField(
                  controller: _lastName,
                  decoration: InputDecoration(
                    hintText: 'LastName',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                Row(
                  children: [
                    const Text("Gender:-"),
                    Radio(
                      value: RagisterForm.male,
                      groupValue: RagisterForm.gender,
                      onChanged: (value) {
                        RagisterForm.gender = value!;
                        setState(() {});
                      },
                    ),
                    const Text('male'),
                    Radio(
                      value: RagisterForm.female,
                      groupValue: RagisterForm.gender,
                      onChanged: (value) {
                        RagisterForm.gender = value!;
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
                      value: RagisterForm.cricket,
                      onChanged: (value) {
                        RagisterForm.cricket = value!;
                        if (value) {
                          hobbie.add('cricket');
                        } else {
                          hobbie.remove('cricket');
                        }
                        setState(() {});
                      },
                    ),
                    const Text('cricket'),
                    Checkbox(
                      value: RagisterForm.footboll,
                      onChanged: (value) {
                        RagisterForm.footboll = value!;
                        if (value) {
                          hobbie.add("footboll");
                        } else {
                          hobbie.remove("footboll");
                        }
                        setState(() {});
                      },
                    ),
                    const Text('footboll'),
                    Checkbox(
                      value: RagisterForm.swimming,
                      onChanged: (value) {
                        RagisterForm.swimming = value!;
                        if (value) {
                          hobbie.add('swimming');
                        } else {
                          hobbie.remove('swimming');
                        }
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
                      value: RagisterForm.ageslider,
                      onChanged: (value) {
                        RagisterForm.ageslider = value;
                        setState(() {});
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text('is active?:-'),
                    Switch(
                      value: RagisterForm.active,
                      onChanged: (value) {
                        RagisterForm.active = value;
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
                        value: RagisterForm.selectvalue,
                        hint: const Text(
                          'drop heare',
                          style: TextStyle(color: Colors.grey),
                        ),
                        items: RagisterForm.stream
                            .map(
                              (e) => DropdownMenuItem(
                                // ignore: sort_child_properties_last
                                child: Text(e),
                                value: e,
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          RagisterForm.selectvalue = value!;
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
                      lastName: _lastName.text,
                      age: RagisterForm.ageslider,
                      hobby: hobbie,
                      isactive: RagisterForm.active,
                      gender: RagisterForm.gender,
                      stream: RagisterForm.selectvalue!,
                    );
                    setState(() {});
                  },
                  child: const Text('submit'),
                ),
                Text(
                    "${RagisterForm.gender} ${RagisterForm.ageslider} $hobbie ${RagisterForm.active} ${RagisterForm.selectvalue}"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
