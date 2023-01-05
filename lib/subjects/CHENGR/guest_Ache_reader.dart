import 'package:BetterNotes/style/app_style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

enum SampleItem { itemOne, itemTwo, itemThree }

class ACHEGuestReaderScreen extends StatefulWidget {
  ACHEGuestReaderScreen(this.doc, {Key? key}) : super(key: key);
  QueryDocumentSnapshot doc;

  @override
  _ACHEGuestReaderScreenState createState() => _ACHEGuestReaderScreenState();
}

class NoteAction {
  final String title;
  final String content;
  NoteAction(this.title, this.content);
}

class _ACHEGuestReaderScreenState extends State<ACHEGuestReaderScreen> {
  late TextEditingController _mainController;
  late TextEditingController _titleController;

  SampleItem? selectedMenu;

  @override
  void initState() {
    super.initState();
    _mainController =
        TextEditingController(text: widget.doc['ACHEnote_content']);

    super.initState();
    _titleController =
        TextEditingController(text: widget.doc['ACHEnote_title']);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.doc == null) {
      // Return some placeholder widget if doc is null
      return Container();
    }

    var color_id = widget.doc['ACHEcolor_id'];

    return WillPopScope(
        onWillPop: () async {
          await FirebaseFirestore.instance
              .collection('ACHEnotes')
              .doc(widget.doc.id)
              .update({
            'ACHEnote_content': _mainController.text,
            'ACHEnote_title': _titleController.text
          });
          return true;
        },
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: AppStyle.cardsColor[color_id],
          appBar: AppBar(
            backgroundColor: AppStyle.cardsColor[color_id],
            elevation: 0,
            title: RichText(
              text: TextSpan(
                style: AppStyle.mainTitle.copyWith(color: Colors.black),
                text: widget.doc['ACHEnote_title'] as String,
              ),
            ),
            actions: [],
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  child: RichText(
                    text: TextSpan(
                      style: AppStyle.mainContent.copyWith(color: Colors.black),
                      text: widget.doc['ACHEnote_content'] as String,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
