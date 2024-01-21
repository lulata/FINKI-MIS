import 'package:dom2/CustomWidgets/PaperForm.dart';
import 'package:flutter/material.dart';

class CEPaper extends StatefulWidget {
  final Map<String, dynamic>? editData;

  CEPaper({Key? key, this.editData}) : super(key: key);

  @override
  State<CEPaper> createState() => _CEPaperState();
}

class _CEPaperState extends State<CEPaper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: BackButton(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: EdgeInsets.only(top: 40, bottom: 40, left: 21, right: 21),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                PaperForm(editData: widget.editData),
              ],
            ),
          ),
        ));
  }
}
