import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:garbage_management/Admin/AdminNav.dart';
import 'package:garbage_management/Controllers/LoginService.dart';
import 'package:garbage_management/Driver/DriverNav.dart';
import 'package:garbage_management/Public/PublicNavbar.dart';
import 'package:garbage_management/Recycling%20team/ProductList.dart';
import 'package:garbage_management/Register.dart';
import 'package:garbage_management/constants/colors.dart';
import 'package:garbage_management/widgets/CustomText.dart';
import 'package:garbage_management/widgets/CustomTextField.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  var name;
  var address;
  var phone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/logo.png'),
                  CustomText(
                    size: 30,
                    weight: FontWeight.bold,
                    color: customGreen,
                    text: "Sign In",
                  ),
                  SizedBox(
                      width: 350,
                      child: CustomTextField(
                        controller: _emailController,
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Please enter  Email';
                          }
                          return null;
                        },
                        label: 'Email Id',
                        size: 15,
                      )),
                  SizedBox(
                      width: 350,
                      child: CustomTextField(
                        controller: _passwordController,
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
                      width: 350,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CustomText(
                              size: 15,
                              weight: FontWeight.normal,
                              color: customGreen,
                              text: 'Forgot Password?'),
                        ],
                      )),
                  SizedBox(
                    height: 100,
                  ),
                  InkWell(
                    onTap: () async {
                      if (_formKey.currentState?.validate() ?? false) {
                        print('object');

                        // Call your login function asynchronously
                        var user = await login(
                          email: _emailController.text,
                          password: _passwordController.text,
                        );

                        print('______________${user[0][1]}');

                        SharedPreferences spref =
                            await SharedPreferences.getInstance();
                        spref.setString('id', user[0][0]);

                        print("Login successful: $user");

                        if (user[0][1] == 'User') {
                          final QuerySnapshot<Map<String, dynamic>>
                              userSnapshot = await FirebaseFirestore.instance
                                  .collection('users')
                                  .where('email',
                                      isEqualTo: _emailController.text)
                                  .where('password',
                                      isEqualTo: _passwordController.text)
                                  // .where('status', isEqualTo: 1)
                                  .get();

                          if (userSnapshot.docs.isNotEmpty) {
                            print('===============================');
                            setState(() {
                              userId = userSnapshot.docs[0].id;
                              name = userSnapshot.docs[0]['username'];
                              address = userSnapshot.docs[0]['address'];
                              phone = userSnapshot.docs[0]['phone'];
                            });

                            // print('.................$mechId');
                            SharedPreferences spref =
                                await SharedPreferences.getInstance();
                            spref.setString('user_id', userId);
                            spref.setString('name', name);
                            spref.setString('address', address);
                            spref.setString('phone', phone);

                            var nm = spref.getString('name');
                            var em = spref.getString('address');
                            var ph = spref.getString('phone');

                            print('---------------$address');

                            Navigator.push(context,
                                MaterialPageRoute(builder: (ctx) {
                              return PublicNav();
                            }));
                            datas.clear();
                          }
                          if (user[0][1] == 'Driver') {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (ctx) {
                              return UserNav();
                            }));
                            datas.clear();
                          }
                          if (user[0][1] == 'Recycling team') {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (ctx) {
                              return ProductList();
                            }));
                            datas.clear();
                          }

                          if (user[0][1] == 'admin') {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (ctx) {
                              return AdminNav();
                            }));
                            datas.clear();
                          }
                        }
                      }
                    },
                    child: Container(
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
                              text: 'Login')),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (ctx) {
                          return Register();
                        }));
                      },
                      child: CustomText(
                          size: 15,
                          weight: FontWeight.normal,
                          color: customGreen,
                          text: 'Create new account'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
