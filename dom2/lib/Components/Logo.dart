import 'package:flutter/material.dart';

class Logo extends StatefulWidget {
  const Logo({
    super.key,
    this.path = 'assets/Images/logo.png',
  });

  final String path;

  @override
  State<Logo> createState() => _LogoState();


}

class _LogoState extends State<Logo> {
  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: EdgeInsets.only(top: 40, bottom: 20),
        child: Image(image: AssetImage(widget.path)),
      );
  }
}