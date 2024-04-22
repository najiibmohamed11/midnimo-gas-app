import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:midnimo/pages/register_with_phone.dart';


void main() async {
    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RegisterWithPhoneNumber(),
    );
  }
}

