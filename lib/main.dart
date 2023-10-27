import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:k_y_c_/bank_details.dart';
import 'package:k_y_c_/d_o_b.dart';
import 'package:k_y_c_/digital_signature.dart';
import 'package:k_y_c_/example.dart';
import 'package:k_y_c_/first_screen.dart';
import 'package:k_y_c_/login.dart';
import 'package:k_y_c_/manual_upload_bank.dart';
import 'package:k_y_c_/nominee.dart';
import 'package:k_y_c_/otp.dart';
import 'package:k_y_c_/pancard.dart';

import 'package:k_y_c_/personal_.dart';
import 'package:k_y_c_/proceed_digital_esign.dart';
import 'package:k_y_c_/secondpage_personal.dart';
import 'package:k_y_c_/thirdpage_personal.dart';
import 'package:k_y_c_/timeline.dart';
import 'package:k_y_c_/trading_preference.dart';
import 'package:k_y_c_/webfile.dart';
import 'package:loading_animations/loading_animations.dart';

final storage = GetStorage();
void main() async {
  await GetStorage.init();
  runApp(myapp());
}

class myapp extends StatelessWidget {
  const myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          textTheme: TextTheme(
            bodyText1: TextStyle(
              fontFamily: 'Gotham', // Use the font family you specified
              fontSize: 16.0, // Set the default font size
              fontWeight: FontWeight.normal, // Set the default font weight
            ),
            // Define more text styles as needed
          ),
        ),
        debugShowCheckedModeBanner: false,
        title: '871',
        home: spalsh());
  }
}

class spalsh extends StatefulWidget {
  const spalsh({super.key});

  @override
  State<spalsh> createState() => _spalshState();
}

class _spalshState extends State<spalsh> {
  @override
  void initState() {
    super.initState();
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(Duration(seconds: 5)).then((value) {
      Navigator.of(context).pushReplacement(CupertinoPageRoute(
        builder: (context) =>

            // MyHomePage123()
            // secondpage_personal()
            // Personal()
            // GetStarted(),
            Personal(),
        // otp()
        // pancard(),
        // d_o_b()
        // MyInApp
        //pWebView()
        // proceed_digital_esign()
        // secondpage_personal()
        // nominee()
        // WebViewExample()̣
        // secondpage_personal()
        // thirdpage_personal()
        // bank_details()
        // trading_preference(),
        // manual_upload_bank(),
        // MyHomePage123()
      ));
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo6.png', width: 250),
            SizedBox(
              height: 50,
            ),
            LoadingFadingLine.circle(
              backgroundColor: Color.fromARGB(195, 4, 78, 73),
              borderColor: Color.fromARGB(195, 4, 78, 73),
              size: 30.0,
            )
          ],
        ),
      ),
    );
  }
}

// // // // https://www.syncfusion.com/blogs/post/easily-create-pdf-files-using-syncfusion-pdf-library-for-flutter.aspx

// // import 'package:flutter/material.dart';
// // import 'package:url_launcher/url_launcher.dart';

// // void main() {
// //   runApp( MaterialApp(title: '871',
// //   home:

// //     Scaffold(
// //     body:  Center(
// //       child:  ElevatedButton(
// //         onPressed: _launchURL,
// //         child: new Text('Show Flutter homepage'),
// //       ),
// //     ),
// //   )));
// // }

// // _launchURL() async {
// //    final Uri url = Uri.parse('http://connect.arhamshare.com:9090/EAPI/esign');
// //    if (!await launchUrl(url)) {
// //         throw Exception('Could not launch $url');
// //     }
// // }

// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

// void main() {
//   runApp(MaterialApp(
//     title: '871',
//     home: Scaffold(
//       body: Center(
//         child: ElevatedButton(
//           onPressed: _launchURL,
//           child: Text('Show Flutter homepage'),
//         ),
//       ),
//     ),
//   ));
// }

// _launchURL() async {
//   // final Uri url = Uri.parse('http://connect.arhamshare.com:9090/EAPI/esign');
//   final String encodedUrl = Uri.encodeFull('http://connect.arhamshare.com:9090/EAPI/esign');
// final Uri url = Uri.parse(encodedUrl);

//   if (!await canLaunch(url.toString())) {
//     throw Exception('Could not launch $url');
//   } else {
//     await launch(url.toString());
//   }
// }

// // import 'package:flutter/material.dart';
// // import 'package:flutter/widgets.dart';
// // import 'package:webview_flutter/webview_flutter.dart';

// // void main() {
// //   WidgetsFlutterBinding.ensureInitialized();
// //   runApp(MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: Scaffold(
// //         appBar: AppBar(
// //           title: Text('WebView Example'),
// //         ),
// //         body: WebView(
// //           initialUrl: 'http://connect.arhamshare.com:9090/EAPI/esign',
// //           // javascriptMode: JavascriptMode.unrestricted, // Enable JavaScript
// //         ),
// //       ),
// //     );
// //   }
// // }
