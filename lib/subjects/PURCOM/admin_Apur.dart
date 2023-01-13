import 'dart:io';

import 'package:BetterNotes/screens/home_screen.dart';
import 'package:BetterNotes/screens/home_screen_admin.dart';
import 'package:BetterNotes/screens/home_screen_guest.dart';
import 'package:BetterNotes/screens/settings.dart';
import 'package:BetterNotes/style/app_style.dart';
import 'package:BetterNotes/subjects/ARTAPP/admin_Aart.dart';
import 'package:BetterNotes/subjects/ARTAPP/admin_Eart.dart';
import 'package:BetterNotes/subjects/ARTAPP/admin_Qart.dart';
import 'package:BetterNotes/subjects/CAL2/admin_Acal2.dart';
import 'package:BetterNotes/subjects/CAL2/admin_Ecal2.dart';
import 'package:BetterNotes/subjects/CAL2/admin_Qcal2.dart';
import 'package:BetterNotes/subjects/CHENGR/admin_Ache.dart';
import 'package:BetterNotes/subjects/CHENGR/admin_Eche.dart';
import 'package:BetterNotes/subjects/CHENGR/admin_Qche.dart';
import 'package:BetterNotes/subjects/DSTRU1/admin_Adst.dart';
import 'package:BetterNotes/subjects/DSTRU1/admin_Edst.dart';
import 'package:BetterNotes/subjects/DSTRU1/admin_Qdst.dart';
import 'package:BetterNotes/subjects/ENGIDA/admin_Aeng.dart';
import 'package:BetterNotes/subjects/ENGIDA/admin_Eeng.dart';
import 'package:BetterNotes/subjects/ENGIDA/admin_Qeng.dart';
import 'package:BetterNotes/subjects/NSTP02/admin_Anst.dart';
import 'package:BetterNotes/subjects/NSTP02/admin_Enst.dart';
import 'package:BetterNotes/subjects/NSTP02/admin_Qnst.dart';
import 'package:BetterNotes/subjects/OBOPRO/admin_Aobo.dart';
import 'package:BetterNotes/subjects/OBOPRO/admin_Eobo.dart';
import 'package:BetterNotes/subjects/OBOPRO/admin_Qobo.dart';
import 'package:BetterNotes/subjects/PEDUC2/admin_Aped.dart';
import 'package:BetterNotes/subjects/PEDUC2/admin_Eped.dart';
import 'package:BetterNotes/subjects/PEDUC2/admin_Qped.dart';
import 'package:BetterNotes/subjects/PHENGR/admin_Aphe.dart';
import 'package:BetterNotes/subjects/PHENGR/admin_Ephe.dart';
import 'package:BetterNotes/subjects/PHENGR/admin_Qphe.dart';
import 'package:BetterNotes/subjects/PURCOM/Apur_card.dart';
import 'package:BetterNotes/subjects/PURCOM/admin_Apur_editor.dart';
import 'package:BetterNotes/subjects/PURCOM/admin_Apur_reader.dart';
import 'package:BetterNotes/subjects/PURCOM/admin_Epur.dart';
import 'package:BetterNotes/subjects/PURCOM/admin_Qpur.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../TODO/todo_screen_admin.dart';

class AdminPURScreen extends StatefulWidget {
  final Color backgroundColor;
  const AdminPURScreen({Key? key, required this.backgroundColor})
      : super(key: key);

  @override
  _AdminPURScreenState createState() =>
      _AdminPURScreenState(backgroundColor: AppStyle.mainColor);
}

class _AdminPURScreenState extends State<AdminPURScreen> {
  final Color backgroundColor;
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _selectedOption = 'CALCU2';
  String _selectedOption2 = 'OBOPRO';
  String _selectedOption3 = 'ENGIDA';
  String _selectedOption4 = 'DSTRU1';
  String _selectedOption5 = 'PEDUC2';
  String _selectedOption6 = 'PURCOM';
  String _selectedOption7 = 'NSTP02';
  String _selectedOption8 = 'CHENGR';
  String _selectedOption9 = 'ARTAPP';
  String _selectedOption10 = 'PHENGR';

