import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:k_y_c_/digital_signature.dart';
import 'package:k_y_c_/nomineedetailspage.dart';
import 'package:k_y_c_/personal_.dart';
import 'package:k_y_c_/thirdpage_personal.dart';

class nominee extends StatefulWidget {
  const nominee({super.key});

  @override
  State<nominee> createState() => _nomineeState();
}

class _nomineeState extends State<nominee> {
  String? selectedFileName;
    DateTime? selectedDate;
  int? groupValue2;
  List<Map<String, TextEditingController>> nomineeDetailsList = [];
  void addNominee() {
    // Create a new set of text controllers for a new nominee
    final nomineeDetails = {
      'nameController': TextEditingController(),
      'shareController': TextEditingController(),
      // Add more controllers for other nominee details as needed
    };

    setState(() {
      nomineeDetailsList.add(nomineeDetails);
    });
  }
   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<String> selectedValues = [];
  List<String> radioOptions = [
    'Nominee address same as a my address',
  ];
  List<String> selectedValues1 = [];
  List<String> radioOptions1 = [
    'Declartion form for opting out of nomiantion!',
  ];
  String? _selectedItem;
  final List<String> _items = ['Father', 'Mother', 'Son/daughter', 'Brother'];
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
        ),actions: [
          TextButton(
                          onPressed: () {
                            //  if (_formKey.currentState!.validate()) {
                            //     if (selectedDate == null) {
                            //   // Show a validation message for groupValue
                            //   _showSnackBar(
                            //     context,
                            //     "Please Enter date of birth",
                            //   );
                            // }
                            //  else if (groupValue2 == null) {
                            //   // Show a validation message for groupValue
                            //   _showSnackBar(
                            //     context,
                            //     "Please select Proof",
                            //   );
                            // } 
                            //   else if (selectedFileName == null) {
                            //   // Show a validation message for groupValue
                            //   _showSnackBar(
                            //     context,
                            //     "Please Proof of Idenity",
                            //   );
                            // } 
                            
                            //  else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NomineeDetailsPage(),
                                ));
                          },
                          //    }
                          // }
                          // },
                          child: Text(
                            "Add Nominee",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Color.fromARGB(255, 4, 78, 73),
                            ),
                          ),
                        ),
        ],
      ),
      body: SingleChildScrollView(
          child: Form(
            key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Column(
                children: radioOptions1.map((option1) {
                  return Row(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Transform.scale(
                        scale: 1.1,
                        child: Checkbox(
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
            Visibility(
              visible: selectedValues1.isNotEmpty,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 6),
                child: ElevatedButton(
                  child: Text('Next'), style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(195, 4, 78, 73)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          90.0), // Adjust the radius as needed
                    ),
                  ),
                ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => thirdpage_personal(),
                        ));
                  },
                ),
              ),
              replacement: Column(
                children: [
                  
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 25, right: 25, bottom: 6, top: 10),
                        child: Text("Name of Nominee:1",
                            textAlign: TextAlign.start),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 6),
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Your Name of Nominee";
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
                        hintText: "Enter Your Name of Nominee",
                      ),
                      cursorColor: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                                     padding: EdgeInsets.only(left: 20,right: 20,bottom: 6),           

                          child: Text(
                              "Share of each Nominee in(%) and not more than 100% ",
                              style: TextStyle(fontSize: 12),
                              textAlign: TextAlign.start),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 6),
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Share of each Nominee";
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
                        hintText: "Share of each Nominee",
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
                        child: Text("Relation with Applicant",
                            textAlign: TextAlign.start),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 6),
                    child: DropdownButtonFormField<String>(
                      value: _selectedItem,
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
                          _selectedItem = value;
                        });
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(8),
                        hintText: '-Select Relation-',
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
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 25, right: 25, bottom: 6, top: 10),
                        child: Text("Address : 1", textAlign: TextAlign.start),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 6),
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Address : 1";
                        } else {
                          return null;
                        }
                      },
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 30.0,
                            horizontal: 16.0), // Increase vertical padding here
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "Address : 1",
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
                        child: Text("Address : 2", textAlign: TextAlign.start),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 6),
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Address : 2";
                        } else {
                          return null;
                        }
                      },
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 30.0, horizontal: 16.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "Address : 2",
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
                        child: Text("Address : 3", textAlign: TextAlign.start),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 6),
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Address : 3";
                        } else {
                          return null;
                        }
                      },
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 30.0, horizontal: 16.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "Address : 3",
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
                        child: Text("City", textAlign: TextAlign.start),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 6),
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Your City";
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
                        hintText: "Enter Your City",
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
                        child: Text("Pincode", textAlign: TextAlign.start),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 6),
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Your Pincode";
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
                        hintText: "Enter Your Pincode",
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
                        child: Text("State", textAlign: TextAlign.start),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 6),
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Your State";
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
                        hintText: "Enter Your State",
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
                        child: Text("Country", textAlign: TextAlign.start),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 6),
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Your Country";
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
                        hintText: "Enter Your Country",
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
                        child: Text("Mobile no of Nominee(optional) ",
                            textAlign: TextAlign.start),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 6),
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Nominee Number";
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
                        hintText: "Enter Nominee Number",
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
                        child: Text("Email of Nominee(optional) ",
                            textAlign: TextAlign.start),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 6),
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Nominee Email";
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
                        hintText: "Enter Nominee Email",
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
                        child: Text("Date of Birth Nominee",
                            textAlign: TextAlign.start),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 6),
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      readOnly: true,
                     
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          onTap: () async {
                          final pickedDate = await showDatePicker(
                  context: context,
                  initialDate: selectedDate ?? DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                    builder: (context, child) {
                                        return Theme(
                                          data: Theme.of(context).copyWith(
                                            colorScheme: ColorScheme.light(
                                              primary: Color.fromARGB(
                                                  194, 4, 78, 73),
                                              onPrimary:
                                                  Colors.white, // <-- SEE HERE
                                              onSurface:
                                                  Colors.black, // <-- SEE HERE
                                            ),
                                          ),
                                          child: child!,
                                        );
                    }
                );

                if (pickedDate != null && pickedDate != selectedDate) {
                  setState(() {
                    selectedDate = pickedDate;
                  });
                }
              },
                          child: Icon(
                            Icons
                                .calendar_month_sharp, // You can replace this with your desired icon
                            color: Colors.grey,
                          ),
                        ),
                        contentPadding: EdgeInsets.all(8),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                           borderSide: BorderSide(color: Colors.grey),
     
                        ),
                         focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.grey), // Remove border highlight
      ),
                        hintText: selectedDate != null
                ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"
                : "dd/mm/yyyy",
                 hintStyle: TextStyle(
        color: selectedDate != null ? Colors.black : Colors.grey,
      ), // Change the hint text color
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
                        child: Text("Select Proof", textAlign: TextAlign.start),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 8),
                    child: Container(
                      width: double.infinity,
                      child: CupertinoSlidingSegmentedControl<int>(
                        thumbColor: Color.fromARGB(255, 4, 78, 73),
                        backgroundColor: Colors.white,
                        children: {
                          1: Text("Pan Card", style: _segmentTextStyle1(1)),
                          2: Text("Aadhar Card", style: _segmentTextStyle1(2)),
                        },
                        onValueChanged: (value) {
                          setState(() => groupValue2 = value!);
                        },
                        groupValue: groupValue2,
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
                        child: Text("Enter Selected Proof Number",
                            textAlign: TextAlign.start),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 6),
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter Aadhar / Pan number";
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
                        hintText: "Enter Aadhar / Pan number",
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
                        child: Text("Proof of Idenity(Nominee)",
                            textAlign: TextAlign.start),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 6),
                    child: TextFormField(
                      keyboardType: TextInputType.name,

                      readOnly: true, // Set to true to prevent text input
                      // enabled: false, // Set to false to disable text input
                     
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          onTap: () async {
                            var picked = await FilePicker.platform.pickFiles();

                            if (picked != null && picked.files.isNotEmpty) {
                              setState(() {
                                selectedFileName = picked.files.first.name;
                              });
                            }
                          },
                          child: Icon(
                            Icons
                                .attach_file, // You can replace this with your desired icon
                            color: Colors.grey,
                          ),
                        ),
                        contentPadding: EdgeInsets.all(8),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey), // Remove border highlight
                        ),
                              focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.grey), // Remove border highlight
      ),
                        hintText: selectedFileName ?? "No file chosen",
                         hintStyle: TextStyle(
        color: selectedFileName != null ? Colors.black : Colors.grey,
      ), // Change the hint text color
                      ),
                      cursorColor: Colors.black,
                    ),

                  
                  ),
                  Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: TextButton(
                          onPressed: () {
                             if (_formKey.currentState!.validate()) {
                                if (selectedDate == null) {
                              // Show a validation message for groupValue
                              _showSnackBar(
                                context,
                                "Please Enter date of birth",
                              );
                            }
                             else if (groupValue2 == null) {
                              // Show a validation message for groupValue
                              _showSnackBar(
                                context,
                                "Please select Proof",
                              );
                            } 
                              else if (selectedFileName == null) {
                              // Show a validation message for groupValue
                              _showSnackBar(
                                context,
                                "Please Proof of Idenity",
                              );
                            } 
                            
                             else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MyHomePage123(),
                                ));
                             }
                          }
                          },
                          child: Text(
                            "Next",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Color.fromARGB(255, 4, 78, 73),
                            ),
                          ),
                        ),
                  ),
                ],
              )
                ],
              ),
            ),
          
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
  TextStyle _segmentTextStyle1(int value) {
    return TextStyle(
      fontSize: 12,
      color: groupValue2 == value ? Colors.white : Colors.black,
    );
  }
}
