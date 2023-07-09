import 'package:firebase/register_form/register_form.dart';
import 'package:firebase/simple_crud.dart';
import 'package:firebase/three_textfild/simple_three_textfild.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RagistrerPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
