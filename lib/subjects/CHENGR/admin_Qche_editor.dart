import 'dart:io';
import 'dart:math';

import 'package:BetterNotes/style/app_style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class QCHEAdminEditorScreen extends StatefulWidget {
  const QCHEAdminEditorScreen({Key? key}) : super(key: key);

  @override
  State<QCHEAdminEditorScreen> createState() => _QCHEAdminEditorScreenState();
}

class _QCHEAdminEditorScreenState extends State<QCHEAdminEditorScreen> {
  int color_id = Random().nextInt(AppStyle.cardsColor.length);

  late TextEditingController _titleController = TextEditingController();
  late TextEditingController _mainController = TextEditingController();
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

  @override
  void initState() {
    super.initState();
    _startNewGame();
  }

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
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppStyle.accentColor,
        onPressed: () async {
          _startNewGame();
          _interstitialAd1?.show();
          FirebaseFirestore.instance.collection('QCHEnotes').add({
            'QCHEnote_title': _titleController.text,
            'QCHEnote_content': _mainController.text,
            'QCHEcolor_id': color_id
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
