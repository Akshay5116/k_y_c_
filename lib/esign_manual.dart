import 'package:flutter/material.dart';
import 'package:k_y_c_/proceed_digital_esign.dart';

class esign_manual extends StatefulWidget {
  const esign_manual({super.key});

  @override
  State<esign_manual> createState() => _esign_manualState();
}

class _esign_manualState extends State<esign_manual> {
  List<String> selectedValues = [ 'I hereby consent to use my adhar (UID) for authenticating/e-signing and completing account opening process with Arham share Pvt Ltd. under ekyc subject to policy, procedure, terms and conditions laid by it so hereby i consent to use my adhar to perform e-kyc & generate electronic signature & affix same to my application & documents which i have reviewed & approved for submission \n I have read, understood and agree to the terms of use and other terms and conditions laid out by Arham.',];
  List<String> radioOptions = [
    'I hereby consent to use my adhar (UID) for authenticating/e-signing and completing account opening process with Arham share Pvt Ltd. under ekyc subject to policy, procedure, terms and conditions laid by it so hereby i consent to use my adhar to perform e-kyc & generate electronic signature & affix same to my application & documents which i have reviewed & approved for submission \n I have read, understood and agree to the terms of use and other terms and conditions laid out by Arham.',
  ];
  List<String> selectedValues1 = [
     'I/We wish to instruct DP to accept all the pledge instructions in my/our account without any further instructions from my/our end.',
    'I/We instruct DP to receive each and every credit in my/our Account.',
    'I/We would like  to share the email id with RTA.',
    'I/We would like to recieve Annual reports through electronic mode.',
    'I/We wish to  to receive dividend/interest directly into my bank account through ECS.',
    'I/We would like to receive account statement as per SEBI regulations.',
    ' I/we wish you to send Electronic Transaction Cum Holding statement with other required documents on the registered email id.'
  ];
  List<String> radioOptions1 = [
    'I/We wish to instruct DP to accept all the pledge instructions in my/our account without any further instructions from my/our end.',
    'I/We instruct DP to receive each and every credit in my/our Account.',
    'I/We would like  to share the email id with RTA.',
    'I/We would like to recieve Annual reports through electronic mode.',
    'I/We wish to  to receive dividend/interest directly into my bank account through ECS.',
    'I/We would like to receive account statement as per SEBI regulations.',
    ' I/we wish you to send Electronic Transaction Cum Holding statement with other required documents on the registered email id.'
  ];
  bool areAllCheckboxesSelected() {
    // Check if all checkboxes in both lists are selected
    return selectedValues.length == radioOptions.length &&
        selectedValues1.length == radioOptions1.length;
  }

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
        child: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Esign OR Manual',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Color.fromARGB(255, 4, 78, 73)),
                textAlign: TextAlign.center,
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
                  child: Text("Aadhar Consent", textAlign: TextAlign.start),
                ),
              ],
            ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 25, right: 25),
            //   child: Column(
            //     children: radioOptions
            //         .map(
            //           (option) => Container(
            //             height: 50,
            //             padding: EdgeInsets.symmetric(vertical: 0.5),
            //             child: CheckboxListTile(
            //               activeColor: Color.fromARGB(255, 4, 78, 73),
            //               title: Text(
            //                 option,
            //                 style: TextStyle(fontSize: 12.0),
            //               ),
            //               value: selectedValues.contains(option),
            //               onChanged: (isSelected) {
            //                 setState(() {
            //                   if (isSelected == true) {
            //                     selectedValues.add(option);
            //                   } else {
            //                     selectedValues.remove(option);
            //                   }
            //                 });
            //               },
            //             ),
            //           ),
            //         )
            //         .toList(),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Column(
                children: radioOptions.map((option) {
                  return Row(
                    // mainAxisAlignment: MainAxisAlignment.start,
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
                      SizedBox(
                          width:
                              4.0), // Add spacing between the checkbox and text
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
            SizedBox(height: 15.0),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 25, right: 25, bottom: 8, top: 10),
                  child:
                      Text("Agree to all Consent", textAlign: TextAlign.start),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Column(
                children: radioOptions1.map((option1) {
                  return Row(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Checkbox(
                        activeColor: Color.fromARGB(255, 4, 78, 73),
                        value: selectedValues1.contains(option1),
                        onChanged: (isSelected) {
                          setState(() {
                            if (isSelected == true) {
                              selectedValues1.add(option1);
                            } else {
                              selectedValues1.remove(option1);
                            }
                          });
                        },
                      ),
                      SizedBox(
                          width:
                              4.0), // Add spacing between the checkbox and text
                      Expanded(
                        child: Text(
                          option1,
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
              height: 10,
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
                        if (areAllCheckboxesSelected()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => proceed_digital_esign(),
                            ),
                          );
                        } else {
                          // Show a message or take some other action to handle the case where not all checkboxes are selected
                          // For example, you can show a SnackBar with a message
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Please select all checkboxes.'),
                              backgroundColor: Colors
                                  .red, // Background color for alert-style Snackbar
                            ),
                          );
                        }
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
    );
  }
}

// I/We wish to instruct DP to accept all the pledge instructions in my/our account without any further instructions from my/our end.
// I/we wish you to send Electronic Transaction Cum Holding statement with other required documents on the registered email id.