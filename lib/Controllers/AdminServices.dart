// -------------UserList-----------------
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/src/widgets/editable_text.dart';

Future<QuerySnapshot<Map<String, dynamic>>> getUsersData() async {
  try {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await FirebaseFirestore.instance
            .collection('users')
            .where('type', isEqualTo: 'User')
            .get();

    print('Firestore Data: ${querySnapshot.docs}');
    
    return querySnapshot;
  } catch (e) {
    print('Error fetching data: $e');
    throw e; // Rethrow the exception to be caught by the FutureBuilder
  }
}

// -------------DriverList-----------------

Future<QuerySnapshot<Map<String, dynamic>>> getDriverData() async {
  try {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await FirebaseFirestore.instance
            .collection('users')
            .where('type', isEqualTo: 'Driver')
            .get();

    print('Firestore Data: ${querySnapshot.docs}');
    
    return querySnapshot;
  } catch (e) {
    print('Error fetching data: $e');
    throw e; // Rethrow the exception to be caught by the FutureBuilder
  }
}


// -------------Recycling team List-----------------

Future<QuerySnapshot<Map<String, dynamic>>> getRecyclingData() async {
  try {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await FirebaseFirestore.instance
            .collection('users')
            .where('type', isEqualTo: 'Recycling team')
            .get();

    print('Firestore Data: ${querySnapshot.docs}');
    
    return querySnapshot;
  } catch (e) {
    print('Error fetching data: $e');
    throw e; // Rethrow the exception to be caught by the FutureBuilder
  }
}


// -------------Recycling team List-----------------

Future<QuerySnapshot<Map<String, dynamic>>> reject() async {
  try {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await FirebaseFirestore.instance
            .collection('users')
            .where('type', isEqualTo: 'Recycling team')
            .get();

    print('Firestore Data: ${querySnapshot.docs}');
    
    return querySnapshot;
  } catch (e) {
    print('Error fetching data: $e');
    throw e; // Rethrow the exception to be caught by the FutureBuilder
  }
}

// ----------Reference for users collection---------------
final CollectionReference users = FirebaseFirestore.instance.collection('users');


// ------------------Reject users--------------------


 void rejectUsers({required String user_id}) async {
    try {
      // Assuming 'documentId' is the unique identifier for the document you want to update
      String documentId = user_id;

      // Update the 'status' field to 1
      await users.doc(documentId).update({
        'status': '2',
      });

      print('Status updated successfully');
    } catch (e) {
      print('Error updating status: $e');
    }
  }


// ------------------Accept users--------------------


 void acceptUsers({required String user_id}) async {
    try {
      // Assuming 'documentId' is the unique identifier for the document you want to update
      String documentId = user_id;

      // Update the 'status' field to 1
      await users.doc(documentId).update({
        'status': '1',
      });

      print('Status updated successfully');
    } catch (e) {
      print('Error updating status: $e');
    }
  }

// ---------Driver complaints-------------
 Future<QuerySnapshot<Map<String, dynamic>>> getUserData() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection('user_complaints')
              // .where('type', isEqualTo: 'Driver')
              .get();

      print('Firestore Data: ${querySnapshot.docs}');

      return querySnapshot;
    } catch (e) {
      print('Error fetching data: $e');
      throw e; // Rethrow the exception to be caught by the FutureBuilder
    }
  }
// ---------Recycling team complaints-------------

Future<QuerySnapshot<Map<String, dynamic>>> getRecyclingComplaints() async {
  try {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await FirebaseFirestore.instance
            .collection('complaints')
            .where('type', isEqualTo: 'Recycling team')
            .get();

    print('Firestore Data: ${querySnapshot.docs}');
    
    return querySnapshot;
  } catch (e) {
    print('Error fetching data: $e');
    throw e; // Rethrow the exception to be caught by the FutureBuilder
  }
}

// ----------warning list-------------
Future<QuerySnapshot<Map<String, dynamic>>> warningData() async {
  try {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await FirebaseFirestore.instance
            .collection('warning')
            
            .get();

    print('Firestore Data: ${querySnapshot.docs}');
    
    return querySnapshot;
  } catch (e) {
    print('Error fetching data: $e');
    throw e; // Rethrow the exception to be caught by the FutureBuilder
  }
}

Future<QuerySnapshot<Map<String, dynamic>>> warningData1() async {
  try {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await FirebaseFirestore.instance
            .collection('warning')
            .where('name',isEqualTo: {})
            .get();

    print('Firestore Data: ${querySnapshot.docs}');
    
    return querySnapshot;
  } catch (e) {
    print('Error fetching data: $e');
    throw e; // Rethrow the exception to be caught by the FutureBuilder
  }
}

// -------------send Reply-------------
sendReply(String id, TextEditingController rply){
  FirebaseFirestore.instance.collection('user_complaints').doc(id).update({
    'replay': rply.text,
    'status':1
  });
}