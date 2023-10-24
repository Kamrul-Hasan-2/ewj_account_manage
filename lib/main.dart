import 'package:ewj_account_manage/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(EasyWearJunctionApp());
}

class EasyWearJunctionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EWJ Account Manager',
      theme: ThemeData(
        primaryColor: Colors.teal,
      ),
      home: HomeScreen(),
    );
  }
}

