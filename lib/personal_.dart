import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:k_y_c_/main.dart';
import 'package:k_y_c_/nominee.dart';
import 'package:k_y_c_/secondpage_personal.dart';
import 'package:http/http.dart' as http;
import 'package:k_y_c_/thirdpage_personal.dart';

class Personal extends StatefulWidget {
  const Personal({super.key});

  @override
  State<Personal> createState() => _PersonalState();
}

class _PersonalState extends State<Personal> {
  final TextEditingController _aadharr_Controller = TextEditingController();
  final TextEditingController _ac_mode_Controller = TextEditingController();
  final TextEditingController _mble_Controller =
      TextEditingController(text: 'Self');
  final TextEditingController _email_Controller =
      TextEditingController(text: 'Self');
  TextEditingController _fathername_Controller =
      TextEditingController(text: storage.read('father')?.toString());
  TextEditingController _annual_Controller =
      TextEditingController(text: storage.read('annual_incmm').toString());
  final TextEditingController _mothername_Controller =
      TextEditingController(text: storage.read('mother')?.toString());
  TextEditingController _mrtlst_Controller =
      TextEditingController(text: storage.read('mtrlsts')?.toString());
  TextEditingController _education_Controller =
      TextEditingController(text: storage.read('educat').toString());
  TextEditingController _resident_Controller =
      TextEditingController(text: storage.read('resident').toString());
  TextEditingController _ntonlty_Controller =
      TextEditingController(text: storage.read('ntonlty').toString());
  TextEditingController _occuption_Controller =
      TextEditingController(text: storage.read('ocptn').toString());
  TextEditingController _trding_Controller =
      TextEditingController(text: storage.read('tdexp')?.toString());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _OccupationItem = storage.read('ocptn').toString();
  var groupValue = 2;
  int groupValue33 = 3;
  int? groupValue1;
  int groupValue22 = 2;
  // int? groupValue;
  // var groupValue1 = 1;
  String _TradingItem44 = storage.read('tdexp').toString();
  final List<String> _items55 = [
    '<1',
    '1-2 Years',
    '2-5 Years',
    '5-10 Years',
    '10-20 Years'
  ];
  String _incmItem66 = storage.read('annual_incmm').toString();
  int groupValue11 = 1;
  int groupValue20 = 2;
  int groupValue10 = 2;
  final List<String> _items77 = [
    'Up to 1 Lac',
    '1-5 Lacs',
    '5-10 Lacs',
    '10-25 Lacs',
    '>25 Lacs',
  ];
  final List<String> _items = [
    'Business',
    'HouseWife',
    'Private',
    'Public',
    'Professinal',
    'Student',
    'Others'
  ];
  @override
  // void initState() {
  //   super.initState();
  //   aadhar_verify();
  // }

  bool _isLoading = false;

