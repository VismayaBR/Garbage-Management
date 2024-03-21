import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:garbage_management/ResetPassword.dart';
import 'package:garbage_management/constants/colors.dart';
import 'package:garbage_management/widgets/CustomTextField.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();
  var email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                label: 'Email Id',
                controller: email,
                size: 14,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter  Email';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState?.validate() ?? true) {
                        bool emailExists = await checkEmailExists(email.text);
                        if (emailExists) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (ctx) {
                            return ResetPassword(email: email.text);
                          }));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Email does not exist',style: TextStyle(color: white),),backgroundColor: customGreen,),
                          );
                        }
                      }
                    },
                    child: Text('Nextpage')),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> checkEmailExists(String email) async {
    try {
      // Query Firestore collection "users" for the provided email
      var querySnapshot = await FirebaseFirestore.instance.collection('users')
          .where('email', isEqualTo: email)
          .get();
      // Check if any documents match the provided email
      return querySnapshot.docs.isNotEmpty;
    } catch (e) {
      print("Error checking email: $e");
      return false;
    }
  }
}
