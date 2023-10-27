import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:k_y_c_/thirdpage_personal.dart';

class secondpage_personal extends StatefulWidget {
  const secondpage_personal({super.key});

  @override
  State<secondpage_personal> createState() => _secondpage_personalState();
}

class _secondpage_personalState extends State<secondpage_personal> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //  int? groupValue;
  int? groupValue33;
  int groupValue11 = 1;
  int groupValue22 = 2;
  String? _selectedItem44;
  final List<String> _items55 = [
    'No Prior Experinece',
    'Less than 1 Year',
    '1-2 Years',
    '2-5 Years',
    '5-10 Years',
    '10-20 Years'
  ];
  String? _selectedItem66;
  final List<String> _items77 = [
    'Up to 1 Lac',
    '1-5 Lacs',
    '5-10 Lacs',
    '10-25 Lacs',
    '>25 Lacs',
  ];
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
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 25, right: 25, bottom: 6, top: 10),
                    child:
                        Text("Mobile Belongs To", textAlign: TextAlign.start),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 6),
                child: TextFormField(
                  initialValue: 'Self',
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Your Mobile Belongs To";
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
                    hintText: "Enter Your Mobile Belongs To",
                    prefixIcon: Icon(
                      Icons.account_box_sharp,
                      color: Colors.black,
                    ),
                  ),
                  cursorColor: Colors.black,
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 25, right: 25, bottom: 6, top: 10),
                    child: Text("Email Belongs To", textAlign: TextAlign.start),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 6),
                child: TextFormField(
                  initialValue: 'Self',
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Your Mobile Belongs To";
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
                    hintText: "Enter Your Mobile Belongs To",
                    prefixIcon: Icon(
                      Icons.account_box_sharp,
                      color: Colors.black,
                    ),
                  ),
                  cursorColor: Colors.black,
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 25, right: 25, bottom: 8, top: 10),
                    child: Text("Account Operation Mode",
                        textAlign: TextAlign.start),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 8),
                child: Container(
                  width: double.infinity,
                  child: CupertinoSlidingSegmentedControl<int>(
                    backgroundColor: Colors.white,
                    thumbColor: Color.fromARGB(255, 4, 78, 73),
                    children: {
                      1: Text("eDIS", style: _segmentTextStyle00(1)),
                      2: Text("DIS", style: _segmentTextStyle00(2)),
                      3: Text("DDPI", style: _segmentTextStyle00(3)),
                    },
                    onValueChanged: (value) {
                      setState(() => groupValue33 = value!);
                    },
                    groupValue: groupValue33,
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 25, right: 25, bottom: 8, top: 10),
                    child:
                        Text("Trading Experience", textAlign: TextAlign.start),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 6),
                child: DropdownButtonFormField<String>(
                  value: _selectedItem44,
                  items: _items55.map((String item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: TextStyle(fontSize: 14),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      _selectedItem44 = value;
                    });
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(8),
                    hintText: 'Select Type',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 25, right: 25, bottom: 8, top: 10),
                    child: Text("Annual Income", textAlign: TextAlign.start),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 6),
                child: DropdownButtonFormField<String>(
                  value: _selectedItem66,
                  items: _items77.map((String item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: TextStyle(fontSize: 14),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      _selectedItem66 = value;
                    });
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(8),
                    hintText: 'Select Your Annual Income',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 25, right: 25, bottom: 8, top: 10),
                    child: Text("Nationality", textAlign: TextAlign.start),
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
                      1: Text("Indian", style: _segmentTextStyle99(1)),
                      2: Text("Other", style: _segmentTextStyle99(2)),
                    },
                    onValueChanged: (value) {
                      setState(() => groupValue11 = value!);
                    },
                    groupValue: groupValue11,
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 25, right: 25, bottom: 8, top: 10),
                    child:
                        Text("Politically Exposed", textAlign: TextAlign.start),
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
                      1: Text("Yes", style: _segmentTextStyle88(1)),
                      2: Text("No", style: _segmentTextStyle88(2)),
                    },
                    onValueChanged: (value) {
                      setState(() => groupValue22 = value!);
                    },
                    groupValue: groupValue22,
                  ),
                ),
              ),
              SizedBox(
                height: 35,
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
                            if (groupValue33 == null) {
                              // Show a validation message for groupValue
                              _showSnackBar21(
                                context,
                                "Please select Account operation mode",
                              );
                            } else if (_selectedItem44 == null) {
                              // Show a validation message for groupValue1
                              _showSnackBar21(
                                context,
                                "Please select trading experience",
                              );
                            } else if (_selectedItem66 == null) {
                              // Show a validation message for the dropdown
                              _showSnackBar21(
                                context,
                                "Please select Annual Income",
                              );
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => thirdpage_personal(),
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
        )));
  }

  void _showSnackBar21(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }

  TextStyle _segmentTextStyle00(int value) {
    return TextStyle(
      fontSize: 12,
      color: groupValue33 == value ? Colors.white : Colors.black,
    );
  }

  TextStyle _segmentTextStyle99(int value) {
    return TextStyle(
      fontSize: 12,
      color: groupValue11 == value ? Colors.white : Colors.black,
    );
  }

  TextStyle _segmentTextStyle88(int value) {
    return TextStyle(
      fontSize: 12,
      color: groupValue22 == value ? Colors.white : Colors.black,
    );
  }
}
