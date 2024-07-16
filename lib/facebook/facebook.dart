import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sign_button/sign_button.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:status_alert/status_alert.dart';
import '../Login Signup/Screens/homepage.dart';

class FacebookAuthentication extends StatefulWidget {
  const FacebookAuthentication({super.key});

  @override
  State<FacebookAuthentication> createState() => _FacebookAuthenticationState();
}

class _FacebookAuthenticationState extends State<FacebookAuthentication> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0),
      height: 70,
      child: IconButton(
        icon: Icon(Icons.facebook),
        iconSize: 50.0,
        onPressed: () async {
          try {
            final UserCredential userCredential = await signInWithFacebook();
            if (context.mounted) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
              );
            }
          } catch (e) {
            StatusAlert.show(context,
                duration: const Duration(seconds: 3),
                title: 'User Authentication',
                subtitle: e.toString(),
                configuration: const IconConfiguration(
                    icon: Icons.close, color: Colors.red),
                maxWidth: 360);
          }
        },
      ),
    );
  }

  Future<UserCredential> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();
    final OAuthCredential facebookAuthCredential =
    FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }
}