  // Ads Start
  BannerAd? _bannerAd;
  InterstitialAd? _interstitialAd;
  InterstitialAd? _interstitialAd1;
  InterstitialAd? _interstitialAd2;
  InterstitialAd? _interstitialAd3;
  InterstitialAd? _interstitialAd4;
  InterstitialAd? _interstitialAd5;
  InterstitialAd? _interstitialAd6;
  InterstitialAd? _interstitialAd7;
  InterstitialAd? _interstitialAd8;
  InterstitialAd? _interstitialAd9;
  InterstitialAd? _interstitialAd10;

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

  // Interstitial 3
  final String _adUnitId3 = Platform.isAndroid
      ? 'ca-app-pub-4857824590253290/6888831654'
      : 'ca-app-pub-4857824590253290/6888831654';

  // Interstitial 4
  final String _adUnitId4 = Platform.isAndroid
      ? 'ca-app-pub-4857824590253290/2960925439'
      : 'ca-app-pub-4857824590253290/2960925439';

  // Interstitial 5
  final String _adUnitId5 = Platform.isAndroid
      ? 'ca-app-pub-4857824590253290/1647843769'
      : 'ca-app-pub-4857824590253290/1647843769';

  // Interstitial 6
  final String _adUnitId6 = Platform.isAndroid
      ? 'ca-app-pub-4857824590253290/9323423309'
      : 'ca-app-pub-4857824590253290/9323423309';

  // Interstitial 7
  final String _adUnitId7 = Platform.isAndroid
      ? 'ca-app-pub-4857824590253290/4552127136'
      : 'ca-app-pub-4857824590253290/4552127136';

  // Interstitial 8
  final String _adUnitId8 = Platform.isAndroid
      ? 'ca-app-pub-4857824590253290/2496809435'
      : 'ca-app-pub-4857824590253290/2496809435';

  // Interstitial 9
  final String _adUnitId9 = Platform.isAndroid
      ? 'ca-app-pub-4857824590253290/3239045463'
      : 'ca-app-pub-4857824590253290/3239045463';

  // Interstitial 10
  final String _adUnitId10 = Platform.isAndroid
      ? 'ca-app-pub-4857824590253290/1183727768'
      : 'ca-app-pub-4857824590253290/1183727768';

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

