//---------------------Users SignUp------------------------
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> UsersignUp({
  required String name, 
  required String email, 
  required String address, 
  required String phone, 
  required String password, 
  required String type}) async {
    print('.........................');
    await FirebaseFirestore.instance.collection('users').add({

      'username': name,
      'phone': phone,
      'email': email,
      'password': password,
      'status':'0',
      'type':type
    });
    print('------------');
    

  }
