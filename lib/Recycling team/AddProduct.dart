import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:garbage_management/Recycling%20team/ProductList.dart';
import 'package:garbage_management/constants/colors.dart';
import 'package:garbage_management/widgets/CustomTextField.dart';
import 'package:image_picker/image_picker.dart';

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
  File? _image;

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _getImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _addProductToFirestore() {
    if (_formKey.currentState?.validate() ?? false) {
      // Use _image in your Firestore logic if you want to store the image path or upload it to a storage service
      String imagePath = _image?.path ?? '';

      FirebaseFirestore.instance.collection('product').add({
        'name': _nameController.text,
        'desc': _descriptionController.text,
        'price': _priceController.text,
        'imagePath': imagePath,
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
                  onTap: _getImage,
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    color: maincolor,
                    child: _image == null
                        ? Center(child: Text('Upload an Image'))
                        : Image.file(_image!),
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
                  onPressed: _addProductToFirestore,
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