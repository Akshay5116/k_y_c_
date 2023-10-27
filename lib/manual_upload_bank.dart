import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:k_y_c_/esign_manual.dart';

class manual_upload_bank extends StatefulWidget {
  const manual_upload_bank({super.key});

  @override
  State<manual_upload_bank> createState() => _manual_upload_bankState();
}

class _manual_upload_bankState extends State<manual_upload_bank> {
   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _fileController = TextEditingController(text: '');

  Future<void> _pickFile() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ['jpg'],
  );

  if (result != null) {
    String? fileName = result.files.single.name;
    setState(() {
      _fileController.text = fileName ?? '';
    });
  }
}

  String? _selectedItem;
  final List<String> _items = ['Cancle Cheque', 'Bank Passbook / Statment'];
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
              'Manual Upload Bank Proof',
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
                child: Text("Select Document Type", textAlign: TextAlign.start),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 6),
            child: DropdownButtonFormField<String>(
              value: _selectedItem,
              items: _items.map((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  _selectedItem = value;
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
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 25, right: 25,  top: 10),
                  child: Text(
                      "Upload Proof \n(cancle Cheque / Passbook / Bank Statments)",
                      textAlign: TextAlign.start),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 25,
              right: 25,
              
            ),
            child: TextFormField(
              readOnly: true,
                controller: _fileController,
                decoration: InputDecoration(
                  labelText: 'Selected File',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.folder_open),
                    onPressed: _pickFile,
                  ),
                )),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 25, right: 25, bottom: 8, top: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 4, 78, 73)),
                     onPressed: () {
                             if (_formKey.currentState!.validate()) {
                            if (_selectedItem == null) {
                              // Show a validation message for groupValue1
                              _showSnackBar(
                                context,
                                "Please select Document Type",
                              );
                            } 
                            else if (_fileController.text.isEmpty) {
                              _showSnackBar(
                                context,
                                "Please upload a file",
                              );
                            } 
                            
                            else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => esign_manual(),
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
          )
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
}
