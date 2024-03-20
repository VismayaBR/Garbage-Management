import 'package:flutter/material.dart';
import 'package:garbage_management/ResetPassword.dart';
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
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? true) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (ctx) {
                          return ResetPassword(email: email.text);
                        }));
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
}