  void _showLoadingDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          //  backgroundColor: Colors.black.withOpacity(0.9),
          content: Container(
            height: 100, // Set the desired height
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircularProgressIndicator(),
                  Text(
                    'Please Wait...',
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _hideLoadingDialog() {
    if (_isLoading) {
      Navigator.of(context).pop();
      _isLoading = false;
    }
  }

  Future<void> aadhar_verify() async {
    _isLoading = true;
    _showLoadingDialog();
    // String aadharr = _aadharr_Controller.text;
    // String fathername = _fathername_Controller.text;
    // String mothername = _mothername_Controller.text;

    // Make the API request
    Uri url =
        Uri.parse('http://connect.arhamshare.com:9090/EAPI/AadharDetails');
    var response = await http.post(url, headers: {
      'Content-Type': 'application/x-www-form-urlencoded'
    }, body: {
      'pan_card': 'AMUPU4253H',
      'account_type': 'Individual',
      'session_pan': '',
      'aadhar_num': '',
      'mother_name': '',
      'annual_income_aadhar': '',
      'education_aadhar': '',
      'nominee': 'No',
      'Upload_proof': '',
      'Enter_Number': '',
      'Mobile_User': '',
      'Email_User': '',
      'ac_op_mode': '',
      'personal_father_name': '',
      'marital_status': '',
      'per_occupation': '',
      'per_trading_experience': '',
      'Nationality': 'Indian',
      'political_exposed': '',
      'tax_resident': '',
      'name_nominee': '',
      'share_percentage': '',
      'relation': '',
      'nominee_address': '',
      'nominee_state': '',
      'nominee_city': '',
      'nominee_pincode': '',
      'mobile_nominee': '',
      'email_nominee': '',
      'dob': '',
      'Enter_Number': '',
      'Guardian': '',
      'gaurdian_relation': '',
      'gaurdian_address': '',
      'gaurdian_city': '',
      'gaurdian_state': '',
      'name_nominee2': '',
      'share_percentage2': '',
      'relation2': '',
      'nominee_address2': '',
      'nominee_state2': '',
      'nominee_city2': '',
      'nominee_pincode2': '',
      'mobile_nominee2': '',
      'email_nominee2': '',
      'dob2': '',
      'Enter_Number2': '',
      'Guardian2': '',
      'gaurdian_relation2': '',
      'gaurdian_address2': '',
      'gaurdian_city2': '',
      'gaurdian_state2': '',
      'name_nominee3': '',
      'name_nominee3': '',
      'share_percentage3': '',
      'relation3': '',
      'nominee_address3': '',
      'nominee_state3': '',
      'nominee_city3': '',
      'nominee_pincode3': '',
      'mobile_nominee3': '',
      'email_nominee3': '',
      'dob3': '',
      'Enter_Number3': '',
      'Guardian3': '',
      'gaurdian_relation3': '',
      'gaurdian_address3': '',
      'gaurdian_city3': '',
      'gaurdian_state3': '',
      'kra_status': '',
      'name_other_nationality': '',
    });

    if (response.statusCode == 200) {
      _hideLoadingDialog();
      // Request successful, parse the response

      final responseData = response.body;
      final mothername =
          jsonDecode(responseData)["AadharDetails"]['MotherName'];
      final education = jsonDecode(responseData)["AadharDetails"]['Eduction'];
      final fathername =
          jsonDecode(responseData)["AadharDetails"]['Father_SpouseName'];
      final aadhar = jsonDecode(response.body)["AadharDetails"]["AadharCard"];
      final mobile_nm =
          jsonDecode(response.body)["AadharDetails"]["BelongMobile"];
      final email_id =
          jsonDecode(response.body)["AadharDetails"]["BelongEmailID"];
      final MaritalStatus =
          jsonDecode(response.body)["AadharDetails"]["MaritalStatus"];
      final nationality =
          jsonDecode(response.body)["AadharDetails"]["Nationality"];
      final trading_experince =
          jsonDecode(response.body)["AadharDetails"]["TradingExp"];
      final annual_incm =
          jsonDecode(response.body)["AadharDetails"]["GrossIncome"];
      final occuptionn =
          jsonDecode(response.body)["AadharDetails"]["Occupation"];
      final tax_residencyy =
          jsonDecode(response.body)["AadharDetails"]["ResidentStatus"];
      // Handle the received data here
      storage.write('mother', mothername);
      storage.write('father', fathername);
      storage.write('educat', education);
      storage.write('mbile', mobile_nm);
      storage.write('annual_incmm', annual_incm);
      storage.write('eml', email_id);
      storage.write('ocptn', occuptionn);
      storage.write('ntonlty', nationality);

      storage.write('mtrlsts', MaritalStatus);
      storage.write('tdexp', trading_experince);
      storage.write('aadharr', aadhar);
      storage.write('resident', tax_residencyy);
      print(responseData);
      print("education----{$education}");
      print("mother--{$mothername}");
      print("fathername----{$fathername}");
      print('belongmobile----{$mobile_nm}');
      print('email-----{$email_id}');
      print('ntonlty-----{$nationality}');
      print('mtrlsts---{$MaritalStatus}');
      print('aadhar----{$aadhar}');
      print('trading--exp{$trading_experince}');
      print('annual-income-{$annual_incm}');
      print('occuption-------{$occuptionn}');
      print('resident----{$tax_residencyy}');
      if (responseData == "404") {
        // print('Request failed with status: ${response.statusCode}');

        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Invalid Credential ')));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Successfully Login')));
      }
    } else {
      _hideLoadingDialog();
      // Handle the error case here

      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => intro2page(),
      //     ));
    }
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
          child: Form(
            key: _formKey,
            child: Column(children: [
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Welcome ArhamShare pvt ltd !',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
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
                    child:
                        Text('Aadharcard Number', textAlign: TextAlign.start),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 8),
                child: TextFormField(
                  controller: _aadharr_Controller,
                  keyboardType: TextInputType.number,
                  inputFormatters: [LengthLimitingTextInputFormatter(16)],
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter Your Aadharcard Number';
                    } else if (value.length != 16) {
                      // Check if the length is not 16 or if it's not a valid number
                      return 'Aadhar card number must be 16 digits';
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
                    hintText: 'Enter Your Aadharcard Number',
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
                        left: 25, right: 25, bottom: 6, top: 10),
                    child: Text("Father's Name", textAlign: TextAlign.start),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 6),
                child: TextFormField(
                  // initialValue: storage.read('father')?.toString(),
                  controller: _fathername_Controller,
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter Your Father's Name";
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
                    hintText: "Enter Your Father's Name",
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
                    child: Text("Mother's Name", textAlign: TextAlign.start),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 6),
                child: TextFormField(
                  controller: _mothername_Controller,
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Your Mother's Name";
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
                    hintText: "Enter Your Mother's Name",
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
                    child: Text("Marital Status", textAlign: TextAlign.start),
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
                      1: Text("Married", style: _segmentTextStyle(1)),
                      2: Text("UnMarried", style: _segmentTextStyle(2)),
                      3: Text("Other", style: _segmentTextStyle(3)),
                    },
                    //
                    onValueChanged: (value) {
                      setState(() {
                        groupValue = value!;
                        if (value == 1) {
                          // Update _mrtlst_Controller for "Married"
                          _mrtlst_Controller.text = "Married";
                        } else if (value == 2) {
                          // Update _mrtlst_Controller for "Unmarried"
                          _mrtlst_Controller.text = "Unmarried";
                        } else if (value == 3) {
                          // Update _mrtlst_Controller for "Other"
                          _mrtlst_Controller.text = "Other";
                        }
                      });
                    },

                    groupValue: groupValue,
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
                    child: Text("Occupation", textAlign: TextAlign.start),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 6),
                child: DropdownButtonFormField<String>(
                  value: _items.contains(_OccupationItem)
                      ? _OccupationItem
                      : _items.isNotEmpty
                          ? _items[0] // Set to the first item as a fallback.
                          : null, // Handle the case where _items77 is empty.
                  items: _items.map((String item) {
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
                      _OccupationItem = value!;
                      _occuption_Controller.text = value;
                    });
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(8),
                    hintText: storage.read('ocptn').toString(),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
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
                    child: Text("Education", textAlign: TextAlign.start),
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
                      1: Text("Graduate", style: _segmentTextStyle1(1)),
                      2: Text("Post Graduate", style: _segmentTextStyle1(2)),
                      3: Text("Other", style: _segmentTextStyle1(3)),
                    },
                    onValueChanged: (value) {
                      setState(() {
                        groupValue1 = value!;
                        if (value == 1) {
                          // Update _education_Controller for "Graduate"
                          _education_Controller.text = "Graduate";
                        } else if (value == 2) {
                          // Update _education_Controller for "Post Graduate"
                          _education_Controller.text = "Post Graduate";
                        } else if (value == 3) {
                          // Update _education_Controller for "Other"
                          _education_Controller.text = "Other";
                        }
                      });
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
                        left: 25, right: 25, bottom: 6, top: 10),
                    child:
                        Text("Mobile Belongs To", textAlign: TextAlign.start),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 6),
                child: TextFormField(
                  controller: _mble_Controller,
                  // initialValue: storage.read('mbile').toString(),
                  textCapitalization: TextCapitalization.none,
                  inputFormatters: [NoPastingTextInputFormatter()],
                  // maxLength: 4,
                  keyboardType: TextInputType.none,
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
                  controller: _email_Controller,
                  keyboardType: TextInputType.none,
                  textCapitalization: TextCapitalization.none,
                  inputFormatters: [NoPastingTextInputFormatter()],
                  // maxLength: 4,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Your Email Belongs To";
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
                    hintText: "Enter Your Email Belongs To",
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
                      setState(() {
                        groupValue33 = value!;
                        if (value == 1) {
                          // Update _mrtlst_Controller for "Married"
                          _ac_mode_Controller.text = "eDIS";
                        } else if (value == 2) {
                          // Update _mrtlst_Controller for "Unmarried"
                          _ac_mode_Controller.text = " DIS";
                        } else if (value == 3) {
                          // Update _mrtlst_Controller for "Other"
                          _ac_mode_Controller.text = "DDPI";
                        }
                      });
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
                  value: _items55.contains(_OccupationItem)
                      ? _TradingItem44
                      : _items55.isNotEmpty
                          ? _items55[0] // Set to the first item as a fallback.
                          : null, // Handle the case where _items77 is empty.
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
                      _TradingItem44 = value!;
                      _trding_Controller.text = value;
                    });
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(8),
                    hintText: storage.read('tdexp').toString(),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
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
                  value: _items77.contains(_incmItem66)
                      ? _incmItem66
                      : _items77.isNotEmpty
                          ? _items77[0] // Set to the first item as a fallback.
                          : null, // Handle the case where _items77 is empty.
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
                      _incmItem66 = value!;
                      _annual_Controller.text = value;
                    });
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(8),
                    hintText: storage.read('annual_incmm').toString(),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
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
                      setState(() {
                        groupValue11 = value!;
                        if (value == 1) {
                          // Update _mrtlst_Controller for "Married"
                          _ntonlty_Controller.text = "Indian";
                        } else if (value == 2) {
                          // Update _mrtlst_Controller for "Unmarried"
                          _ntonlty_Controller.text = "Other";
                        }
                      });
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
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 25, right: 25, bottom: 8, top: 10),
                    child: Text("Tax Residency other than India?",
                        textAlign: TextAlign.start),
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
                      1: Text("Yes", style: _segmentTextStyle20(1)),
                      2: Text("No", style: _segmentTextStyle20(2)),
                    },
                    onValueChanged: (value) {
                      setState(() {
                        groupValue20 = value!;
                        if (value == 1) {
                          // Update _mrtlst_Controller for "Married"
                          _resident_Controller.text = "Yes";
                        } else if (value == 2) {
                          // Update _mrtlst_Controller for "Unmarried"
                          _resident_Controller.text = "No";
                        }
                      });
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
                    child: Text("I/WE Wish to Make a Nomination?",
                        textAlign: TextAlign.start),
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
                      1: Text("Yes", style: _segmentTextStyle10(1)),
                      2: Text("No", style: _segmentTextStyle10(2)),
                    },
                    onValueChanged: (value) {
                      setState(() => groupValue10 = value!);
                      if (value == 1) {
                        // Navigate to the nomination page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  nominee()), // Replace with your nomination page
                        );
                      }
                    },
                    groupValue: groupValue10,
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
                            print(_aadharr_Controller.text);
                            print(_fathername_Controller.text);
                            print(_mothername_Controller.text);
                            print(_mrtlst_Controller.text);
                            print(_occuption_Controller.text);
                            print(_education_Controller.text);
                            print(_mble_Controller.text);
                            print(_email_Controller.text);
                            print(_trding_Controller.text);
                            print(_annual_Controller.text);
                            print(_ntonlty_Controller.text);
                            print(_resident_Controller.text);
                            print(_ac_mode_Controller.text);
                            aadhar_verify();
                            if (_OccupationItem == null) {
                              // Show a validation message for groupValue1
                              _showSnackBar(
                                context,
                                "Please select an Occupation type.",
                              );
                            } else if (groupValue1 == null) {
                              // Show a validation message for the dropdown
                              _showSnackBar(
                                context,
                                "Please select an Education Level.",
                              );
                            } else if (groupValue33 == null) {
                              // Show a validation message for groupValue
                              _showSnackBar(
                                context,
                                "Please select Account operation mode",
                              );
                            } else if (_TradingItem44 == null) {
                              // Show a validation message for groupValue1
                              _showSnackBar(
                                context,
                                "Please select trading experience",
                              );
                            } else if (_incmItem66 == null) {
                              // Show a validation message for the dropdown
                              _showSnackBar(
                                context,
                                "Please select Annual Income",
                              );
                            } else {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => thirdpage_personal(),
                              //   ),
                              // );
                            }
                          }
                        },
                        child: Text(
                          'Next',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )),
                  ],
                ),
              )
            ]),
          ),
        ));
  }

  void _showSnackBar(BuildContext context, String message) {
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

  TextStyle _segmentTextStyle(int value) {
    return TextStyle(
      fontSize: 12,
      color: groupValue == value ? Colors.white : Colors.black,
    );
  }

  TextStyle _segmentTextStyle99(int value) {
    return TextStyle(
      fontSize: 12,
      color: groupValue11 == value ? Colors.white : Colors.black,
    );
  }

  TextStyle _segmentTextStyle1(int value) {
    return TextStyle(
      fontSize: 12,
      color: groupValue1 == value ? Colors.white : Colors.black,
    );
  }

  TextStyle _segmentTextStyle88(int value) {
    return TextStyle(
      fontSize: 12,
      color: groupValue22 == value ? Colors.white : Colors.black,
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

String getSelectedSegmentText(int value) {
  switch (value) {
    case 1:
      return "eDIS";
    case 2:
      return "DIS";
    case 3:
      return "DDPI";
    default:
      return "DDPI"; // Handle the default case if needed
  }
}

class NoPastingTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Disallow pasting by resetting the value to the old value
    if (oldValue.text != newValue.text) {
      return oldValue;
    }
    return newValue;
  }
}
