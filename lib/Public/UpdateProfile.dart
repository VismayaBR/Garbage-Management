import 'package:flutter/material.dart';
import 'package:garbage_management/constants/colors.dart';
import 'package:garbage_management/widgets/CustomText.dart';
import 'package:garbage_management/widgets/CustomTextField.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/logo.png'),
                CustomText(
                  size: 30,
                  weight: FontWeight.bold,
                  color: customGreen,
                  text: "Sign Up",
                ),
                SizedBox(
                    width: 350,
                    child: CustomTextField(
                      controller: name,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please enter Name';
                        }
                        return null;
                      },
                      label: 'Name',
                      size: 15,
                    )),
                SizedBox(
                    width: 350,
                    child: CustomTextField(
                      controller: email,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please enter  Email';
                        }
                        return null;
                      },
                      label: 'Email',
                      size: 15,
                    )),
                SizedBox(
                    width: 350,
                    child: CustomTextField(
                      controller: address,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please enter  Address';
                        }
                        return null;
                      },
                      label: 'Address',
                      size: 15,
                    )),
                SizedBox(
                    width: 350,
                    child: CustomTextField(
                      controller: phone,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please enter  Phone';
                        }
                        return null;
                      },
                      label: 'Phone no',
                      size: 15,
                    )),
                SizedBox(
                    width: 350,
                    child: CustomTextField(
                      controller: password,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please enter  Password';
                        }
                        return null;
                      },
                      label: 'Password',
                      size: 15,
                    )),
                SizedBox(
                  height: 8,
                ),
                SizedBox(
                  height: 80,
                ),
                Container(
                  height: 45,
                  width: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: customGreen),
                  child: Center(
                      child: CustomText(
                          size: 20,
                          weight: FontWeight.bold,
                          color: white,
                          text: 'Register')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
