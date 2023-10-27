import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:k_y_c_/digital_signature.dart';
import 'package:k_y_c_/nominee.dart';

class thirdpage_personal extends StatefulWidget {
  const thirdpage_personal({super.key});

  @override
  State<thirdpage_personal> createState() => _thirdpage_personalState();
}

class _thirdpage_personalState extends State<thirdpage_personal> {
      final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    int groupValue20=2;
    int groupValue10=2 ;
  @override
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
      body:
       SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
        children: [
           Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 25, right: 25, bottom: 8, top: 10),
                    child: Text("Tax Residency other than India?", textAlign: TextAlign.start),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 8),
                child: Container(
                  width: double.infinity,
                  child: CupertinoSlidingSegmentedControl<int>(
                    thumbColor:  Color.fromARGB(255, 4, 78, 73),
                    backgroundColor:Colors.white,
                    children: {
                      1: Text("Yes", style: _segmentTextStyle20(1)),
                      2: Text("No", style: _segmentTextStyle20(2)),
                     
                    },
                    onValueChanged: (value) {
                      setState(() => groupValue20 = value!);
                    },
                    groupValue: groupValue20,
                  ),
                ),
              ),
               Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 25, right: 25, bottom: 8, top: 10),
                    child: Text("I/WE Wish to Make a Nomination?", textAlign: TextAlign.start),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 8),
                child: Container(
                  width: double.infinity,
                  child: CupertinoSlidingSegmentedControl<int>(
                  thumbColor:  Color.fromARGB(255, 4, 78, 73),
                    backgroundColor:Colors.white,
                   children: {
                      1: Text("Yes", style: _segmentTextStyle10(1)),
                      2: Text("No", style: _segmentTextStyle10(2)),
                     
                    },
                    onValueChanged: (value) {
                      setState(() => groupValue10 = value!);
                   if (value == 1) {
          // Navigate to the nomination page
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => nominee()), // Replace with your nomination page
          );
        }
      },
                    groupValue: groupValue10,
                  ),
                ),
              ),  SizedBox(
                height: 55,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 25, right: 25, bottom: 8, top: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                  
                    OutlinedButton(
  style: OutlinedButton.styleFrom(
    backgroundColor: Color.fromARGB(255, 4, 78, 73),
  ),
  onPressed: () {
                             if (_formKey.currentState!.validate()) {
                           
                           
                          
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MyHomePage123(),
                                ),
                              );
                            
                          }
  },

  child: Text(
    'Next',
    style: TextStyle(color: Colors.white, fontSize: 18),
  ),
),

                  ],
                ),
        
              )
        ]
      ),
          ))
      );
  }
    void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }
   TextStyle _segmentTextStyle20(int value) {
    return TextStyle(
      fontSize: 12,
      color: groupValue20 == value ? Colors.white : Colors.black,
    );
  }
  TextStyle _segmentTextStyle10(int value) {
    return TextStyle(
      fontSize: 12,
      color: groupValue10 == value ? Colors.white : Colors.black,
    );
  }
}