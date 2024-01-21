import 'package:dom2/CustomWidgets/PaperForm.dart';
import 'package:dom2/Screens/CEPaper.dart';
import 'package:dom2/Screens/Register.dart';
import 'package:dom2/Screens/SignIn.dart';
import 'package:dom2/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'Components/InputField.dart';
import 'Components/PaperCard.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const MainListScreen(),
        '/login': (context) => const SignIn(),
        '/register': (context) => const Register(),
      },
    );
  }
}

class MainListScreen extends StatefulWidget {
  const MainListScreen({super.key});

  @override
  MainListScreenState createState() => MainListScreenState();
}

class MainListScreenState extends State<MainListScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;

  @override
  void initState() {
    super.initState();

    _user = _auth.currentUser;
    if (_user == null) {
      _navigateToLogin();
    }
  }

  void _navigateToLogin() {
    Future.delayed(Duration.zero, () {
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  void _navigateToRegister() {
    Future.delayed(Duration.zero, () {
      Navigator.pushReplacementNamed(context, '/register');
    });
  }

  void _signOut() async {
    await _auth.signOut();
    _user = null;
    _navigateToLogin();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    final TextEditingController _searchController = TextEditingController();

    // return const CEPaper();
    // RETURN A LIST OF JOURNALS
    return Scaffold(
      appBar: AppBar(
        title: Form(
            key: _formKey,
            child: InputField(
              errorMessage: "Text cant be empty",
              isSecure: false,
              placeholder: "Search",
              pb: 0,
              lines: 1,
              controller: _searchController,
            )),
        actions: [
          IconButton(
            onPressed: _signOut,
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('journals')
            .where('userID', isEqualTo: _user?.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<QueryDocumentSnapshot> documents = snapshot.data!.docs;
            return ListView.builder(
              padding: const EdgeInsets.only(bottom: 90),
              itemCount: documents.length,
              itemBuilder: (context, index) {
                final Map<String, dynamic> data =
                documents[index].data() as Map<String, dynamic>;
                return
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: PaperCard(
                        title: data['title'],
                        text: data['text'],
                        date: data['date'].toDate(),
                        rate: data['rate']),
                  );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CEPaper(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
