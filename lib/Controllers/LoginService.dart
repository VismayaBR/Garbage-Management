import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

var userId;
var type;
List datas = [];

Future<dynamic> login({
  required String email,
  required String password,
}) async {
  print('---------------------------------------$email');
  final QuerySnapshot<Map<String, dynamic>> userSnapshot =
      await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: email)
          .where('password', isEqualTo: password)
          .get();
  if (userSnapshot.docs.isNotEmpty) {
    userId = userSnapshot.docs[0].id;
    type = userSnapshot.docs[0]['type'];

    datas.add([userId, type]);

    return datas;
  }
}
