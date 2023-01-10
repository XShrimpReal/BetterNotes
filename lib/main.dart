import 'package:BetterNotes/screens/home_screen.dart';
import 'package:BetterNotes/subjects/CAL2/admin_Acal2.dart';
import 'package:BetterNotes/subjects/CAL2/admin_Ecal2.dart';
import 'package:BetterNotes/subjects/CAL2/admin_Qcal2.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // MobileAds.instance.initialize();
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

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BetterNotes',
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(
              backgroundColor: backgroundColor,
            ),
        '/AdminCALScreen': (context) => AdminCALScreen(
              backgroundColor: backgroundColor,
            ),
        '/QCALAdminCALScreen': (context) => QCALAdminCALScreen(
              backgroundColor: backgroundColor,
            ),
        '/ECALAdminCALScreen': (context) => ECALAdminCALScreen(
              backgroundColor: backgroundColor,
            ),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(backgroundColor: widget.backgroundColor),
    );
  }
}
