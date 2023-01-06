import 'dart:math';

import 'package:BetterNotes/style/app_style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EARTAdminEditorScreen extends StatefulWidget {
  const EARTAdminEditorScreen({Key? key}) : super(key: key);

  @override
  State<EARTAdminEditorScreen> createState() => _EARTAdminEditorScreenState();
}

class _EARTAdminEditorScreenState extends State<EARTAdminEditorScreen> {
  int color_id = Random().nextInt(AppStyle.cardsColor.length);

  late TextEditingController _titleController = TextEditingController();
  late TextEditingController _mainController = TextEditingController();
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
          FirebaseFirestore.instance.collection('EARTnotes').add({
            'EARTnote_title': _titleController.text,
            'EARTnote_content': _mainController.text,
            'EARTcolor_id': color_id
          }).then((value) {
            print(value.id);
            Navigator.pop(context);
          }).catchError(
              (error) => print('Failed to add new Note due to $error'));
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}
