import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return
      const Padding(
        padding: EdgeInsets.only(top: 40, bottom: 20),
        child: Image(image: AssetImage('assets/Images/logo.png')),
      );
  }
}