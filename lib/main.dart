import 'package:BetterNotes/screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(const MyApp(
    backgroundColor: Colors.black,
  ));
}

class MyApp extends StatefulWidget {
  final Color backgroundColor;

  const MyApp({Key? key, required this.backgroundColor}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(backgroundColor: widget.backgroundColor),
    );
  }
}
