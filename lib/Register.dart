import 'package:flutter/material.dart';
import 'package:garbage_management/Controllers/SignUpService.dart';
import 'package:garbage_management/constants/colors.dart';
import 'package:garbage_management/widgets/CustomText.dart';
import 'package:garbage_management/widgets/CustomTextField.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();

  var name = TextEditingController();
  var email = TextEditingController();
  var address = TextEditingController();
  var phone = TextEditingController();
  var password = TextEditingController();

  String selectedValue = 'User';
  String selectedValue1 = 'Meppadi';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
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
                    text: "Sign Up",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 45,
                    width: double.infinity,
                    color: maincolor,
                    child: DropdownButton<String>(
                      value: selectedValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedValue = newValue!;
                        });
                      },
                      hint: Text('Choose User Type',
                          style: TextStyle(color: Colors.white)), // Add a label
                      style:
                          TextStyle(color: Colors.white), // Adjust text color
                      dropdownColor: maincolor, // Set dropdown background color
                      items: <String>[
                        'User',
                        'Driver',
                        'Recycling team',
                      ].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(
                                color: customBalck), // Adjust text color
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(height: 20,),
                   Container(
                    height: 45,
                    width: double.infinity,
                    color: maincolor,
                    child: DropdownButton<String>(
                      value: selectedValue1,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedValue1 = newValue!;
                        });
                      },
                      hint: Text('Choose Location',
                          style: TextStyle(color: Colors.white)), // Add a label
                      style:
                          TextStyle(color: Colors.white), // Adjust text color
                      dropdownColor: maincolor, // Set dropdown background color
                      items: <String>[
                        'Meppadi',
                        'Edavaka',
                        'Kottathara',
                        'Meenangadi',
                        'Mullankkolly',
                        'Muppainadu'
                      ].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(
                                color: customBalck), // Adjust text color
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(
                      width: 350,
                      child: CustomTextField(
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Please enter  Name';
                          }
                          return null;
                        },
                        controller: name,
                        label: 'Name',
                        size: 15,
                      )),
                  SizedBox(
                      width: 350,
                      child: CustomTextField(
                        controller: email,
                        label: 'Email',
                        size: 15,
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Please enter  Email';
                          }
                          
                          return null;
                        },
                      )),
                  SizedBox(
                      width: 350,
                      child: CustomTextField(
                        controller: address,
                        label: 'Address',
                        size: 15,
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Please enter  Email';
                          }
                          return null;
                        },
                      )),
                  SizedBox(
                      width: 350,
                      child: CustomTextField(
                        controller: phone,
                        label: 'Phone no',
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Please enter  Email';
                          }
                          return null;
                        },
                        size: 15,
                      )),
                  SizedBox(
                      width: 350,
                      child: CustomTextField(
                        controller: password,
                        label: 'Password',
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Please enter  Email';
                          }
                          return null;
                        },
                        size: 15,
                      )),
                  SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  InkWell(
                    onTap: () {
                      if (_formKey.currentState?.validate() ?? false) {
                      
                          print('user..........');
                          UsersignUp(
                              name: name.text,
                              email: email.text,
                              address: address.text,
                              location: selectedValue1,
                              phone: phone.text,
                              password: password.text,
                              type:selectedValue);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Registered successfully'),
                      backgroundColor: Colors.green,
                    ));
                    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx){
                    //   return ProductList();
                    // }));   
                          Navigator.pop(context);
                        
                       
                        // Validation passed, handle login logic
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
                              text: 'Register')),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
