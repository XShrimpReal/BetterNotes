import 'dart:io';

import 'package:BetterNotes/style/app_style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:image_picker/image_picker.dart';

enum SampleItem { itemOne, itemTwo, itemThree }

class ECHEAdminReaderScreen extends StatefulWidget {
  ECHEAdminReaderScreen(this.doc, {Key? key}) : super(key: key);
  QueryDocumentSnapshot doc;

  @override
  _ECHEAdminReaderScreenState createState() => _ECHEAdminReaderScreenState();
}

class NoteAction {
  final String title;
  final String content;
  NoteAction(this.title, this.content);
}

class _ECHEAdminReaderScreenState extends State<ECHEAdminReaderScreen> {
  late TextEditingController _mainController;
  late TextEditingController _titleController;

  // Ads Start
  BannerAd? _bannerAd;
  InterstitialAd? _interstitialAd;
  InterstitialAd? _interstitialAd1;

  // Banner
  final String _adUnitId = Platform.isAndroid
      ? 'ca-app-pub-4857824590253290/3085577772'
      : 'ca-app-pub-4857824590253290/3085577772';

  // Interstitial 1
  final String _adUnitId1 = Platform.isAndroid
      ? 'ca-app-pub-4857824590253290/3323887515'
      : 'ca-app-pub-4857824590253290/3323887515';

  // Interstitial 2
  final String _adUnitId2 = Platform.isAndroid
      ? 'ca-app-pub-4857824590253290/6840730197'
      : 'ca-app-pub-4857824590253290/6840730197';

  void _startNewGame() {
    _loadAd();
    _loadAd1();
    _loadAd2();
  }

