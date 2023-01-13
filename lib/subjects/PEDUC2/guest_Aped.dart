import 'dart:io';

import 'package:BetterNotes/screens/home_screen.dart';
import 'package:BetterNotes/screens/home_screen_admin.dart';
import 'package:BetterNotes/screens/home_screen_guest.dart';
import 'package:BetterNotes/screens/settings.dart';
import 'package:BetterNotes/style/app_style.dart';
import 'package:BetterNotes/subjects/ARTAPP/guest_Aart.dart';
import 'package:BetterNotes/subjects/ARTAPP/guest_Eart.dart';
import 'package:BetterNotes/subjects/ARTAPP/guest_Qart.dart';
import 'package:BetterNotes/subjects/CAL2/guest_Acal2.dart';
import 'package:BetterNotes/subjects/CAL2/guest_Ecal2.dart';
import 'package:BetterNotes/subjects/CAL2/guest_Qcal2.dart';
import 'package:BetterNotes/subjects/CHENGR/guest_Ache.dart';
import 'package:BetterNotes/subjects/CHENGR/guest_Eche.dart';
import 'package:BetterNotes/subjects/CHENGR/guest_Qche.dart';
import 'package:BetterNotes/subjects/DSTRU1/guest_Adst.dart';
import 'package:BetterNotes/subjects/DSTRU1/guest_Edst.dart';
import 'package:BetterNotes/subjects/DSTRU1/guest_Qdst.dart';
import 'package:BetterNotes/subjects/ENGIDA/guest_Aeng.dart';
import 'package:BetterNotes/subjects/ENGIDA/guest_Eeng.dart';
import 'package:BetterNotes/subjects/ENGIDA/guest_Qeng.dart';
import 'package:BetterNotes/subjects/NSTP02/guest_Anst.dart';
import 'package:BetterNotes/subjects/NSTP02/guest_Enst.dart';
import 'package:BetterNotes/subjects/NSTP02/guest_Qnst.dart';
import 'package:BetterNotes/subjects/OBOPRO/guest_Aobo.dart';
import 'package:BetterNotes/subjects/OBOPRO/guest_Eobo.dart';
import 'package:BetterNotes/subjects/OBOPRO/guest_Qobo.dart';
import 'package:BetterNotes/subjects/PEDUC2/Aped_card.dart';
import 'package:BetterNotes/subjects/PEDUC2/guest_Aped_reader.dart';
import 'package:BetterNotes/subjects/PEDUC2/guest_Eped.dart';
import 'package:BetterNotes/subjects/PEDUC2/guest_Qped.dart';
import 'package:BetterNotes/subjects/PHENGR/guest_Aphe.dart';
import 'package:BetterNotes/subjects/PHENGR/guest_Ephe.dart';
import 'package:BetterNotes/subjects/PHENGR/guest_Qphe.dart';
import 'package:BetterNotes/subjects/PURCOM/guest_Apur.dart';
import 'package:BetterNotes/subjects/PURCOM/guest_Epur.dart';
import 'package:BetterNotes/subjects/PURCOM/guest_Qpur.dart';
import 'package:BetterNotes/subjects/TODO/todo_screen_guest.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class APEDGuestScreen extends StatefulWidget {
  final Color backgroundColor;
  const APEDGuestScreen({Key? key, required this.backgroundColor})
      : super(key: key);

  @override
  _APEDGuestScreenState createState() =>
      _APEDGuestScreenState(backgroundColor: AppStyle.mainColor);
}

