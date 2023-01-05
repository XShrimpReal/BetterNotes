import 'dart:math';

import 'package:BetterNotes/style/app_style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:timezone/timezone.dart' as tz;

class ACALAdminEditorScreen extends StatefulWidget {
  const ACALAdminEditorScreen({Key? key}) : super(key: key);

  @override
  State<ACALAdminEditorScreen> createState() => _ACALAdminEditorScreenState();

  void initNotification() {}
}

class _ACALAdminEditorScreenState extends State<ACALAdminEditorScreen> {
  int color_id = Random().nextInt(AppStyle.cardsColor.length);
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  late TextEditingController _titleController = TextEditingController();
  late TextEditingController _mainController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Permission.notification.request();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.cardsColor[color_id],
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFFB4A9A3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.undo),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.redo),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.format_list_bulleted),
              onPressed: () {
                // Get the current value and selection of the TextField
                String currentText = _mainController.value.text;
                int selectionStart = _mainController.selection.start;
                int selectionEnd = _mainController.selection.end;

                // Insert the bullet point at the current cursor position
                String newText =
                    '${currentText.substring(0, selectionStart)}\u2022 ${currentText.substring(selectionEnd)}';
                _mainController.value = TextEditingValue(
                  text: newText,
                  selection:
                      TextSelection.collapsed(offset: selectionStart + 2),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.format_bold),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.format_italic),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.format_underline),
              onPressed: () {
                // Apply underline formatting to the text in the TextField widget
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: AppStyle.cardsColor[color_id],
        elevation: 0,
        title: SizedBox(
          height: 50,
          child: TextField(
            controller: _titleController,
            style: AppStyle.mainTitle,
            decoration: const InputDecoration(
                border: InputBorder.none, hintText: 'Note Title'),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _mainController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: 'Note Content'),
              style: AppStyle.mainContent,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppStyle.accentColor,
        onPressed: () async {
          FirebaseFirestore.instance.collection('ACALnotes').add({
            'ACALnote_title': _titleController.text,
            'ACALnote_content': _mainController.text,
            'ACALcolor_id': color_id
          }).then((value) async {
            print(value.id);
            Navigator.pop(context);

            flutterLocalNotificationsPlugin.zonedSchedule(
              0,
              'Title of the notification',
              'Body of the notification',
              tz.TZDateTime.now(tz.local).add(Duration(seconds: 1)),
              const NotificationDetails(
                android: AndroidNotificationDetails(
                  'channel id',
                  'channel name',
                  importance: Importance.max,
                  priority: Priority.high,
                ),
              ),
              uiLocalNotificationDateInterpretation:
                  UILocalNotificationDateInterpretation.absoluteTime,
              androidAllowWhileIdle: true,
            );

            // Initialize the plugin
            var initializationSettingsAndroid =
                const AndroidInitializationSettings('ic_launcher.png');

            var initializationSettings =
                InitializationSettings(android: initializationSettingsAndroid);
            await flutterLocalNotificationsPlugin
                .initialize(initializationSettings);

            // Get the title and content of the note
            String title = _titleController.text;
            String content = _mainController.text;

            // Set the notification details
            var androidPlatformChannelSpecifics =
                const AndroidNotificationDetails(
              'assignments',
              'Assignments',
              importance: Importance.max,
              priority: Priority.high,
              ticker: 'ticker',
            );

            var platformChannelSpecifics =
                NotificationDetails(android: androidPlatformChannelSpecifics);

            // Show the notification
            await flutterLocalNotificationsPlugin.show(
              0,
              'New Assignment: $title',
              content,
              platformChannelSpecifics,
              payload: 'item x',
            );
          }).catchError(
              (error) => print('Failed to add new Note due to $error'));
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}
