import 'package:flutter/material.dart';
import 'dart:math';
import 'package:project_6/Login%20Signup/Screens/homepage.dart';

class PhoneAuthentication extends StatefulWidget {
  const PhoneAuthentication({super.key});

  @override
  State<PhoneAuthentication> createState() => _PhoneAuthenticationState();
}

class _PhoneAuthenticationState extends State<PhoneAuthentication> {
  TextEditingController phoneController = TextEditingController();
  bool isLoading = false; // Fixed typo from `isLoadin` to `isLoading`
  late String generatedOtp;
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
        onPressed: () {
          // Open the dialog box to enter the phone number and OTP
          showDialogBox(context);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, // Center horizontally
          crossAxisAlignment: CrossAxisAlignment.center, // Center vertically
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Image.network(
                "https://static.vecteezy.com/system/resources/thumbnails/010/829/986/small/phone-icon-in-trendy-flat-style-free-png.png",
                height: 32,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              "Sign in with Phone",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }

  void showDialogBox(BuildContext context) {
    generatedOtp = generateOtp();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(),
                      const Text(
                        "Phone Authentication",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.close),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: phoneController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: "Enter the OTP",
                      labelText: "Enter the OTP",
                      errorText: errorMessage,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'OTP code: $generatedOtp',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  isLoading
                      ? const CircularProgressIndicator()
                      : ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green),
                    onPressed: () {
                      setState(() {
                        isLoading = true;
                      });
                      // Simulate OTP verification
                      Future.delayed(const Duration(seconds: 2), () {
                        if (phoneController.text == generatedOtp) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ),
                          );
                        } else {
                          // Show error if OTP doesn't match
                          setState(() {
                            errorMessage = "Invalid OTP";
                            isLoading = false;
                          });
                        }
                      });
                    },
                    child: const Text(
                      "Submit",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  String generateOtp() {
    var random = Random();
    var otp = random.nextInt(9000) + 1000; // Generate a 4-digit OTP
    return otp.toString();
  }
}
