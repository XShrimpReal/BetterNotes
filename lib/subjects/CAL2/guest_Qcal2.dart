import 'package:BetterNotes/screens/home_screen.dart';
import 'package:BetterNotes/screens/home_screen_admin.dart';
import 'package:BetterNotes/screens/home_screen_guest.dart';
import 'package:BetterNotes/screens/settings.dart';
import 'package:BetterNotes/style/app_style.dart';
import 'package:BetterNotes/subjects/CAL2/Acal_card.dart';
import 'package:BetterNotes/subjects/CAL2/admin_Acal2.dart';
import 'package:BetterNotes/subjects/CAL2/admin_Ecal2.dart';
import 'package:BetterNotes/subjects/CAL2/admin_Qcal2.dart';
import 'package:BetterNotes/subjects/CAL2/guest_Qcal2_reader.dart';
import 'package:BetterNotes/subjects/CHENGR/guest_Ache.dart';
import 'package:BetterNotes/subjects/CHENGR/guest_Eche.dart';
import 'package:BetterNotes/subjects/CHENGR/guest_Qche.dart';
import 'package:BetterNotes/subjects/DSTRU1/admin_Adst.dart';
import 'package:BetterNotes/subjects/DSTRU1/admin_Edst.dart';
import 'package:BetterNotes/subjects/DSTRU1/admin_Qdst.dart';
import 'package:BetterNotes/subjects/ENGIDA/admin_Aeng.dart';
import 'package:BetterNotes/subjects/ENGIDA/admin_Eeng.dart';
import 'package:BetterNotes/subjects/ENGIDA/admin_Qeng.dart';
import 'package:BetterNotes/subjects/NSTP02/guest_Anst.dart';
import 'package:BetterNotes/subjects/NSTP02/guest_Enst.dart';
import 'package:BetterNotes/subjects/NSTP02/guest_Qnst.dart';
import 'package:BetterNotes/subjects/OBOPRO/admin_Aobo.dart';
import 'package:BetterNotes/subjects/OBOPRO/admin_Eobo.dart';
import 'package:BetterNotes/subjects/OBOPRO/admin_Qobo.dart';
import 'package:BetterNotes/subjects/PEDUC2/admin_Aped.dart';
import 'package:BetterNotes/subjects/PEDUC2/admin_Eped.dart';
import 'package:BetterNotes/subjects/PEDUC2/admin_Qped.dart';
import 'package:BetterNotes/subjects/PURCOM/guest_Apur.dart';
import 'package:BetterNotes/subjects/PURCOM/guest_Epur.dart';
import 'package:BetterNotes/subjects/PURCOM/guest_Qpur.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QCALGuestScreen extends StatefulWidget {
  final Color backgroundColor;
  const QCALGuestScreen({Key? key, required this.backgroundColor})
      : super(key: key);

  @override
  _QCALGuestScreenState createState() =>
      _QCALGuestScreenState(backgroundColor: AppStyle.mainColor);
}

class _QCALGuestScreenState extends State<QCALGuestScreen> {
  final Color backgroundColor;
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _selectedOption = 'Calculus 2';
  String _selectedOption2 = 'OBOPRO';
  String _selectedOption3 = 'ENGIDA';
  String _selectedOption4 = 'DSTRU1';
  String _selectedOption5 = 'PEDUC2';
  String _selectedOption6 = 'PURCOM';
  String _selectedOption7 = 'NSTP02';
  String _selectedOption8 = 'CHENGR';
  String _selectedOption9 = 'ARTAPP';
  String _selectedOption10 = 'PHENGR';

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
      elevation: 0,
      backgroundColor: const Color(0xFFe8d1c5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 45, child: Icon(Icons.lock)),
              Flexible(
                child: TextButton(
                  onPressed: _showLoginDialog,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Login",
                        style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 45, child: Icon(Icons.calculate_outlined)),
              Flexible(
                child: _selectedOption == ''
                    ? Text(
                        'Calculus 2',
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AdminCALScreen(
                                      backgroundColor: backgroundColor)),
                            );
                          } else if (newValue == 'Quizzes') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => QCALAdminCALScreen(
                                      backgroundColor: backgroundColor)),
                            );
                          } else if (newValue == 'Exams') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ECALAdminCALScreen(
                                      backgroundColor: backgroundColor)),
                            );
                          }
                        },
                        items: <String>[
                          'Calculus 2',
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AdminOBOScreen(
                                      backgroundColor: backgroundColor)),
                            );
                          } else if (newValue == 'Quizzes') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => QOBOAdminCALScreen(
                                      backgroundColor: backgroundColor)),
                            );
                          } else if (newValue == 'Exams') {
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AdminENGScreen(
                                      backgroundColor: backgroundColor)),
                            );
                          } else if (newValue == 'Quizzes') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => QENGAdminCALScreen(
                                      backgroundColor: backgroundColor)),
                            );
                          } else if (newValue == 'Exams') {
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AdminDSTScreen(
                                      backgroundColor: backgroundColor)),
                            );
                          } else if (newValue == 'Quizzes') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => QDSTAdminCALScreen(
                                      backgroundColor: backgroundColor)),
                            );
                          } else if (newValue == 'Exams') {
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AdminPEDScreen(
                                      backgroundColor: backgroundColor)),
                            );
                          } else if (newValue == 'Quizzes') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => QPEDAdminCALScreen(
                                      backgroundColor: backgroundColor)),
                            );
                          } else if (newValue == 'Exams') {
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => APURGuestScreen(
                                      backgroundColor: backgroundColor)),
                            );
                          } else if (newValue == 'Quizzes') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => QPURGuestScreen(
                                      backgroundColor: backgroundColor)),
                            );
                          } else if (newValue == 'Exams') {
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ANSTGuestScreen(
                                      backgroundColor: backgroundColor)),
                            );
                          } else if (newValue == 'Quizzes') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => QNSTGuestScreen(
                                      backgroundColor: backgroundColor)),
                            );
                          } else if (newValue == 'Exams') {
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ACHEGuestScreen(
                                      backgroundColor: backgroundColor)),
                            );
                          } else if (newValue == 'Quizzes') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => QCHEGuestScreen(
                                      backgroundColor: backgroundColor)),
                            );
                          } else if (newValue == 'Exams') {
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GuestScreen(
                                      backgroundColor: backgroundColor)),
                            );
                          } else if (newValue == 'Quizzes') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GuestScreen(
                                      backgroundColor: backgroundColor)),
                            );
                          } else if (newValue == 'Exams') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GuestScreen(
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GuestScreen(
                                      backgroundColor: backgroundColor)),
                            );
                          } else if (newValue == 'Quizzes') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GuestScreen(
                                      backgroundColor: backgroundColor)),
                            );
                          } else if (newValue == 'Exams') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GuestScreen(
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
          )
        ],
      ),
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  _QCALGuestScreenState({required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: _buildDrawer(context),
      backgroundColor: AppStyle.mainColor,
      appBar: AppBar(
        elevation: 0,
        title: const Text('CALCULUS 2 (Admin)'),
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
          IconButton(
            icon: const Icon(Icons.arrow_back_sharp),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          HomeScreen(backgroundColor: backgroundColor)));
            },
          ),
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
                  "Exams",
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
                        .collection('QCALnotes')
                        .snapshots()
                    : FirebaseFirestore.instance
                        .collection('QCALnotes')
                        .where('QCALnote_title',
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
                      if (note['QCALnote_title']
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
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            QCALGuestReaderScreen(note)));
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
