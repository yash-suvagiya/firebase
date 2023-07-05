import 'package:firebase_database/firebase_database.dart';

class FirebaseApi {
  static final DatabaseReference db = FirebaseDatabase.instance.ref('user');
  static Future<void> setUserdata({required String username}) async {
    String key = db.push().key!;
    await db.child(key).set({"key": key, "username": username});
  }
}
