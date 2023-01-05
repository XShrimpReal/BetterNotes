import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:BetterNotes/main.dart';
import 'package:BetterNotes/style/app_style.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  void _updateHomeScreenColor(Color color) {
    Navigator.pop(context);
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => MyApp(backgroundColor: color)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.mainColor,
      appBar: AppBar(
        title: const Text("Settings"),
        centerTitle: true,
        backgroundColor: AppStyle.mainColor,
      ),
      body: ListView(
        children: [
          ListTile(
            title: GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: ColorPicker(
                          pickerColor: AppStyle.mainColor,
                          // onChanged: _updateHomeScreenColor,
                          onColorChanged: (Color color) {
                            setState(() {
                              AppStyle.mainColor = color;
                            });
                          },
                          pickerAreaHeightPercent: 0.8,
                        ),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text("Save"))
                        ],
                      );
                    });
              },
              child: Text(
                "Change background Color",
                style: GoogleFonts.nunito(color: Colors.white),
              ),
            ),
            // Add other list items here
          )
        ],
      ),
    );
  }
}
