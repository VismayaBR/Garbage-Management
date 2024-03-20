import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:garbage_management/Admin/AdminNav.dart';
import 'package:garbage_management/Admin/warnings.dart';
import 'package:intl/intl.dart';

class SendWarning2 extends StatefulWidget {
  const SendWarning2({Key? key}) : super(key: key);

  @override
  State<SendWarning2> createState() => _SendWarning2State();
}

class _SendWarning2State extends State<SendWarning2> {
  Map<String, dynamic>? selectedRecycleMap;
  List<Map<String, dynamic>> RecycleDetailsList = [];

  Future<void> RecycleDetails() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('type', isEqualTo: 'Recycling team')
          .get();

      setState(() {
        RecycleDetailsList = querySnapshot.docs
            .map((doc) => {
                  'username': doc['username'].toString(),
                  'id': doc.id,
                })
            .toList();
      });
      print(RecycleDetailsList);
    } catch (e) {
      print('Error fetching Recycle details: $e');
    }
  }

  var warning = TextEditingController();

  @override
  void initState() {
    super.initState();
    RecycleDetails();
  }

  void sendWarning() {
    if (selectedRecycleMap != null && warning.text.isNotEmpty) {
      print('object');
    String dt1 = DateFormat('yyyy-MM-dd').format(DateTime.now());

      FirebaseFirestore.instance.collection('warning').add({
        'name': selectedRecycleMap!['username'],
        'id':selectedRecycleMap!['id'],
        'type': 'Recycle',
        'warning': warning.text,
        'date':dt1
      });
      // Perform the action (e.g., send the warning)
      print(
          'Sending warning to ${selectedRecycleMap!['username']}, ID: ${selectedRecycleMap!['id']}, Message: ${warning.text}');
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx) {
        return AdminNav();
      }));
    } else {
      // Display a message or take appropriate action for incomplete input
      print('Please select a Recycle and enter a warning message.');
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
                items: RecycleDetailsList.map((Map<String, dynamic> Recycle) {
                  return DropdownMenuItem<Map<String, dynamic>>(
                    value: Recycle,
                    child: Text(Recycle['username']),
                  );
                }).toList(),
                onChanged: (selectedRecycle) {
                  setState(() {
                    selectedRecycleMap = selectedRecycle;
                  });
                  print(
                      'Selected Recycle: ${selectedRecycle!['username']}, ID: ${selectedRecycle['id']}');
                },
                value: selectedRecycleMap,
                isExpanded: true,
                hint: Text('Select a Recycle'),
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
