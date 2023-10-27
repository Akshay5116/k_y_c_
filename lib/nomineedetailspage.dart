import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:k_y_c_/personal_.dart';

class NomineeDetailsPage extends StatefulWidget {
  @override
  _NomineeDetailsPageState createState() => _NomineeDetailsPageState();
}

class _NomineeDetailsPageState extends State<NomineeDetailsPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey1 = GlobalKey<FormState>();
  bool showNomineeForm = false;
  bool showThirdNomineePage = false;
  DateTime? selectedDate;
  String? selectedFileName;
  int? groupValue2;

  DateTime? selectedDate1;
  String? selectedFileName1;
  int? groupValue4;

  List<Map<String, TextEditingController>> nomineeDetailsList = [];

  List<String> selectedValues = [];
  List<String> radioOptions = [
    'Nominee address same as a my address',
  ];
  String? _selectedItem;
  final List<String> _items = ['Father', 'Mother', 'Son/daughter', 'Brother'];
  List<String> selectedValues1 = [];
  List<String> radioOptions1 = [
    'Nominee address same as a my address',
  ];
  String? _selectedItem1;
  final List<String> _items1 = ['Father', 'Mother', 'Son/daughter', 'Brother'];
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
          actions: [
            if (!showNomineeForm)
              TextButton(
                onPressed: () {
                  setState(() {
                    showNomineeForm = true;
                  });
                },
                child: Text(
                  'Add Nominee',
                  style: TextStyle(
                    color: Color.fromARGB(255, 4, 78, 73),
                  ),
                ),
              ),
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(10.0),
          child: Form(
            key: _formKey,
            child: Column(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Nominee Details 2',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color.fromARGB(255, 4, 78, 73),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 25, right: 25, bottom: 6, top: 10),
                        child: Text("Name of Nominee:2",
                            textAlign: TextAlign.start),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 6),
                    child: TextFormField(
                      //  controller: nomineeDetailsList[i]['nameController'],
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
                          padding: const EdgeInsets.only(
                              left: 25, right: 25, bottom: 6, top: 10),
                          child: Text(
                              "Share of each Nominee in(%) and not more than 100% ",
                              textAlign: TextAlign.start),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 6),
                    child: TextFormField(
                      //  controller: nomineeDetailsList[i]['shareController'],
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Share of each Nominee ";
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
                                        primary: Color.fromARGB(194, 4, 78, 73),
                                        onPrimary: Colors.white, // <-- SEE HERE
                                        onSurface: Colors.black, // <-- SEE HERE
                                      ),
                                    ),
                                    child: child!,
                                  );
                                });

                            if (pickedDate != null &&
                                pickedDate != selectedDate) {
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
                          borderSide: BorderSide(
                              color: Colors.grey), // Remove border highlight
                        ),
                        hintText: selectedDate != null
                            ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"
                            : "dd/mm/yyyy",
                        hintStyle: TextStyle(
                          color:
                              selectedDate != null ? Colors.black : Colors.grey,
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
                          borderSide: BorderSide(
                              color: Colors.grey), // Remove border highlight
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: Colors.grey), // Remove border highlight
                        ),
                        hintText: selectedFileName ?? "No file chosen",
                        hintStyle: TextStyle(
                          color: selectedFileName != null
                              ? Colors.black
                              : Colors.grey,
                        ), // Change the hint text color
                      ),
                      cursorColor: Colors.black,
                    ),
                  ),
                  if (!showNomineeForm) // Show "+Add Nominee" button when not in nominee form
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 25, right: 25),
                          child: TextButton(
                              child: Text(
                                "Next",
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 4, 78, 73),
                                ),
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  if (selectedDate == null) {
                                    // Show a validation message for groupValue
                                    _showSnackBar(
                                      context,
                                      "Please Enter date of birth",
                                    );
                                  } else if (groupValue2 == null) {
                                    // Show a validation message for groupValue
                                    _showSnackBar(
                                      context,
                                      "Please select Proof",
                                    );
                                  } else if (selectedFileName == null) {
                                    // Show a validation message for groupValue
                                    _showSnackBar(
                                      context,
                                      "Please Proof of Idenity",
                                    );
                                  } else {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Personal(),
                                        ));
                                  }
                                }
                              }),
                        ),
                      ],
                    )
                ],
              ),
              Visibility(
                  visible: showNomineeForm,
                  child: Form(
                    key: _formKey1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Nominee Details 3',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Color.fromARGB(255, 4, 78, 73),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 25, right: 25, bottom: 6, top: 10),
                              child: Text("Name of Nominee:3",
                                  textAlign: TextAlign.start),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 6),
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
                                padding: const EdgeInsets.only(
                                    left: 25, right: 25, bottom: 6, top: 10),
                                child: Text(
                                    "Share of each Nominee in(%) and not more than 100% ",
                                    textAlign: TextAlign.start),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 6),
                          child: TextFormField(
                            keyboardType: TextInputType.name,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Share of each Nominee 3";
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
                              hintText: "Share of each Nominee 3",
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
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 6),
                          child: DropdownButtonFormField<String>(
                            value: _selectedItem1,
                            items: _items1.map((String item1) {
                              return DropdownMenuItem<String>(
                                value: item1,
                                child: Text(
                                  item1,
                                  style: TextStyle(fontSize: 14),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? value) {
                              setState(() {
                                _selectedItem1 = value;
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
                            children: radioOptions.map((option1) {
                              return Row(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Checkbox(
                                    activeColor: Color.fromARGB(255, 4, 78, 73),
                                    value: selectedValues.contains(option1),
                                    onChanged: (isSelected1) {
                                      setState(() {
                                        if (isSelected1 == true) {
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
                          height: 5,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 25, right: 25, bottom: 6, top: 10),
                              child: Text("Address : 1",
                                  textAlign: TextAlign.start),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 6),
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
                                  horizontal:
                                      16.0), // Increase vertical padding here
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
                              child: Text("Address : 2",
                                  textAlign: TextAlign.start),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 6),
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
                              child: Text("Address : 3",
                                  textAlign: TextAlign.start),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 6),
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
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 6),
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
                              child:
                                  Text("Pincode", textAlign: TextAlign.start),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 6),
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
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 6),
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
                              child:
                                  Text("Country", textAlign: TextAlign.start),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 6),
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
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 6),
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
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 6),
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
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 6),
                          child: TextFormField(
                            keyboardType: TextInputType.name,
                            readOnly: true,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              suffixIcon: GestureDetector(
                                onTap: () async {
                                  final pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate:
                                          selectedDate1 ?? DateTime.now(),
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
                                      });

                                  if (pickedDate != null &&
                                      pickedDate != selectedDate1) {
                                    setState(() {
                                      selectedDate1 = pickedDate;
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
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              hintText: selectedDate1 != null
                                  ? "${selectedDate1!.day}/${selectedDate1!.month}/${selectedDate1!.year}"
                                  : "dd/mm/yyyy",
                              hintStyle: TextStyle(
                                color: selectedDate1 != null
                                    ? Colors.black
                                    : Colors.grey,
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
                              child: Text("Select Proof",
                                  textAlign: TextAlign.start),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 8),
                          child: Container(
                            width: double.infinity,
                            child: CupertinoSlidingSegmentedControl<int>(
                              thumbColor: Color.fromARGB(255, 4, 78, 73),
                              backgroundColor: Colors.white,
                              children: {
                                1: Text("Pan Card",
                                    style: _segmentTextStyle2(1)),
                                2: Text("Aadhar Card",
                                    style: _segmentTextStyle2(2)),
                              },
                              onValueChanged: (value) {
                                setState(() => groupValue4 = value!);
                              },
                              groupValue: groupValue4,
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
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 6),
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
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 6),
                          child: TextFormField(
                            keyboardType: TextInputType.name,

                            readOnly: true, // Set to true to prevent text input
                            // enabled: false, // Set to false to disable text input

                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              suffixIcon: GestureDetector(
                                onTap: () async {
                                  var picked =
                                      await FilePicker.platform.pickFiles();

                                  if (picked != null &&
                                      picked.files.isNotEmpty) {
                                    setState(() {
                                      selectedFileName1 =
                                          picked.files.first.name;
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
                                borderSide: BorderSide(
                                    color:
                                        Colors.grey), // Remove border highlight
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color:
                                        Colors.grey), // Remove border highlight
                              ),
                              hintText: selectedFileName1 ?? "No file chosen",
                              hintStyle: TextStyle(
                                color: selectedFileName1 != null
                                    ? Colors.black
                                    : Colors.grey,
                              ), // Change the hint text color
                            ),
                            cursorColor: Colors.black,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 25, right: 25),
                              child: TextButton(
                                onPressed: () {
                                  bool isForm1Valid =
                                      _formKey.currentState!.validate();
                                  bool isForm2Valid =
                                      _formKey1.currentState!.validate();
                                  if (isForm1Valid && isForm2Valid) {
                                    if (selectedDate == null &&
                                        selectedDate1 == null) {
                                      // Show a validation message for groupValue
                                      _showSnackBar(
                                        context,
                                        "Please Enter date of birth",
                                      );
                                    } else if (groupValue2 == null &&
                                        groupValue4 == null) {
                                      // Show a validation message for groupValue
                                      _showSnackBar(
                                        context,
                                        "Please select Proof",
                                      );
                                    } else if (selectedFileName == null &&
                                        selectedFileName1 == null) {
                                      // Show a validation message for groupValue
                                      _showSnackBar(
                                        context,
                                        "Please Proof of Idenity",
                                      );
                                    } else {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Personal(),
                                          ));
                                    }
                                  }
                                },
                                child: Text(
                                  "Next",
                                  textAlign: TextAlign.end,
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
                  ))
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

  TextStyle _segmentTextStyle1(int value) {
    return TextStyle(
      fontSize: 12,
      color: groupValue2 == value ? Colors.white : Colors.black,
    );
  }

  TextStyle _segmentTextStyle2(int value) {
    return TextStyle(
      fontSize: 12,
      color: groupValue4 == value ? Colors.white : Colors.black,
    );
  }
}