    InterstitialAd.load(
        adUnitId: _adUnitId3,
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
            _interstitialAd2 = ad;
          },
          // Called when an ad request failed.
          onAdFailedToLoad: (LoadAdError error) {
            // ignore: avoid_print
            print('InterstitialAd failed to load: $error');
          },
        ));

    InterstitialAd.load(
        adUnitId: _adUnitId4,
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
            _interstitialAd3 = ad;
          },
          // Called when an ad request failed.
          onAdFailedToLoad: (LoadAdError error) {
            // ignore: avoid_print
            print('InterstitialAd failed to load: $error');
          },
        ));

    InterstitialAd.load(
        adUnitId: _adUnitId5,
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
            _interstitialAd4 = ad;
          },
          // Called when an ad request failed.
          onAdFailedToLoad: (LoadAdError error) {
            // ignore: avoid_print
            print('InterstitialAd failed to load: $error');
          },
        ));

    InterstitialAd.load(
        adUnitId: _adUnitId6,
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
            _interstitialAd5 = ad;
          },
          // Called when an ad request failed.
          onAdFailedToLoad: (LoadAdError error) {
            // ignore: avoid_print
            print('InterstitialAd failed to load: $error');
          },
        ));

    InterstitialAd.load(
        adUnitId: _adUnitId7,
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
            _interstitialAd6 = ad;
          },
          // Called when an ad request failed.
          onAdFailedToLoad: (LoadAdError error) {
            // ignore: avoid_print
            print('InterstitialAd failed to load: $error');
          },
        ));

    InterstitialAd.load(
        adUnitId: _adUnitId8,
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
            _interstitialAd7 = ad;
          },
          // Called when an ad request failed.
          onAdFailedToLoad: (LoadAdError error) {
            // ignore: avoid_print
            print('InterstitialAd failed to load: $error');
          },
        ));

    InterstitialAd.load(
        adUnitId: _adUnitId9,
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
            _interstitialAd8 = ad;
          },
          // Called when an ad request failed.
          onAdFailedToLoad: (LoadAdError error) {
            // ignore: avoid_print
            print('InterstitialAd failed to load: $error');
          },
        ));

    InterstitialAd.load(
        adUnitId: _adUnitId10,
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
            _interstitialAd9 = ad;
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
    _interstitialAd2?.dispose();
    _interstitialAd3?.dispose();
    _interstitialAd4?.dispose();
    _interstitialAd5?.dispose();
    _interstitialAd6?.dispose();
    _interstitialAd7?.dispose();
    _interstitialAd8?.dispose();
    _interstitialAd9?.dispose();
    _interstitialAd10?.dispose();

    super.dispose();
  }

  bool _isValid() {
    final username = _usernameController.text;
    final password = _passwordController.text;

    if (username == "Admin" && password == ".UFKadmin2023") {
      return true;
    } else if (username == "Guest" && password == "0000") {
      return true;
    } else {
      return false;
    }
  }

  void _showLoginDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color(0xFFF4E8E2),
          title: const Text('Login'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _usernameController,
                decoration: const InputDecoration(labelText: 'Username'),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                if (_isValid()) {
                  if (_usernameController.text == "Admin") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            AdminScreen(backgroundColor: backgroundColor),
                      ),
                    );
                  } else if (_usernameController.text == "Guest") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            GuestScreen(backgroundColor: backgroundColor),
                      ),
                    );
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF463F3B)),
              child: const Text('LOGIN'),
            ),
          ],
        );
      },
    );
  }

  Drawer _buildDrawer(BuildContext context) {
    return Drawer(
      width: 220,
      elevation: 0,
      backgroundColor: const Color(0xFFe8d1c5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 15,
          ),
          const SizedBox(height: 30),
          InkWell(
            onTap: _showLoginDialog,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFF463F3B),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 18,
                    ),
                    const Icon(
                      CupertinoIcons.person_crop_circle_fill,
                      size: 50,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "Admin Mode",
                      style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Divider(
            color: Color(0xFF463F3B),
            thickness: 2,
          ),
          const SizedBox(height: 3),
          TextButton(
            onPressed: () {
              _startNewGame();
              _interstitialAd1?.show();
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        AdminScreen(backgroundColor: backgroundColor)),
              );
            },
            child: Row(
              children: [
                const SizedBox(width: 3),
                const Icon(
                  CupertinoIcons.home,
                  size: 25,
                  color: Colors.black,
                ),
                const SizedBox(
                  width: 9,
                ),
                Text(
                  "Homepage",
                  style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 45, child: Icon(Icons.calculate_outlined)),
              Flexible(
                child: _selectedOption == ''
                    ? Text(
                        'CALCU2',
                        style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      )
                    : DropdownButton<String>(
                        value: _selectedOption,
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedOption = newValue ?? '';
                          });
                          const Divider(
                            height: 1000,
                          );
                          if (newValue == 'Assignments') {
                            _startNewGame();
                            _interstitialAd2?.show();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AdminCALScreen(
                                      backgroundColor: backgroundColor)),
                            );
                          } else if (newValue == 'Quizzes') {
                            _startNewGame();
                            _interstitialAd2?.show();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => QCALAdminCALScreen(
                                      backgroundColor: backgroundColor)),
                            );
                          } else if (newValue == 'Exams') {
                            _startNewGame();
                            _interstitialAd2?.show();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ECALAdminCALScreen(
                                      backgroundColor: backgroundColor)),
                            );
                          }
                        },
                        items: <String>[
                          'CALCU2',
                          'Assignments',
                          'Quizzes',
                          'Exams'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: GoogleFonts.roboto(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          );
                        }).toList(),
                        dropdownColor: const Color(0xFFF1E3DC),
                      ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 45, child: Icon(Icons.computer_outlined)),
              Flexible(
                child: _selectedOption2 == ''
                    ? Text(
                        'OBOPRO',
                        style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      )
                    : DropdownButton<String>(
                        value: _selectedOption2,
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedOption = newValue ?? '';
                          });
                          if (newValue == 'Assignments') {
                            _startNewGame();
                            _interstitialAd3?.show();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AdminOBOScreen(
                                      backgroundColor: backgroundColor)),
                            );
                          } else if (newValue == 'Quizzes') {
                            _startNewGame();
                            _interstitialAd3?.show();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => QOBOAdminCALScreen(
                                      backgroundColor: backgroundColor)),
                            );
                          } else if (newValue == 'Exams') {
                            _startNewGame();
                            _interstitialAd3?.show();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EOBOAdminCALScreen(
                                      backgroundColor: backgroundColor)),
                            );
                          }
                        },
                        items: <String>[
                          'OBOPRO',
                          'Assignments',
                          'Quizzes',
                          'Exams'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: GoogleFonts.roboto(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          );
                        }).toList(),
                        dropdownColor: const Color(0xFFF1E3DC)),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                  width: 45, child: Icon(Icons.laptop_chromebook_rounded)),
              Flexible(
                child: _selectedOption3 == ''
                    ? Text(
                        'ENGIDA',
                        style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      )
                    : DropdownButton<String>(
                        value: _selectedOption3,
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedOption = newValue ?? '';
                          });
                          if (newValue == 'Assignments') {
                            _startNewGame();
                            _interstitialAd4?.show();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AdminENGScreen(
                                      backgroundColor: backgroundColor)),
                            );
                          } else if (newValue == 'Quizzes') {
                            _startNewGame();
                            _interstitialAd4?.show();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => QENGAdminCALScreen(
                                      backgroundColor: backgroundColor)),
                            );
                          } else if (newValue == 'Exams') {
                            _startNewGame();
                            _interstitialAd4?.show();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EENGAdminCALScreen(
                                      backgroundColor: backgroundColor)),
                            );
                          }
                        },
                        items: <String>[
                          'ENGIDA',
                          'Assignments',
                          'Quizzes',
                          'Exams'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: GoogleFonts.roboto(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          );
                        }).toList(),
                        dropdownColor: const Color(0xFFF1E3DC)),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 45, child: Icon(Icons.laptop_mac_rounded)),
              Flexible(
                child: _selectedOption4 == ''
                    ? Text(
                        'DSTRU1',
                        style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      )
                    : DropdownButton<String>(
                        value: _selectedOption4,
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedOption = newValue ?? '';
                          });
                          if (newValue == 'Assignments') {
                            _startNewGame();
                            _interstitialAd5?.show();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AdminDSTScreen(
                                      backgroundColor: backgroundColor)),
                            );
                          } else if (newValue == 'Quizzes') {
                            _startNewGame();
                            _interstitialAd5?.show();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => QDSTAdminCALScreen(
                                      backgroundColor: backgroundColor)),
                            );
                          } else if (newValue == 'Exams') {
                            _startNewGame();
                            _interstitialAd5?.show();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EDSTAdminCALScreen(
                                      backgroundColor: backgroundColor)),
                            );
                          }
                        },
                        items: <String>[
                          'DSTRU1',
                          'Assignments',
                          'Quizzes',
                          'Exams'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: GoogleFonts.roboto(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          );
                        }).toList(),
                        dropdownColor: const Color(0xFFF1E3DC)),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 45, child: Icon(Icons.directions_run)),
              Flexible(
                child: _selectedOption5 == ''
                    ? Text(
                        'PEDUC2',
                        style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      )
                    : DropdownButton<String>(
                        value: _selectedOption5,
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedOption = newValue ?? '';
                          });
                          if (newValue == 'Assignments') {
                            _startNewGame();
                            _interstitialAd6?.show();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AdminPEDScreen(
                                      backgroundColor: backgroundColor)),
                            );
                          } else if (newValue == 'Quizzes') {
                            _startNewGame();
                            _interstitialAd6?.show();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => QPEDAdminCALScreen(
                                      backgroundColor: backgroundColor)),
                            );
                          } else if (newValue == 'Exams') {
                            _startNewGame();
                            _interstitialAd6?.show();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EPEDAdminCALScreen(
                                      backgroundColor: backgroundColor)),
                            );
                          }
                        },
                        items: <String>[
                          'PEDUC2',
                          'Assignments',
                          'Quizzes',
                          'Exams'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: GoogleFonts.roboto(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          );
                        }).toList(),
                        dropdownColor: const Color(0xFFF1E3DC)),
              ),
            ],
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppStyle.selected),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: 45, child: Icon(Icons.comment)),
                    Flexible(
                      child: _selectedOption6 == ''
                          ? Text(
                              'PURCOM',
                              style: GoogleFonts.roboto(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            )
                          : DropdownButton<String>(
                              value: _selectedOption6,
                              onChanged: (String? newValue) {
                                setState(() {
                                  _selectedOption = newValue ?? '';
                                });
                                if (newValue == 'Assignments') {
                                  _startNewGame();
                                  _interstitialAd1?.show();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AdminPURScreen(
                                            backgroundColor: backgroundColor)),
                                  );
                                } else if (newValue == 'Quizzes') {
                                  _startNewGame();
                                  _interstitialAd1?.show();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            QPURAdminCALScreen(
                                                backgroundColor:
                                                    backgroundColor)),
                                  );
                                } else if (newValue == 'Exams') {
                                  _startNewGame();
                                  _interstitialAd1?.show();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            EPURAdminCALScreen(
                                                backgroundColor:
                                                    backgroundColor)),
                                  );
                                }
                              },
                              items: <String>[
                                'PURCOM',
                                'Assignments',
                                'Quizzes',
                                'Exams'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: GoogleFonts.roboto(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                );
                              }).toList(),
                              dropdownColor: const Color(0xFFF1E3DC)),
                    ),
                  ],
                ),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                  width: 45, child: Icon(Icons.cleaning_services_outlined)),
              Flexible(
                child: _selectedOption7 == ''
                    ? Text(
                        'NSTP02',
                        style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      )
                    : DropdownButton<String>(
                        value: _selectedOption7,
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedOption = newValue ?? '';
                          });
                          if (newValue == 'Assignments') {
                            _startNewGame();
                            _interstitialAd8?.show();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AdminNSTScreen(
                                      backgroundColor: backgroundColor)),
                            );
                          } else if (newValue == 'Quizzes') {
                            _startNewGame();
                            _interstitialAd8?.show();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => QNSTAdminCALScreen(
                                      backgroundColor: backgroundColor)),
                            );
                          } else if (newValue == 'Exams') {
                            _startNewGame();
                            _interstitialAd8?.show();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ENSTAdminCALScreen(
                                      backgroundColor: backgroundColor)),
                            );
                          }
                        },
                        items: <String>[
                          'NSTP02',
                          'Assignments',
                          'Quizzes',
                          'Exams'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: GoogleFonts.roboto(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          );
                        }).toList(),
                        dropdownColor: const Color(0xFFF1E3DC)),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 45, child: Icon(Icons.science_outlined)),
              Flexible(
                child: _selectedOption8 == ''
                    ? Text(
                        'CHENGR',
                        style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      )
                    : DropdownButton<String>(
                        value: _selectedOption8,
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedOption = newValue ?? '';
                          });
                          if (newValue == 'Assignments') {
                            _startNewGame();
                            _interstitialAd9?.show();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AdminCHEScreen(
                                      backgroundColor: backgroundColor)),
                            );
                          } else if (newValue == 'Quizzes') {
                            _startNewGame();
                            _interstitialAd9?.show();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => QCHEAdminCALScreen(
                                      backgroundColor: backgroundColor)),
                            );
                          } else if (newValue == 'Exams') {
                            _startNewGame();
                            _interstitialAd9?.show();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ECHEAdminCALScreen(
                                      backgroundColor: backgroundColor)),
                            );
                          }
                        },
                        items: <String>[
                          'CHENGR',
                          'Assignments',
                          'Quizzes',
                          'Exams'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: GoogleFonts.roboto(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          );
                        }).toList(),
                        dropdownColor: const Color(0xFFF1E3DC)),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                  width: 45, child: Icon(Icons.format_paint_outlined)),
              Flexible(
                child: _selectedOption9 == ''
                    ? Text(
                        'ARTAPP',
                        style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      )
                    : DropdownButton<String>(
                        value: _selectedOption9,
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedOption = newValue ?? '';
                          });
                          if (newValue == 'Assignments') {
                            _startNewGame();
                            _interstitialAd9?.show();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AdminARTScreen(
                                      backgroundColor: backgroundColor)),
                            );
                          } else if (newValue == 'Quizzes') {
                            _startNewGame();
                            _interstitialAd9?.show();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => QARTAdminCALScreen(
                                      backgroundColor: backgroundColor)),
                            );
                          } else if (newValue == 'Exams') {
                            _startNewGame();
                            _interstitialAd9?.show();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EARTAdminCALScreen(
                                      backgroundColor: backgroundColor)),
                            );
                          }
                        },
                        items: <String>[
                          'ARTAPP',
                          'Assignments',
                          'Quizzes',
                          'Exams'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: GoogleFonts.roboto(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          );
                        }).toList(),
                        dropdownColor: const Color(0xFFF1E3DC)),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 45, child: Icon(Icons.balance_outlined)),
              Flexible(
                child: _selectedOption10 == ''
                    ? Text(
                        'PHENGR',
                        style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      )
                    : DropdownButton<String>(
                        value: _selectedOption10,
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedOption = newValue ?? '';
                          });
                          if (newValue == 'Assignments') {
                            _startNewGame();
                            _interstitialAd9?.show();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AdminPHEScreen(
                                      backgroundColor: backgroundColor)),
                            );
                          } else if (newValue == 'Quizzes') {
                            _startNewGame();
                            _interstitialAd9?.show();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => QPHEAdminCALScreen(
                                      backgroundColor: backgroundColor)),
                            );
                          } else if (newValue == 'Exams') {
                            _startNewGame();
                            _interstitialAd9?.show();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EPHEAdminCALScreen(
                                      backgroundColor: backgroundColor)),
                            );
                          }
                        },
                        items: <String>[
                          'PHENGR',
                          'Assignments',
                          'Quizzes',
                          'Exams'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: GoogleFonts.roboto(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          );
                        }).toList(),
                        dropdownColor: const Color(0xFFF1E3DC)),
              ),
            ],
          ),
          const SizedBox(
            height: 70,
          ),
          const Divider(
            color: Color(0xFF463F3B),
            thickness: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFF463F3B),
                  ),
                  child: TextButton(
                    onPressed: () {
                      _startNewGame();
                      _interstitialAd1?.show();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                HomeScreen(backgroundColor: backgroundColor)),
                      );
                    },
                    child: Row(
                      children: [
                        const Icon(
                          CupertinoIcons.back,
                          size: 35,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "EXIT",
                          style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFF463F3B),
                  ),
                  child: TextButton(
                    onPressed: () {
                      _startNewGame();
                      _interstitialAd1?.show();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TODOAdminScreen(
                                backgroundColor: backgroundColor)),
                      );
                    },
                    child: Row(
                      children: [
                        const Icon(
                          CupertinoIcons.calendar,
                          size: 35,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "TODO",
                          style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  _AdminPURScreenState({required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: _buildDrawer(context),
      backgroundColor: AppStyle.mainColor,
      appBar: AppBar(
        elevation: 0,
        title: const Text('PURCOM '),
        centerTitle: true,
        backgroundColor: AppStyle.mainColor,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingsScreen()));
              },
              icon: const Icon(Icons.settings)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
            Row(
              children: [
                Text(
                  "Assignments",
                  style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      setState(() {});
                    },
                    controller: _searchController,
                    style: const TextStyle(color: Color(0xFFEDDAD1)),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xFF8B7D76)),
                          borderRadius: BorderRadius.circular(80)),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(80),
                        borderSide: const BorderSide(color: Color(0xFF8B7D76)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: _searchController.text.isEmpty
                    ? FirebaseFirestore.instance
                        .collection('APURnotes')
                        .snapshots()
                    : FirebaseFirestore.instance
                        .collection('APURnotes')
                        .where('APURnote_title',
                            isGreaterThanOrEqualTo:
                                _searchController.text.toUpperCase(),
                            isLessThan:
                                '${_searchController.text.toUpperCase()}\uf8ff')
                        .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasData) {
                    final List<DocumentSnapshot> notes = snapshot.data!.docs;
                    final List<DocumentSnapshot> matchingNotes = [];
                    for (var i = 0; i < notes.length; i++) {
                      final note = notes[i];
                      if (note['APURnote_title']
                          .toString()
                          .toUpperCase()
                          .contains(_searchController.text.toUpperCase())) {
                        matchingNotes.add(note);
                      }
                    }
                    return GridView.count(
                      crossAxisCount: 1,
                      children: snapshot.data!.docs
                          .map((note) => noteCard(() {
                                _startNewGame();
                                _interstitialAd1?.show();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            APURAdminReaderScreen(note)));
                              }, note))
                          .toList(),
                    );
                  }
                  return Container();
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _startNewGame();
          _interstitialAd1?.show();
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const APURAdminEditorScreen()));
        },
        backgroundColor: const Color(0xFF8B7D76),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
