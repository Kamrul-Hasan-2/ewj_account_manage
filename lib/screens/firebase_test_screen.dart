import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseTestScreen extends StatelessWidget {
  const FirebaseTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Test'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Firebase Test'),
          onPressed: () async {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Adding..."), duration: Duration(seconds: 1),),);
            FirebaseFirestore firestore = FirebaseFirestore.instance;

            await firestore.collection('users').add({
              'name': "kamrul",
              'age': 20,
            });
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("DONE :D"), duration: Duration(seconds: 1),),);
            
          },
        ),
      ),
    );
  }
}
