import 'package:dom2/Components/PaperCard.dart';
import 'package:dom2/CustomWidgets/RegisterForm.dart';
import 'package:flutter/material.dart';

import '../Components/InputField.dart';

class MainList extends StatefulWidget {
  const MainList({super.key});

  @override
  State<MainList> createState() => _MainListState();
}

class _MainListState extends State<MainList> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: EdgeInsets.only(top: 40, bottom: 40, left: 21, right: 21),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Form(
                    key: _formKey,
                    child: InputField(
                      errorMessage: "Text cant be empty",
                      isSecure: false,
                      placeholder: "Search",
                      pb: 12,
                      lines: 1,
                      controller: _searchController,
                    )),
                Column(
                  children: [
                      // PaperCard(title: '', text: 'asd', date: DateTime.parse('2020'), rate: 1),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
