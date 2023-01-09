import 'package:BetterNotes/screens/home_screen_admin.dart';
import 'package:BetterNotes/screens/home_screen_guest.dart';
import 'package:BetterNotes/screens/note_editor.dart';
import 'package:BetterNotes/screens/note_reader.dart';
import 'package:BetterNotes/screens/settings.dart';
import 'package:BetterNotes/style/app_style.dart';
import 'package:BetterNotes/widgets/notes_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';

class HomeScreen extends StatefulWidget {
  final Color backgroundColor;
  const HomeScreen({Key? key, required this.backgroundColor}) : super(key: key);

  @override
  _HomeScreenState createState() =>
      _HomeScreenState(backgroundColor: AppStyle.mainColor);
}

class _HomeScreenState extends State<HomeScreen> {
  final Color backgroundColor;
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  // InterstitialAd? _interstitialAd;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   loadInterstitial();
  // }

  // void loadInterstitial() {
  //   var platform = Theme.of(context).platform;
  //   String interstitialAd = platform == TargetPlatform.android ? "" : "";
  //   InterstitialAd.load(
  //       adUnitId: interstitialAd,
  //       request: AdRequest(),
  //       adLoadCallback: InterstitialAdLoadCallback(
  //         onAdLoaded: (InterstitialAd ad) {
  //           // Keep a reference to the ad so you can show it later.
  //           _interstitialAd = ad;
  //         },
  //         onAdFailedToLoad: (LoadAdError error) {
  //           print('InterstitialAd failed to load: $error');
  //         },
  //       ));
  // }

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
            Flexible(
                child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        AdminScreen(backgroundColor: backgroundColor),
                  ),
                );
              },
              style:
                  ElevatedButton.styleFrom(backgroundColor: Color(0xFF463F3B)),
              child: const Text('ADMIN'),
            )),
            Flexible(
                child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        GuestScreen(backgroundColor: backgroundColor),
                  ),
                );
              },
              style:
                  ElevatedButton.styleFrom(backgroundColor: Color(0xFF463F3B)),
              child: const Text('GUEST'),
            )),
            Flexible(
                child: ElevatedButton(
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
              style:
                  ElevatedButton.styleFrom(backgroundColor: Color(0xFF463F3B)),
              child: const Text('LOGIN'),
            )),
          ],
        );
      },
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  _HomeScreenState({required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppStyle.mainColor,
      appBar: AppBar(
        elevation: 0,
        title: const Text('Better Notes'),
        centerTitle: true,
        backgroundColor: AppStyle.mainColor,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: _showLoginDialog,
                  icon: const Icon(Icons.supervised_user_circle_outlined)),
            ],
          ),
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
            Row(
              children: [
                Text(
                  "Your recent Notes",
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
                    ? FirebaseFirestore.instance.collection('notes').snapshots()
                    : FirebaseFirestore.instance
                        .collection('notes')
                        .where('note_title',
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
                      if (note['note_title']
                          .toString()
                          .toUpperCase()
                          .contains(_searchController.text.toUpperCase())) {
                        matchingNotes.add(note);
                      }
                    }

                    return GridView.count(
                      crossAxisCount: 2,
                      children: snapshot.data!.docs
                          .map((note) => noteCard(() {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            NoteReaderScreen(note)));
                              }, note))
                          .toList(),
                    );
                  }
                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const NoteEditorScreen()));
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
