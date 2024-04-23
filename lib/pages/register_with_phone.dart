import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:midnimo/components/customdialog%20.dart';
import 'package:midnimo/pages/home.dart';
import 'package:midnimo/pages/otp_verfication.dart';
import 'package:midnimo/utility/utilits.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterWithPhoneNumber extends StatefulWidget {
  const RegisterWithPhoneNumber({Key? key}) : super(key: key);

  @override
  _RegisterWithPhoneNumberState createState() =>
      _RegisterWithPhoneNumberState();
}

class _RegisterWithPhoneNumberState extends State<RegisterWithPhoneNumber> {
  final TextEditingController controller = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  _signInWithMobileNumber() async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: '+252' + controller.text.trim(),
        verificationCompleted: (PhoneAuthCredential authCredential) async {
          await _auth.signInWithCredential(authCredential).then((value) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Home()));
          });
        },
        verificationFailed: ((error) async {
          showDialog(
            context: context,
            builder: (context) => CustomDialog(
              title: "Verification failed",
              content: error.toString(),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          );
        }),
        codeSent: (String verificationId, [int? forceResendingToken]) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Otpverficationpage(
                verificationId: verificationId,
                number: controller.text,
              ),
            ),
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          verificationId = verificationId;
        },
        timeout: Duration(seconds: 45),
      );
    } catch (e) {
      print('Error during verification: $e');
    }
  }

  //pop up

  @override
  Widget build(BuildContext context) {
    bool _saving = false;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: _saving,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(30),
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/Messaging-cuate.png',
                    fit: BoxFit.cover, width: 280),
                SizedBox(height: 50),
                Text(
                  'REGISTER',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.grey.shade900),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 20),
                  child: Text(
                    'Enter your phone number to continue, we will send you OTP to verify.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.black.withOpacity(0.13)),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xffeeeeee),
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      InternationalPhoneNumberInput(
                        onInputChanged: (PhoneNumber number) {},
                        onInputValidated: (bool value) {
                          print(value);
                        },
                        selectorConfig: SelectorConfig(
                          selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                          showFlags: true,
                          useEmoji: true,
                        ),
                        countries: ['SO'],
                        ignoreBlank: false,
                        autoValidateMode: AutovalidateMode.disabled,
                        selectorTextStyle: TextStyle(color: Colors.black),
                        textFieldController: controller,
                        formatInput: false,
                        maxLength: 9,
                        keyboardType: TextInputType.numberWithOptions(
                            signed: true, decimal: true),
                        cursorColor: Colors.black,
                        inputDecoration: InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: 15, left: 0),
                          border: InputBorder.none,
                          hintText: 'Phone Number',
                          hintStyle: TextStyle(
                              color: Colors.grey.shade500, fontSize: 16),
                        ),
                        onSaved: (PhoneNumber number) {
                          print('On Saved: $number');
                        },
                      ),
                      Positioned(
                        left: 90,
                        top: 8,
                        bottom: 8,
                        child: Container(
                          height: 40,
                          width: 1,
                          color: Colors.black.withOpacity(0.13),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 100),
                MaterialButton(
                  minWidth: double.infinity,
                  onPressed: () async {
                    setState(() {
                      _saving = true; // Show the loading indicator
                    });

                    try {
                      await _signInWithMobileNumber();
                    } catch (e) {
                      print('Error during sign in: $e');
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              'An error occurred during sign-in. Please try again.'),
                        ),
                      );
                    }
                  },
                  color: Kmost_used,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: _saving
                      ? Container(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.white,
                            color: Kmost_used,
                            strokeWidth: 2,
                          ),
                        )
                      : Text("Request OTP",
                          style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
