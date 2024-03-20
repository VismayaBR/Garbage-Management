import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:garbage_management/Admin/AdminNav.dart';
import 'package:garbage_management/Admin/warnings.dart';
import 'package:intl/intl.dart';

class SendWarning1 extends StatefulWidget {
  const SendWarning1({Key? key}) : super(key: key);

  @override
  State<SendWarning1> createState() => _SendWarning1State();
}

class _SendWarning1State extends State<SendWarning1> {
  Map<String, dynamic>? selectedDriverMap;
  List<Map<String, dynamic>> driverDetailsList = [];

  Future<void> driverDetails
   () async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('type', isEqualTo: 'Driver')
          .get();

      setState(() {
        driverDetailsList = querySnapshot.docs
            .map((doc) => {
                  'username': doc['username'].toString(),
                  'id': doc.id,
                })
            .toList();
      });
      print(driverDetailsList);
    } catch (e) { 
      print('Error fetching driver details: $e');
    }
  }

  var warning = TextEditingController();

  @override
  void initState() {
    super.initState();
    driverDetails();
  }

  void sendWarning() {
    if (selectedDriverMap != null && warning.text.isNotEmpty) {
      print('object');
          String dt1 = DateFormat('yyyy-MM-dd').format(DateTime.now());

      FirebaseFirestore.instance.collection('warning').add({
        'name': selectedDriverMap!['username'],
        'id':selectedDriverMap!['id'],
        'type':'Driver',
        'warning':warning.text,
        'date':dt1
      });
      // Perform the action (e.g., send the warning)
      print(
          'Sending warning to ${selectedDriverMap!['username']}, ID: ${selectedDriverMap!['id']}, Message: ${warning.text}');
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Sending...'),
                      backgroundColor: Colors.green,
                    ));
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx){
            return AdminNav();
          }));
    } else {
      // Display a message or take appropriate action for incomplete input
      print('Please select a driver and enter a warning message.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Color.fromARGB(255, 247, 238, 235),
              child: DropdownButton<Map<String, dynamic>>(
                items: driverDetailsList.map((Map<String, dynamic> driver) {
                  return DropdownMenuItem<Map<String, dynamic>>(
                    value: driver,
                    child: Text(driver['username']),
                  );
                }).toList(),
                onChanged: (selectedDriver) {
                  setState(() {
                    selectedDriverMap = selectedDriver;
                  });
                  print(
                      'Selected driver: ${selectedDriver!['username']}, ID: ${selectedDriver['id']}');
                },
                value: selectedDriverMap,
                isExpanded: true,
                hint: Text('Select a Driver'),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 350,
              child: TextFormField(
                maxLines: 4,
                controller: warning,
                decoration: InputDecoration(
                    labelText: 'Add Warning...', border: OutlineInputBorder()),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: sendWarning,
              child: Text('Send'),
            )
          ],
        ),
      ),
    );
  }
}
