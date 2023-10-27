import 'package:flutter/material.dart';
class sign_up extends StatefulWidget {
  const sign_up({super.key});

  @override
  State<sign_up> createState() => _sign_upState();
}

class _sign_upState extends State<sign_up> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: AppBar(
        foregroundColor: Colors.black,
        centerTitle: true, elevation: 0,
        backgroundColor: Colors.transparent,
        title:
        Container(
              height: 50,
              width: 200,
              child: Image.asset(
                'assets/logo6.png',
              )),
      ),
      body: Center(
        child: Column(
          children: [
             Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    'Sign Up To ArhamShare',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}