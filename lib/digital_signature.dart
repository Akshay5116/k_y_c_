import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:k_y_c_/bank_details.dart';

import 'package:image_picker/image_picker.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

class MyHomePage123 extends StatefulWidget {
  MyHomePage123({Key? key}) : super(key: key);

  @override
  _MyHomePage123State createState() => _MyHomePage123State();
}

class _MyHomePage123State extends State<MyHomePage123> {
  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Choose option",
            style: TextStyle(
              color:Color.fromARGB(255, 4, 78, 73)
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Divider(
                  height: 1,
                  color:Color.fromARGB(255, 4, 78, 73)
                ),
                ListTile(
                  onTap: () {
                    _openGallery(context);
                  },
                  title: Text("Gallery"),
                  leading: Icon(
                    Icons.account_box,
                    color:Color.fromARGB(255, 4, 78, 73)
                  ),
                ),
                Divider(
                  height: 1,
                  color: Color.fromARGB(255, 4, 78, 73)
                ),
                ListTile(
                  onTap: () {
                    _openCamera(context);
                  },
                  title: Text("Camera"),
                  leading: Icon(
                    Icons.camera,
                    color:Color.fromARGB(255, 4, 78, 73)
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  XFile? imageFile;
  final GlobalKey<SfSignaturePadState> signatureGlobalKey =
      GlobalKey<SfSignaturePadState>();

  int groupValue = 1;

  // Whether to show the signature pad or upload icon
  bool showSignaturePad = true;

  @override
  void initState() {
    super.initState();
  }

  void _handleClearButtonPressed() {
    signatureGlobalKey.currentState?.clear();
  }

  void _handleSaveButtonPressed() async {
    final data =
        await signatureGlobalKey.currentState?.toImage(pixelRatio: 3.0);

    if (data != null) {
      final bytes = await data.toByteData(format: ui.ImageByteFormat.png);

      if (bytes != null) {
        setState(() {
          // Update the signature image
        });

        // Navigate to a new screen to display the saved signature
        await Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) {
              return Scaffold(
                appBar: AppBar(
                 
                  foregroundColor: Colors.black,
                  centerTitle: true,
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  title: Container(
                    height: 50,
                    width: 180,
                    child: Image.asset(
                      'assets/logo6.png',
                    ),
                  ),
                ),
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Color.fromARGB(255, 4, 78, 73),width: 2 ),
                            borderRadius: BorderRadius.circular(10)
                          ),
                         
                          child: Image.memory(
                            Uint8List.fromList(
                              bytes.buffer.asUint8List(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    if (groupValue == 1)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Tab Signature is Successfully"),
                      ),
                    if (groupValue == 2)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Upload Signature is Successfully"),
                      ),
                       
                    Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => bank_details()));
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(195, 4, 78, 73)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          90.0), // Adjust the radius as needed
                    ),
                  ),
                ),
                child: Text(
                  'Next',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
                    )
                  ]
                ),
              );
            },
          ),
        );
      }
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
          width: 180,
          child: Image.asset(
            'assets/logo6.png',
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 8),
            child: Container(
              width: double.infinity,
              child: CupertinoSlidingSegmentedControl<int>(
                backgroundColor: Color.fromARGB(255, 4, 78, 73),
                children: {
                  1: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      "Tab Signature",
                      style: TextStyle(
                        fontSize: 12,
                        color: groupValue == 1
                            ? Colors.black // Selected segment color
                            : Colors.white, // Unselected segment color),
                      ),
                    ),
                  ),
                  2: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      "Upload Signature",
                      style: TextStyle(
                        fontSize: 12,
                        color: groupValue == 2
                            ? Colors.black // Selected segment color
                            : Colors.white, // Unselected segment color),
                      ),
                    ),
                  ),
                },
                onValueChanged: (value) {
                  setState(() {
                    groupValue = value!;
                    // Update whether to show the signature pad or upload icon
                    showSignaturePad = (groupValue == 1);
                  });
                },
                groupValue: groupValue,
              ),
            ),
          ),
          SizedBox(height: 50),
          // Use a conditional statement to display text based on groupValue
          if (groupValue == 1) Text("Tab Signature"),
          if (groupValue == 2) Text("Upload Signature"),
          SizedBox(height: 50),
          // Use a conditional statement to display text based on groupValue
          if (showSignaturePad)
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                child: Column(
                  children: [
                    SfSignaturePad(
                      key: signatureGlobalKey,
                      backgroundColor: Colors.white,
                      strokeColor: Colors.black,
                      minimumStrokeWidth: 1.0,
                      maximumStrokeWidth: 4.0,
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: <Widget>[
                        TextButton(
                          child: Text('Clear'),
                          onPressed: _handleClearButtonPressed,
                        ),
                        TextButton(
                          child: Text('Save'),
                          onPressed: _handleSaveButtonPressed,
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    ),
                  ],
                ),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey)),
              ),
            ),

          if (!showSignaturePad)
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Image.asset('assets/ottp.jpg'),
                  Container(
                    child: ElevatedButton.icon(
                      
                        onPressed: () {
                          _showChoiceDialog(context);
                        },
                        icon: Icon(Icons.upload),
                        label: Text('Upload Image'), style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          Color.fromARGB(255, 4, 78, 73), // Your custom background color
        ), ),
                  ),
            ),
                ],
              ),
      )]
      ),
    );
  }

  void _openGallery(BuildContext context) async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = pickedFile;
      });
       Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SelectedImagePage(imageFile: pickedFile),
        ));
       
    }
  
   
  }

  void _openCamera(BuildContext context) async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = pickedFile;
      });
       Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SelectedImagePage(imageFile: pickedFile),
      ),
    );
   
    }

   
  }
}


class SelectedImagePage extends StatefulWidget {
  final XFile? imageFile;

  SelectedImagePage({Key? key, required this.imageFile}) : super(key: key);

  @override
  _SelectedImagePageState createState() => _SelectedImagePageState();
}

class _SelectedImagePageState extends State<SelectedImagePage> {
  bool _showProgress = true;

  @override
  void initState() {
    super.initState();

    // Simulate a delay of 2 seconds before showing the image.
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _showProgress = false; // Hide the progress indicator.
      });
    });
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
          width: 180,
          child: Image.asset(
            'assets/logo6.png',
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (_showProgress) // Show the progress indicator for 2 seconds.
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: LinearProgressIndicator(),
            ),
          if (!_showProgress && widget.imageFile != null) // Show the image after the progress indicator.
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Image.file(
                File(widget.imageFile!.path),
                fit: BoxFit.fill,
              ),
            ),
          if (!_showProgress && widget.imageFile != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Upload Signature is Successfully"),
            ),
              Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => bank_details()));
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(195, 4, 78, 73)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          90.0), // Adjust the radius as needed
                    ),
                  ),
                ),
                child: Text(
                  'Next',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
                    )
        ],
      ),
    );
  }
}

