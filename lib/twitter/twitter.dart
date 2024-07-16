import 'package:flutter/material.dart';

class TwitterAuth extends StatefulWidget {
  const TwitterAuth({Key? key}) : super(key: key);

  @override
  State<TwitterAuth> createState() => _TwitterAuthState();
}

class _TwitterAuthState extends State<TwitterAuth> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0),
      height: 60,
      child: IconButton(
        icon: Image.asset('assets/images/linkedin.png'), // Replaced ImageIcon with Image.asset
        iconSize: 20.0,
        onPressed: () async {
          // Your onPressed logic here
        },
      ),
    );
  }
}
