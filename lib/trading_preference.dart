import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:k_y_c_/manual_upload_bank.dart';

class trading_preference extends StatefulWidget {
  const trading_preference({super.key});

  @override
  State<trading_preference> createState() => _trading_preferenceState();
}

class _trading_preferenceState extends State<trading_preference> {
 bool areTradingPreferencesSelected() {
  return selectedValues.length >= 2;
}


   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int groupValue1=1 ;
  int groupValue2=2 ;
  List<String> selectedValues = ['BSE', 'NSE'];

  List<String> radioOptions = ['BSE', 'NSE', 'NSEFNO', 'NSECD', 'MFBSE'];
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
      body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Trading Preference',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color.fromARGB(255, 4, 78, 73)),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 25, right: 25, bottom: 8, top: 10),
                  child: Text('Client Code / Sub-Broker Code',
                      textAlign: TextAlign.start),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 8),
              child: TextFormField(
                initialValue: 'Main',
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter Your Client Code / Sub-Broker Code';
                  } else {
                    return null;
                  }
                },
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(8),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Enter Your Client Code / Sub-Broker Code',
                  prefixIcon: Icon(
                    Icons.account_box_sharp,
                    color: Colors.black,
                  ),
                ),
                cursorColor: Colors.black,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 25, right: 25, bottom: 8, top: 10),
                  child: Text("Select Introducer", textAlign: TextAlign.start),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 8),
              child: Container(
                width: double.infinity,
                child: CupertinoSlidingSegmentedControl<int>(
                thumbColor: Color.fromARGB(255, 4, 78, 73),
                  backgroundColor: Colors.white,
                   children: {
                      1: Text("Client", style: _segmentTextStyle(1)),
                      2: Text("Sub / Broker", style: _segmentTextStyle(2)),
                       3: Text("Branch / R M / R O", style: _segmentTextStyle(3)),
                     
                    },
                  onValueChanged: (value) {
                    setState(() => groupValue1 = value!);
                  },
                  groupValue: groupValue1,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 25, right: 25, bottom: 8, top: 10),
                  child:
                      Text("Choose a Leverage Plan", textAlign: TextAlign.start),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 8),
              child: Container(
                width: double.infinity,
                child: CupertinoSlidingSegmentedControl<int>(
                  thumbColor: Color.fromARGB(255, 4, 78, 73),
                  backgroundColor: Colors.white,
                 children: {
                      1: Text("Freedom(111)", style: _segmentTextStyle1(1)),
                      2: Text("LifeTime", style: _segmentTextStyle1(2)),
                       3: Text("IPO", style: _segmentTextStyle1(3)),
                     
                    },
                  onValueChanged: (value) {
                    setState(() => groupValue2 = value!);
                  },
                  groupValue: groupValue2,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 25, right: 25, bottom: 8, top: 10),
                  child: Text("Trading Preference", textAlign: TextAlign.start),
                ),
              ],
            ),
           Padding(
  padding: const EdgeInsets.only(left: 25, right: 25),
  child: Column(
    children: radioOptions.map((option) {
      return Row(
        children: <Widget>[
          Checkbox(
            activeColor: Color.fromARGB(255, 4, 78, 73),
            value: selectedValues.contains(option),
            onChanged: (isSelected) {
              setState(() {
                if (isSelected == true) {
                  selectedValues.add(option);
                } else {
                  selectedValues.remove(option);
                }
              });
            },
          ),
          SizedBox(width: 4.0), // Add spacing between the checkbox and text
          Expanded(
            child: Text(
              option,
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 12.0),
            ),
          )
        ],
      );
    }).toList(),
  ),
),

            SizedBox(
                  height: 15,
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
                              backgroundColor: Color.fromARGB(255, 4, 78, 73)),
                          onPressed: () {
                             if (_formKey.currentState!.validate()) {
                           
                             if (!areTradingPreferencesSelected()) {
      // Show a Snackbar for not selecting trading preferences
      _showSnackBar(
        context,
        "Please select at least Two trading preference",
      );
    } 
                            
                            
                            else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => manual_upload_bank(),
                                ),
                              );
                            }
                          }

                            
                          // }
                        },
                          child: Text(
                            'Next',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          )),
                    ],
                  ),
                )
          ],
        ),
      ),
      )
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
   TextStyle _segmentTextStyle(int value) {
    return TextStyle(
      fontSize: 12,
      color: groupValue1 == value ? Colors.white : Colors.black,
    );
  }
  TextStyle _segmentTextStyle1(int value) {
    return TextStyle(
      fontSize: 12,
      color: groupValue2 == value ? Colors.white : Colors.black,
    );
  }
}
