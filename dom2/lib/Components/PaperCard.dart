import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PaperCard extends StatefulWidget {
  const PaperCard(
      {super.key,
      this.path = 'assets/Images/logo.png',
      required this.title,
      required this.text,
      required this.date,
      required this.rate});

  final String path;
  final String text;
  final String title;
  final DateTime date;
  final int rate;

  @override
  State<PaperCard> createState() => _PaperCardState();
}

class _PaperCardState extends State<PaperCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 0, bottom: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                  "${widget.date.year}-${widget.date.month}-${widget.date.day}",
                ),
                Text(
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                    widget.rate == 0
                        ? 'Bad'
                        : widget.rate == 1
                            ? 'good'
                            : widget.rate == 2
                                ? 'great'
                                : 'undefined'),
              ],
            ),
            Text(
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 26),
                widget.title),
            Text(
                style: const TextStyle(color: Colors.black, fontSize: 18),
                widget.text),
            Container(
              margin: EdgeInsets.only(top: 30, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.40,
                        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                        decoration:
                        BoxDecoration(
                            border: Border.all(color: Colors.black,width: 1)
                        ),
                        child: const Text('Edit',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.center),
                      ),
                      onTap: () => {}),
                  InkWell(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.40,
                        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                        decoration:
                        BoxDecoration(
                            border: Border.all(color: Colors.red,width: 1)
                        ),
                        child: const Text('Delete',
                            style: TextStyle(
                              color: Colors.red,
                            ),
                            textAlign: TextAlign.center),
                      ),
                      onTap: () => {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
