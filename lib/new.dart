// // import 'package:flutter/material.dart';

// // class MyRadioButtonApp extends StatefulWidget {
// //   @override
// //   _MyRadioButtonAppState createState() => _MyRadioButtonAppState();
// // }

// // class _MyRadioButtonAppState extends State<MyRadioButtonApp> {
// //   // The selected value
// //   String selectedValue = '';

// //   // A list of options for the RadioButton group
// //   List<String> radioOptions = ['Option 1', 'Option 2', 'Option 3'];

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Radio Button Example'),
// //       ),
// //       body: Column(
// //         children: <Widget>[
// //           // Display the options as RadioButtons
// //           Column(
// //             children: radioOptions
// //                 .map(
// //                   (option) => RadioListTile(
// //                     title: Text(option),
// //                     value: option,
// //                     groupValue: selectedValue,
// //                     onChanged: (value) {
// //                       setState(() {
// //                         selectedValue = value.toString();
// //                       });
// //                     },
// //                   ),
// //                 )
// //                 .toList(),
// //           ),

// //         ],
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';

// class MyRadioButtonApp extends StatefulWidget {
//   @override
//   _MyRadioButtonAppState createState() => _MyRadioButtonAppState();
// }

// class _MyRadioButtonAppState extends State<MyRadioButtonApp> {
//   // The selected values
//   List<String> selectedValues = [];

//   // A list of options for the RadioButton group
//   List<String> radioOptions = ['Option 1', 'Option 2', 'Option 3'];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Radio Button Example'),
//       ),
//       body: Column(
//         children: <Widget>[
//           // Display the options as RadioButtons
//           Column(
//             children: radioOptions
//                 .map(
//                   (option) => RadioListTile(
//                     title: Text(option),
//                     value: option,
//                     groupValue: selectedValues.contains(option) ? option : null,
//                     onChanged: (value) {
//                       setState(() {
//                         if (selectedValues.contains(value)) {
//                           // If the value is already selected, deselect it
//                           selectedValues.remove(value);
//                         } else {
//                           // Otherwise, select it
//                           selectedValues.add(value!);
//                         }
//                       });
//                     },
//                   ),
//                 )
//                 .toList(),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class MyRadioButtonApp extends StatefulWidget {
  @override
  _MyRadioButtonAppState createState() => _MyRadioButtonAppState();
}

class _MyRadioButtonAppState extends State<MyRadioButtonApp> {
  List<String> selectedValues = [];

  List<String> radioOptions = ['Option 1', 'Option 2', 'Option 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Radio Button Example'),
      ),
      body: Column(
        children: <Widget>[
          // Display the options as Checkboxes
          Column(
            children: radioOptions
                .map(
                  (option) => CheckboxListTile(
                    title: Text(option),
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
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
