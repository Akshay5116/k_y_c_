import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:k_y_c_/d_o_b.dart';
import 'package:k_y_c_/main.dart';
import 'package:k_y_c_/pancard.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class otp extends StatefulWidget {
  const otp({super.key});

  @override
  State<otp> createState() => _otpState();
}

class _otpState extends State<otp> {
  int mobileOTPTimerSeconds = 60;
  int emailOTPTimerSeconds = 60;

  String currentText = "";
  String currentText1 = "";
  Timer? mobileOTPTimer;
  Timer? emailOTPTimer;
  bool mobilevalidateOTP(String otp) {
    return otp == storage.read('mobile_otp').toString();
  }

  bool emailvalidateOTP(String otp) {
    return otp == storage.read('email_otp').toString();
  }

  void startTimers() {
    mobileOTPTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (mobileOTPTimerSeconds > 0) {
          mobileOTPTimerSeconds--;
        } else {
          timer.cancel();
          // Automatically navigate back after the timer expires
          Navigator.pop(context);
        }
      });
    });

    emailOTPTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (emailOTPTimerSeconds > 0) {
          emailOTPTimerSeconds--;
        } else {
          timer.cancel();
          // Automatically navigate back after the timer expires
          Navigator.pop(context);
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    startTimers(); // Start the timers when the OTP page opens
  }

  @override
  void dispose() {
    mobileOTPTimer?.cancel();
    emailOTPTimer?.cancel();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Container(
          height: 50,
          width: 200,
          child: Image.asset(
            'assets/logo6.png',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 16 /
                    9, // Adjust this ratio according to your image's aspect ratio
                child: Image.asset('assets/password.png'),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'OTP Verified',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color.fromARGB(255, 4, 78, 73)),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 25, right: 25, bottom: 8, top: 10),
                    child: Text('Enter Mobile Otp', textAlign: TextAlign.start),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 25, right: 25, bottom: 8, top: 10),
                child: PinCodeTextField(
                  enablePinAutofill: true,
                  cursorColor: Color.fromARGB(195, 4, 78, 73),
                  keyboardType: TextInputType.number,
                  appContext: context,
                  // animationCurve: Curves.linear,
                  // autoFocus: true,
                  length: 6, // Length of the Otp
                  onChanged: (value) {
                    setState(() {
                      currentText = value;
                    });
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 25,
                      right: 25,
                      bottom: 8,
                    ),
                    child: Text(
                      'Time Remaining for Mobile OTP: $mobileOTPTimerSeconds seconds',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 25, right: 25, bottom: 8, top: 10),
                    child: Text('Enter Email Otp', textAlign: TextAlign.start),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 25, right: 25, bottom: 8, top: 10),
                child: PinCodeTextField(
                  cursorColor: Color.fromARGB(195, 4, 78, 73),
                  keyboardType: TextInputType.number,
                  appContext: context,
                  // animationCurve: Curves.linear,
                  autoFocus: true,
                  length: 6, // Length of the Otp
                  onChanged: (value) {
                    setState(() {
                      currentText1 = value;
                    });
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 25,
                      right: 25,
                      bottom: 8,
                    ),
                    child: Text(
                      'Time Remaining for Email OTP: $emailOTPTimerSeconds seconds',
                      style: const TextStyle(
                        fontSize: 10,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () async {
                  bool isMobileOTPValid = mobilevalidateOTP(currentText);
                  bool isEmailOTPValid = emailvalidateOTP(currentText1);

                  if (isMobileOTPValid && isEmailOTPValid) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        duration: Duration(seconds: 2),
                        content: Text("OTP successfully verified."),
                        backgroundColor: Colors
                            .green, // You can customize the background color.
                      ),
                    );
                    await Future.delayed(Duration(seconds: 3));
                    // Both OTPs are valid, navigate to the next screen.
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => d_o_b()),
                    );
                  } else {
                    // Handle invalid OTPs, e.g., show error messages.
                    if (!isMobileOTPValid) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.red,
                          duration: Duration(seconds: 2),
                          content:
                              Text("Invalid Mobile OTP. Please try again."),
                        ),
                      );
                    }
                    if (!isEmailOTPValid) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.red,
                          duration: Duration(seconds: 2),
                          content: Text("Invalid Email OTP. Please try again."),
                        ),
                      );
                    }
                  }
                },
                child: Text("Verify OTP"),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(195, 4, 78, 73),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(90.0),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 80),
              Text(
                'Powered by ARHAMSHARE Pvt Ltd.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 10,
                  color: Color.fromARGB(255, 4, 78, 73),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  //  @override
  // void initState() {
  //   super.initState();
  //   startMobileOTPTimer();
  //   startEmailOTPTimer();
  // }

  // @override
  // void dispose() {
  //   mobileOTPTimer?.cancel();
  //   emailOTPTimer?.cancel();
  //   super.dispose();
  // }

  // // Function to start the mobile OTP timer
  // void startMobileOTPTimer() {
  //   mobileOTPTimer = Timer(Duration(seconds: 10), () {
  //     Navigator.pop(context); // Automatically navigate back after 10 seconds
  //   });
  // }

  // // Function to start the email OTP timer
  // void startEmailOTPTimer() {
  //   emailOTPTimer = Timer(Duration(seconds: 10), () {
  //     Navigator.pop(context); // Automatically navigate back after 10 seconds
  //   });
  // }
}
