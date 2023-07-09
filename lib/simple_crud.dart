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
  late Future<List<Map>> futureUserData;
  @override
  void initState() {
    futureUserData = FirebaseApi.selectData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              controller: _controller,
            ),
            ElevatedButton(
              onPressed: () async {
                await FirebaseApi.setUserdata(username: _controller.text);
                futureUserData = FirebaseApi.selectData();
                setState(() {});
              },
              child: Text('submit'),
            ),
            FutureBuilder(
              future: futureUserData,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                    child: ListView.builder(
                        itemBuilder: (context, index) => ListTile(
                              title: Text(snapshot.data![index]['username']),
                            ),
                        itemCount: snapshot.data!.length),
                  );
                } else {
                  return const Text('there  is no data');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
