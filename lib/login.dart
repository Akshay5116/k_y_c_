
// import 'package:flutter/material.dart';
// import 'package:k_y_c_/first_screen.dart';

// class GetStarted extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         foregroundColor: Colors.black,
//         centerTitle: true,
//         elevation: 0,
//         backgroundColor: Colors.transparent,
//         title: Container(
//           height: 50,
//           width: 200,
//           child: Image.asset('assets/logo6.png'),
//         ),
//       ),
//       body: Center(
//         child: Column(
      
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             SizedBox(height: 20),
//             Image.asset(
//               'assets/security.png',
//               width: 500,
//               height: 250,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Center(
//                 child: Text(
//                   'Welcome to Arham e-KYC!',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Text(
//                 'A One Stop Portal For You To Learn the latest Technologies From SCRATCH',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 16,
//                 ),
//               ),
//             ),
//             GestureDetector(
//               child: InkWell(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => FirstScreen()),
//                   );
//                 },
//                 child: Container(
//                   child: Text(
//                     'Open Demat Account',
//                     style: TextStyle(
//                       fontSize: 18,
//                       color: Color.fromARGB(195, 4, 78, 73),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Text(
//               'Powered by ArhamShare Pvt Ltd.',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 8,
//                 color: Colors.grey,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     home: GetStarted(),
//   ));
// }
// import 'package:flutter/material.dart';
// import 'package:k_y_c_/first_screen.dart';

// class GetStarted extends StatelessWidget {
//   const GetStarted({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         foregroundColor: Colors.black,
//         centerTitle: true,
//         elevation: 0,
//         backgroundColor: Colors.transparent,
//         title: Container(
//           height: 50,
//           width: 200,
//           child: Image.asset('assets/logo6.png'),
//         ),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SizedBox(height: 20),
//             Image.asset(
//               'assets/security.png',
//               width: 500,
//               height: 250,
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Welcome to Arham e-KYC!',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 20),
//             Text(
//               'A One Stop Portal For You To Learn the latest Technologies From SCRATCH',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 16,
//               ),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => FirstScreen()),
//                 );
//               },
//               style: ButtonStyle(
//                 backgroundColor:
//                     MaterialStateProperty.all<Color>(Color.fromARGB(195, 4, 78, 73)),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//                 child: Text(
//                   'Open Demat Account',
//                   style: TextStyle(
//                     fontSize: 18,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Powered by ArhamShare Pvt Ltd.',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 12,
//                 color: Colors.grey,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     home: GetStarted(),
//   ));
// }
