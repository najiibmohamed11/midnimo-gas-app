import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:midnimo/pages/home.dart';
import 'package:midnimo/utility/utilits.dart';
import 'package:pinput/pinput.dart';


class Otpverficationpage extends StatelessWidget {
  final String number;
  final String verificationId;
  

  Otpverficationpage(
      {Key? key, required this.number, required this.verificationId})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 60,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Colors.white,
      ),
      decoration: BoxDecoration(
        color: Kmost_used,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.transparent),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Kmost_used,
        title: const Text('OTP TextField'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Container(
          margin: const EdgeInsets.only(top: 40),
          width: double.infinity,
          child: Column(
            children: [
              const Text(
                "Verification",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 40),
                child: const Text(
                  "Enter the code sent to your number",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 40),
                child: Text(
                  "+252 $number",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
              Pinput(
                length: 6,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: defaultPinTheme.copyWith(
                  decoration: defaultPinTheme.decoration!.copyWith(
                    border: Border.all(color: Colors.green),
                  ),
                ),
                onCompleted: (pin) async {
                               FirebaseAuth auth = FirebaseAuth.instance;
                              PhoneAuthCredential _credential =
                                  PhoneAuthProvider.credential(
                                      verificationId: verificationId,
                                      smsCode: pin);
                              auth
                                  .signInWithCredential(_credential)
                                  .then((result) {
                                if (result != null) {
                                  Navigator.pop(context);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Home()));
                                }
                              }).catchError((e) {
                                print(e);
                              });
            
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
