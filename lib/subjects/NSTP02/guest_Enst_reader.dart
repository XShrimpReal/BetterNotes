import 'package:BetterNotes/style/app_style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

enum SampleItem { itemOne, itemTwo, itemThree }

class ENSTGuestReaderScreen extends StatefulWidget {
  ENSTGuestReaderScreen(this.doc, {Key? key}) : super(key: key);
  QueryDocumentSnapshot doc;

  @override
  _ENSTGuestReaderScreenState createState() => _ENSTGuestReaderScreenState();
}

class NoteAction {
  final String title;
  final String content;
  NoteAction(this.title, this.content);
}

class _ENSTGuestReaderScreenState extends State<ENSTGuestReaderScreen> {
  late TextEditingController _mainController;
  late TextEditingController _titleController;

  SampleItem? selectedMenu;

  @override
  void initState() {
    super.initState();
    _mainController =
        TextEditingController(text: widget.doc['ENSTnote_content']);

    super.initState();
    _titleController =
        TextEditingController(text: widget.doc['ENSTnote_title']);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.doc == null) {
      // Return some placeholder widget if doc is null
      return Container();
    }

    var color_id = widget.doc['ENSTcolor_id'];

    return WillPopScope(
        onWillPop: () async {
          await FirebaseFirestore.instance
              .collection('ENSTnotes')
              .doc(widget.doc.id)
              .update({
            'ENSTnote_content': _mainController.text,
            'ENSTnote_title': _titleController.text
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
                text: widget.doc['ENSTnote_title'] as String,
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
                      text: widget.doc['ENSTnote_content'] as String,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
