import 'package:dom2/Components/Logo.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:dom2/Components/InputField.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PaperForm extends StatefulWidget {
  final Map<String, dynamic>? editData;

  const PaperForm({Key? key, this.editData}) : super(key: key);

  @override
  State<PaperForm> createState() => _PaperFormState();
}

class _PaperFormState extends State<PaperForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    print(widget.editData);
    print(widget);

    if (widget.editData != null) {
      _titleController.text = widget.editData!['title'];
      _textController.text = widget.editData!['text'];
      _selectedDate = widget.editData!['date'];
      rateYourDay = widget.editData!['rate'];
    }
  }

  int? rateYourDay;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _textController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void saveData() {
    if (widget.editData == null) {
      FirebaseFirestore.instance.collection('journals').add({
        'title': _titleController.text,
        'text': _textController.text,
        'date': _selectedDate,
        'rate': rateYourDay,
        'userID': _auth.currentUser!.uid,
      });
    } else {
      FirebaseFirestore.instance
          .collection('journals')
          .doc(widget.editData!['id'])
          .update({
        'title': _titleController.text,
        'text': _textController.text,
        'date': _selectedDate,
        'rate': rateYourDay,
        'userID': _auth.currentUser!.uid,
      });
    }
    Navigator.pushReplacementNamed(context, '/');
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
                border:
                    Border(bottom: BorderSide(width: 1, color: Colors.black))),
            margin: const EdgeInsets.only(bottom: 20),
            child: const Center(
              child: Logo(
                path: 'assets/Images/logo2.png',
              ),
            ),
          ),
          InputField(
            errorMessage: "Email field cannot be empty",
            isSecure: false,
            placeholder: "Title",
            pt: 20,
            pb: 12,
            controller: _titleController,
          ),
          InputField(
            errorMessage: "Text cant be empty",
            isSecure: false,
            placeholder: "Text",
            pb: 12,
            lines: 20,
            controller: _textController,
          ),
          CalendarDatePicker(
              initialDate: _selectedDate,
              firstDate: DateTime.parse("2010-02-27"),
              lastDate: DateTime.parse("2040-02-27"),
              onDateChanged: (DateTime date) =>
                  {setState(() => _selectedDate = date)}),
          const Text("Rate your day"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Radio(
                value: 0,
                groupValue: rateYourDay,
                onChanged: (val) => {setState(() => rateYourDay = val)},
              ),
              const Text(
                'Bad',
                style: TextStyle(fontSize: 16.0),
              ),
              Radio(
                value: 1,
                groupValue: rateYourDay,
                onChanged: (val) => {setState(() => rateYourDay = val)},
              ),
              const Text(
                'Basic',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              Radio(
                value: 2,
                groupValue: rateYourDay,
                onChanged: (val) => {setState(() => rateYourDay = val)},
              ),
              const Text(
                'Great',
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  surfaceTintColor: Colors.white,
                  shadowColor: Colors.transparent,
                  minimumSize: const Size.fromHeight(45), // NEW
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20)),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Process data.
                  saveData();
                }
              },
              child: Text(widget.editData == null ? 'Add' : 'Update'),
            ),
          ),
        ],
      ),
    );
  }
}
