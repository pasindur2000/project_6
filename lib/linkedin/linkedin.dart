import 'package:flutter/material.dart';

class Linkedin extends StatefulWidget {
  const Linkedin({Key? key}) : super(key: key);

  @override
  State<Linkedin> createState() => _LinkedinState();
}

class _LinkedinState extends State<Linkedin> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0),
      height: 60,
      child: IconButton(
        icon: Image.asset('assets/images/X_Logo.png'), // Replaced ImageIcon with Image.asset
        iconSize: 10.0,
        onPressed: () async {
          // Your onPressed logic here
        },
      ),
    );
  }
}
