import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:garbage_management/Public/PublicNavbar.dart';
import 'package:garbage_management/constants/colors.dart';
import 'package:garbage_management/widgets/CustomText.dart';
import 'package:garbage_management/widgets/CustomTextField.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  final _formKey = GlobalKey<FormState>();
  var nm = ''; // Initialize variables with default values
  var em = '';
  var ph = '';
  var ad = '';
  var id = '';
  late final TextEditingController name;
  late final TextEditingController email;
  late final TextEditingController address;
  late final TextEditingController phone;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    setState(() {
      id = spref.getString('user_id') ?? '';
      nm = spref.getString('name') ?? '';
      em = spref.getString('email') ?? '';
      ph = spref.getString('phone') ?? '';
      ad = spref.getString('address') ?? '';
      // Initialize controllers after data is fetched
      name = TextEditingController(text: nm);
      email = TextEditingController(text: em);
      address = TextEditingController(text: ad);
      phone = TextEditingController(text: ph);
    });
  }

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
                  height: 8,
                ),
                SizedBox(
                  height: 80,
                ),
                InkWell(
                  onTap: () async {
                    SharedPreferences spref =
                        await SharedPreferences.getInstance();
                    var userId = spref.getString('user_id');
                    DocumentReference userDocRef = FirebaseFirestore.instance
                        .collection('users')
                        .doc(userId);

                    // Update the document fields
                    await userDocRef.update({
                      'name': name.text,
                      'email': email.text,
                      'address': address.text,
                      'phone': phone.text,
                    });
                    setState(() {
                      spref.setString('name', name.text);
                      spref.setString('address', address.text);
                      spref.setString('phone', phone.text);
                      spref.setString('email', email.text);
                    });

                    // Show a success message
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Profile updated successfully'),
                      backgroundColor: Colors.green,
                    ));
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx){
                      return PublicNav();
                    }));
                  },
                  child: Container(
                    height: 45,
                    width: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: customGreen),
                    child: Center(
                        child: CustomText(
                            size: 18,
                            weight: FontWeight.bold,
                            color: white,
                            text: 'Save')),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
