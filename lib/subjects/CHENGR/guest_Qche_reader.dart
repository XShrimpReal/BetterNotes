import 'package:BetterNotes/style/app_style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

enum SampleItem { itemOne, itemTwo, itemThree }

class QCHEGuestReaderScreen extends StatefulWidget {
  QCHEGuestReaderScreen(this.doc, {Key? key}) : super(key: key);
  QueryDocumentSnapshot doc;

  @override
  _QCHEGuestReaderScreenState createState() => _QCHEGuestReaderScreenState();
}

class NoteAction {
  final String title;
  final String content;
  NoteAction(this.title, this.content);
}

class _QCHEGuestReaderScreenState extends State<QCHEGuestReaderScreen> {
  late TextEditingController _mainController;
  late TextEditingController _titleController;

  SampleItem? selectedMenu;

  @override
  void initState() {
    super.initState();
    _mainController =
        TextEditingController(text: widget.doc['QCHEnote_content']);

    super.initState();
    _titleController =
        TextEditingController(text: widget.doc['QCHEnote_title']);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.doc == null) {
      // Return some placeholder widget if doc is null
      return Container();
    }

    var color_id = widget.doc['QCHEcolor_id'];

    return WillPopScope(
        onWillPop: () async {
          await FirebaseFirestore.instance
              .collection('QCHEnotes')
              .doc(widget.doc.id)
              .update({
            'QCHEnote_content': _mainController.text,
            'QCHEnote_title': _titleController.text
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
                text: widget.doc['QCHEnote_title'] as String,
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
                      text: widget.doc['QCHEnote_content'] as String,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
