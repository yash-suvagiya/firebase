import 'package:firebase_database/firebase_database.dart';

class RagisterForm {
  static final DatabaseReference db = FirebaseDatabase.instance.ref("User");
  static Future<void> setData(
      {required String firstName,
      required String middleName,
      required String lastName}) async {
    String key = db.push().key!;
    await db.child(key).set({
      'key': key,
      'firstName': firstName,
      'middleName': middleName,
      'lastName': lastName,
    });
  }
}
