import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hiring/Login/otp.dart';

import 'package:hiring/controller/loadingController.dart';

class Method {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController phoneNumber = TextEditingController();
  String otpCode = "";

  bool isLoading = false;

  String? verificationId;
  Future<void> phoneSignIn({required String phoneNumber}) async {
    await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: _onVerificationCompleted,
        verificationFailed: _onVerificationFailed,
        codeSent: _onCodeSent,
        codeAutoRetrievalTimeout: _onCodeTimeout);
  }

  Future<void> phoneSignInWeb({required String phoneNumber}) async {
    await _auth
        .signInWithPhoneNumber(
          phoneNumber,
          // RecaptchaVerifier(
          //   container: 'recaptcha',
          //   size: RecaptchaVerifierSize.compact,
          //   theme: RecaptchaVerifierTheme.dark,
          // ),
        )
        .whenComplete(() => print("Completed"));
  }

  _onVerificationCompleted(PhoneAuthCredential authCredential) async {
    print("verification completed ${authCredential.smsCode}");
    User? user = FirebaseAuth.instance.currentUser;

    this.otpCode = authCredential.smsCode!;

    if (authCredential.smsCode != null) {
      try {
        UserCredential credential =
            await user!.linkWithCredential(authCredential);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'provider-already-linked') {
          await _auth.signInWithCredential(authCredential);
        }
      }

      Loading.isClicked.value = false;
      Get.to(() => const OtpScreen(
            title: "otp",
          ));
//Navigation
      // Navigator.pushNamedAndRemoveUntil(
      //     context, Constants.homeNavigate, (route) => false);
    }
  }

  _onVerificationFailed(FirebaseAuthException exception) {
    if (exception.code == 'invalid-phone-number') {
      // showMessage(
      //   "The phone number entered is invalid!",
      // );
      Fluttertoast.showToast(msg: "The phone number entered is invalid!");
    }
  }

  _onCodeSent(String verificationId, int? forceResendingToken) {
    this.verificationId = verificationId;
    print(forceResendingToken);
    print("code sent");
  }

  _onCodeTimeout(String timeout) {
    return null;
  }

  void showMessage(String errorMessage, BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext builderContext) {
          return AlertDialog(
            title: Text("Error"),
            content: Text(errorMessage),
            actions: [
              TextButton(
                child: Text("Ok"),
                onPressed: () async {
                  Navigator.of(builderContext).pop();
                },
              )
            ],
          );
        }).then((value) {
      Loading.isClicked.value = false;
    });
  }
}
