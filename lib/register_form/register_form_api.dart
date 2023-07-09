import 'package:firebase_database/firebase_database.dart';

class RagisterForm {
  // static final TextEditingController _textEditingController =
  //     TextEditingController();

  // static TextEditingController get textEditingController =>
  //     _textEditingController;

  static String gender = "gender";
  static String male = 'Male';
  static String female = 'female';
  static bool cricket = false;
  static bool footboll = false;
  static bool swimming = false;
  static double ageslider = 0;
  static bool active = false;
  static List<String> stream = ['gaming', 'swimmig', 'footbll', 'traveling'];
  static String? selectvalue;
  static final DatabaseReference db = FirebaseDatabase.instance.ref("User");
  static Future<void> setData({
    required String firstName,
    required String middleName,
    required String lastName,
    required String gender,
    required List hobby,
    required double age,
    required bool isactive,
    required String stream,
  }) async {
    String key = db.push().key!;
    await db.child(key).set({
      'key': key,
      'firstName': firstName,
      'middleName': middleName,
      'lastName': lastName,
      'gender': gender,
      'hobby': hobby,
      'age': age,
      'isactive': isactive,
      'stream': stream
    });
  }
}
