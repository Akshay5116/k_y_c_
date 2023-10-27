import 'package:flutter/material.dart';
import 'package:k_y_c_/webfile.dart';
class proceed_digital_esign extends StatefulWidget {
  const proceed_digital_esign({super.key});

  @override
  State<proceed_digital_esign> createState() => _proceed_digital_esignState();
}

class _proceed_digital_esignState extends State<proceed_digital_esign> {
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
            SizedBox(height: 15.0),
       Padding(
         padding: const EdgeInsets.all(8.0),
         child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 1)
          ),
           child: Column(
             children: [
               Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 25, right: 25, bottom: 8, top: 10),
                            child: Text("Proceed for Digital eSign \n(if your mobile number is linked to Aadhar)", textAlign: TextAlign.start),
                          ),
                        ],
                      ),
                       Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 25, right: 25, bottom: 8, top: 10),
                    child: Text('please download the form and verify the details before proceeding further',style: TextStyle(fontSize: 8),
                     textAlign: TextAlign.start), ),
                ]
                  ),
                
             ],
           ),
         ),
       ),
              
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonBar(
                      children: [
                       OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                backgroundColor: Color.fromARGB(255, 4, 78, 73)),
                            onPressed: () {
                              // if (_formKey.currentState!.validate()) {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //       builder: (context) =>  manual_upload_bank(),
                                //     ));
                              // }
                            },
                            child: Text(
                              'Download PDF',
                              style: TextStyle(color: Colors.white, fontSize: 15),
                            )),
              
                       OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                backgroundColor: Color.fromARGB(255, 4, 78, 73)),
                            onPressed: () {
                             Navigator.push(context, MaterialPageRoute(builder: (context) => MyInAppWebView(),));
                            },
                            child: Text(
                              'Proceed for eSign',
                              style: TextStyle(color: Colors.white, fontSize: 15),
                            )),
                      ],
                    )
                  ],
                ),
              )
                ],
              ),
          
        ),
    
    );
  }
}