  void _loadAd() async {
    BannerAd(
      adUnitId: _adUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        // Called when an ad is successfully received.
        onAdLoaded: (ad) {
          setState(() {
            _bannerAd = ad as BannerAd;
          });
        },
        // Called when an ad request failed.
        onAdFailedToLoad: (ad, err) {
          ad.dispose();
        },
        // Called when an ad opens an overlay that covers the screen.
        onAdOpened: (Ad ad) {},
        // Called when an ad removes an overlay that covers the screen.
        onAdClosed: (Ad ad) {},
        // Called when an impression occurs on the ad.
        onAdImpression: (Ad ad) {},
      ),
    ).load();
  }

  void _loadAd1() async {
    InterstitialAd.load(
        adUnitId: _adUnitId1,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          // Called when an ad is successfully received.
          onAdLoaded: (InterstitialAd ad) {
            ad.fullScreenContentCallback = FullScreenContentCallback(
                // Called when the ad showed the full screen content.
                onAdShowedFullScreenContent: (ad) {},
                // Called when an impression occurs on the ad.
                onAdImpression: (ad) {},
                // Called when the ad failed to show full screen content.
                onAdFailedToShowFullScreenContent: (ad, err) {
                  ad.dispose();
                },
                // Called when the ad dismissed full screen content.
                onAdDismissedFullScreenContent: (ad) {
                  ad.dispose();
                },
                // Called when a click is recorded for an ad.
                onAdClicked: (ad) {});

            // Keep a reference to the ad so you can show it later.
            _interstitialAd = ad;
          },
          // Called when an ad request failed.
          onAdFailedToLoad: (LoadAdError error) {
            // ignore: avoid_print
            print('InterstitialAd failed to load: $error');
          },
        ));
  }

  void _loadAd2() async {
    InterstitialAd.load(
        adUnitId: _adUnitId2,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          // Called when an ad is successfully received.
          onAdLoaded: (InterstitialAd ad) {
            ad.fullScreenContentCallback = FullScreenContentCallback(
                // Called when the ad showed the full screen content.
                onAdShowedFullScreenContent: (ad) {},
                // Called when an impression occurs on the ad.
                onAdImpression: (ad) {},
                // Called when the ad failed to show full screen content.
                onAdFailedToShowFullScreenContent: (ad, err) {
                  ad.dispose();
                },
                // Called when the ad dismissed full screen content.
                onAdDismissedFullScreenContent: (ad) {
                  ad.dispose();
                },
                // Called when a click is recorded for an ad.
                onAdClicked: (ad) {});

            // Keep a reference to the ad so you can show it later.
            _interstitialAd1 = ad;
          },
          // Called when an ad request failed.
          onAdFailedToLoad: (LoadAdError error) {
            // ignore: avoid_print
            print('InterstitialAd failed to load: $error');
          },
        ));
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    _interstitialAd?.dispose();
    _interstitialAd1?.dispose();
    super.dispose();
  }

  SampleItem? selectedMenu;

  bool _isBold = false;
  List<NoteAction> _actions = [];
  int _currentPosition = -1;

  void _addAction(String title, String content) {
    // Remove all actions after the current position
    _actions.removeRange(_currentPosition + 1, _actions.length);
    _actions.add(NoteAction(title, content));
    _currentPosition++;
  }

  void _undo() {
    if (_currentPosition > 0) {
      _currentPosition--;
      // Set the text of the controllers to the action at the current position in the history
      NoteAction action = _actions[_currentPosition];
      _mainController.text = action.content;
      _titleController.text = action.title;
    }
  }

  void _redo() {
    if (_currentPosition < _actions.length - 1) {
      _currentPosition++;
      // Set the text of the controllers to the action at the current position in the history
      NoteAction action = _actions[_currentPosition];
      _mainController.text = action.content;
      _titleController.text = action.title;
    }
  }

  Future<void> _deleteNoteCard() async {
    // Delete the document
    await widget.doc.reference.delete();
    // Navigate back to the previous screen
    Navigator.pop(context);
  }

  void _italic() {
    // Get the current value and selection of the TextField
    String currentText = _mainController.value.text;
    int selectionStart = _mainController.selection.start;
    int selectionEnd = _mainController.selection.end;

    // Create a new TextSpan with the selected text in italic

    // Create a new RichText widget with the new TextSpan

    // Update the content of the TextField with the new RichText widget
    _mainController.value = TextEditingValue(
      selection: TextSelection.collapsed(offset: selectionEnd),
    );
  }

  void _openImagePicker() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select an image'),
          actions: [
            ElevatedButton(
              onPressed: _selectImageFromGallery,
              child: const Text('Gallery'),
            ),
            ElevatedButton(
              child: const Text('Camera'),
              onPressed: () {
                // Open camera and take a picture
              },
            ),
          ],
        );
      },
    );
  }

  void _selectImageFromGallery() async {
    // Open image picker and select image from gallery
    PickedFile? pickedFile = (await ImagePicker()
        .pickImage(source: ImageSource.gallery)) as PickedFile?;
    if (pickedFile != null) {
      // Do something with the selected image
    }
  }

  @override
  void initState() {
    super.initState();
    _startNewGame();
    _mainController =
        TextEditingController(text: widget.doc['ECHEnote_content']);
    _mainController.addListener(() {
      // Add the current text as an action to the history
      _addAction(_titleController.text, _mainController.text);
    });

    super.initState();
    _titleController =
        TextEditingController(text: widget.doc['ECHEnote_title']);
    _titleController.addListener(() {
      // Add the current text as an action to the history
      _addAction(_titleController.text, _mainController.text);
      _isBold = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var color_id = widget.doc['ECHEcolor_id'];

    return WillPopScope(
      onWillPop: () async {
        await FirebaseFirestore.instance
            .collection('ECHEnotes')
            .doc(widget.doc.id)
            .update({
          'ECHEnote_content': _mainController.text,
          'ECHEnote_title': _titleController.text
        });
        return true;
      },
      child: Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: AppStyle.cardsColor[color_id],
          bottomNavigationBar: BottomAppBar(
            color: const Color(0xFFB4A9A3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.undo),
                  onPressed: _undo,
                ),
                IconButton(
                  icon: const Icon(Icons.redo),
                  onPressed: _redo,
                ),
                IconButton(
                  icon: const Icon(Icons.text_format),
                  onPressed: () {
                    PopupMenuButton<SampleItem>(
                      offset: const Offset(0, -50),
                      initialValue: selectedMenu,
                      onSelected: (SampleItem item) {
                        setState(() {
                          selectedMenu = item;
                        });
                      },
                      itemBuilder: (BuildContext context) {
                        return [
                          const PopupMenuItem<SampleItem>(
                            value: SampleItem.itemOne,
                            child: Text('Item 1'),
                          ),
                          const PopupMenuItem<SampleItem>(
                            value: SampleItem.itemTwo,
                            child: Text('Item 2'),
                          ),
                          const PopupMenuItem<SampleItem>(
                            value: SampleItem.itemThree,
                            child: Text('Item 3'),
                          ),
                        ];
                      },
                    );
                  },
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
                  onPressed: () {
                    setState(() {
                      _isBold = !_isBold;
                    });

                    // Get the current value and selection of the TextField
                    String currentText = _mainController.value.text;
                    int selectionStart = _mainController.selection.start;
                    int selectionEnd = _mainController.selection.end;

                    // Apply bold formatting to the selected text
                    String boldText =
                        currentText.substring(selectionStart, selectionEnd);
                    String newText =
                        '${currentText.substring(0, selectionStart)}<b>$boldText</b>${currentText.substring(selectionEnd)}';
                    _mainController.value = _mainController.value.copyWith(
                      text: newText,
                      selection:
                          TextSelection.collapsed(offset: selectionEnd + 3),
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.format_italic),
                  onPressed: _italic,
                ),
                IconButton(
                  icon: const Icon(Icons.format_underline),
                  onPressed: () {},
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
                decoration: const InputDecoration(border: InputBorder.none),
              ),
            ),
            actions: [
              IconButton(
                onPressed: _openImagePicker,
                icon: const Icon(Icons.attach_file_outlined),
              ),
              IconButton(
                onPressed: _deleteNoteCard,
                icon: const Icon(Icons.delete_forever),
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    if (_bannerAd != null)
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: SafeArea(
                          child: SizedBox(
                            width: _bannerAd!.size.width.toDouble(),
                            height: _bannerAd!.size.height.toDouble(),
                            child: AdWidget(ad: _bannerAd!),
                          ),
                        ),
                      )
                  ],
                ),
                Container(
                    padding: const EdgeInsets.all(16),
                    child: TextField(
                      controller: _mainController,
                      style: AppStyle.mainContent,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      maxLines: null,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
