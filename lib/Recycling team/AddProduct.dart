import 'package:flutter/material.dart';
import 'package:garbage_management/constants/colors.dart';
import 'package:garbage_management/widgets/CustomTextField.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
    final TextEditingController _discriptionController = TextEditingController();


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
                Container(
                  height: 100,
                  width: double.infinity,
                  color: maincolor,
                  child: Center(child: Text('Upload an Image')),
                ),
                CustomTextField(
                  controller: _nameController,
                  validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please enter  Product';
                        }
                        return null;
                      },
                  label: 'Product name', size: 14),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _discriptionController,
                  validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please enter  Description';
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
                          return 'Please enter  Price';
                        }
                        return null;
                      },
                  label: 'Price', size: 14),
                 SizedBox(
                  height: 40,
                ),
                ElevatedButton(onPressed: (){}, child: Text('Add Product'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
