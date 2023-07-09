import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';

class FirebaseApi {
  static final DatabaseReference db = FirebaseDatabase.instance.ref('user');

  static Future<void> setUserdata({required String username}) async {
    String key = db.push().key!;
    await db.child(key).set({"key": key, "username": username});
  }

  static Future<List<Map>> selectData() async {
    // print('seelct data logic heare');
    Map data = await db.once().then((value) => value.snapshot.value as Map);
    List<Map> userData = [];
    data.forEach((key, value) {
      userData.add(value);
      // log("$value");
      log("$userData");
    });
    return userData;
  }
}
