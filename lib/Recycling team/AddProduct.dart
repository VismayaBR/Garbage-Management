import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:garbage_management/Recycling%20team/ProductList.dart';
import 'package:garbage_management/constants/colors.dart';
import 'package:garbage_management/widgets/CustomTextField.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
   XFile? _image;
  String? imageUrl;

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

   Future<void> pickImage() async {
      final ImagePicker _picker = ImagePicker();

      try {
        XFile? pickedImage = await _picker.pickImage(source: ImageSource.gallery);

        if (pickedImage != null) {
          setState(() {
            _image = pickedImage;
          });

          // Upload the picked image
          await uploadImage();
        }
      } catch (e) {
        print('Error picking image: $e');
      }
    }

  Future<void> uploadImage() async {
    try {
      if (_image != null) {
        Reference storageReference =
            FirebaseStorage.instance.ref().child('uploads/${_image!.name}');

        await storageReference.putFile(File(_image!.path));

        // Get the download URL
        imageUrl = await storageReference.getDownloadURL();
      }
    } catch (e) {
      print('Error uploading image: $e');
    }
  }

  Future<void> _addProductToFirestore() async {
    if (_formKey.currentState?.validate() ?? false) {

      String imagePath = _image?.path ?? '';
      SharedPreferences spref = await SharedPreferences.getInstance();
      var sp = spref.getString('user_id');
      FirebaseFirestore.instance.collection('product').add({
        'name': _nameController.text,
        'desc': _descriptionController.text,
        'price': _priceController.text,
        'imagePath': imageUrl,
        'id':sp
      });

      Navigator.push(context, MaterialPageRoute(builder: (ctx) {
        return ProductList();
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: pickImage,
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    color: maincolor,
                    child: _image == null
                        ? Center(child: Text('Upload an Image'))
                        :  Image.file(File(_image!.path))
                  ),
                ),
                CustomTextField(
                  controller: _nameController,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter a product name';
                    }
                    return null;
                  },
                  label: 'Product name',
                  size: 14,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _descriptionController,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter a description';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), label: Text('Description')),
                  maxLines: 4,
                ),
                CustomTextField(
                  controller: _priceController,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter a price';
                    }
                    return null;
                  },
                  label: 'Price',
                  size: 14,
                ),
                SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  onPressed: (){
                    uploadImage();
                    _addProductToFirestore();
                  },
                  child: Text('Add Product'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}