class _APEDGuestScreenState extends State<APEDGuestScreen> {
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
                      "Guest Mode",
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
          TextButton(
            onPressed: () {
              _startNewGame();
              _interstitialAd1?.show();
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        GuestScreen(backgroundColor: backgroundColor)),
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
                          if (newValue == 'Assignments') {
                            _startNewGame();
                            _interstitialAd1?.show();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ACALGuestScreen(
                                      backgroundColor: backgroundColor)),
                            );
                          } else if (newValue == 'Quizzes') {
                            _startNewGame();
                            _interstitialAd1?.show();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => QCALGuestScreen(
                                      backgroundColor: backgroundColor)),
                            );
                          } else if (newValue == 'Exams') {
                            _startNewGame();
                            _interstitialAd1?.show();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ECALGuestScreen(
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
                            _interstitialAd1?.show();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AOBOGuestScreen(
                                      backgroundColor: backgroundColor)),
                            );
                          } else if (newValue == 'Quizzes') {
                            _startNewGame();
                            _interstitialAd1?.show();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => QOBOGuestScreen(
                                      backgroundColor: backgroundColor)),
                            );
                          } else if (newValue == 'Exams') {
                            _startNewGame();
                            _interstitialAd1?.show();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EOBOGuestScreen(
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
                            _interstitialAd1?.show();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AENGGuestScreen(
                                      backgroundColor: backgroundColor)),
                            );
                          } else if (newValue == 'Quizzes') {
                            _startNewGame();
                            _interstitialAd1?.show();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => QENGGuestScreen(
                                      backgroundColor: backgroundColor)),
                            );
                          } else if (newValue == 'Exams') {
                            _startNewGame();
                            _interstitialAd1?.show();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EENGGuestScreen(
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
                            _interstitialAd1?.show();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ADSTGuestScreen(
                                      backgroundColor: backgroundColor)),
                            );
                          } else if (newValue == 'Quizzes') {
                            _startNewGame();
                            _interstitialAd1?.show();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => QDSTGuestScreen(
                                      backgroundColor: backgroundColor)),
                            );
                          } else if (newValue == 'Exams') {
                            _startNewGame();
                            _interstitialAd1?.show();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EDSTGuestScreen(
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
                    const SizedBox(
                        width: 45, child: Icon(Icons.directions_run)),
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
                                  _interstitialAd1?.show();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => APEDGuestScreen(
                                            backgroundColor: backgroundColor)),
                                  );
                                } else if (newValue == 'Quizzes') {
                                  _startNewGame();
                                  _interstitialAd1?.show();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => QPEDGuestScreen(
                                            backgroundColor: backgroundColor)),
                                  );
                                } else if (newValue == 'Exams') {
                                  _startNewGame();
                                  _interstitialAd1?.show();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => EPEDGuestScreen(
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
              )),
          Row(
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
                                  builder: (context) => APURGuestScreen(
                                      backgroundColor: backgroundColor)),
                            );
                          } else if (newValue == 'Quizzes') {
                            _startNewGame();
                            _interstitialAd1?.show();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => QPURGuestScreen(
                                      backgroundColor: backgroundColor)),
                            );
                          } else if (newValue == 'Exams') {
                            _startNewGame();
                            _interstitialAd1?.show();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EPURGuestScreen(
                                      backgroundColor: backgroundColor)),
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
                            _interstitialAd1?.show();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ANSTGuestScreen(
                                      backgroundColor: backgroundColor)),
                            );
                          } else if (newValue == 'Quizzes') {
                            _startNewGame();
                            _interstitialAd1?.show();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => QNSTGuestScreen(
                                      backgroundColor: backgroundColor)),
                            );
                          } else if (newValue == 'Exams') {
                            _startNewGame();
                            _interstitialAd1?.show();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ENSTGuestScreen(
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
                            _interstitialAd1?.show();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ACHEGuestScreen(
                                      backgroundColor: backgroundColor)),
                            );
                          } else if (newValue == 'Quizzes') {
                            _startNewGame();
                            _interstitialAd1?.show();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => QCHEGuestScreen(
                                      backgroundColor: backgroundColor)),
                            );
                          } else if (newValue == 'Exams') {
                            _startNewGame();
                            _interstitialAd1?.show();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ECHEGuestScreen(
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
                            _interstitialAd1?.show();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AARTGuestScreen(
                                      backgroundColor: backgroundColor)),
                            );
                          } else if (newValue == 'Quizzes') {
                            _startNewGame();
                            _interstitialAd1?.show();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => QARTGuestScreen(
                                      backgroundColor: backgroundColor)),
                            );
                          } else if (newValue == 'Exams') {
                            _startNewGame();
                            _interstitialAd1?.show();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EARTGuestScreen(
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
                            _interstitialAd1?.show();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => APHEGuestScreen(
                                      backgroundColor: backgroundColor)),
                            );
                          } else if (newValue == 'Quizzes') {
                            _startNewGame();
                            _interstitialAd1?.show();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => QPHEGuestScreen(
                                      backgroundColor: backgroundColor)),
                            );
                          } else if (newValue == 'Exams') {
                            _startNewGame();
                            _interstitialAd1?.show();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EPHEGuestScreen(
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
                            builder: (context) => TODOGuestScreen(
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

  _APEDGuestScreenState({required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: _buildDrawer(context),
      backgroundColor: AppStyle.mainColor,
      appBar: AppBar(
        elevation: 0,
        title: const Text('PEDUC2'),
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
                        .collection('APEDnotes')
                        .snapshots()
                    : FirebaseFirestore.instance
                        .collection('APEDnotes')
                        .where('APEDnote_title',
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
                      if (note['APEDnote_title']
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
                                            APEDGuestReaderScreen(note)));
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
    );
  }
}
