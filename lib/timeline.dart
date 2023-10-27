// // // import 'package:flutter/material.dart';


// // // class TimelineItem {
// // //   final String title;
// // //   final String description;
// // //   final String time;

// // //   TimelineItem({
// // //     required this.title,
// // //     required this.description,
// // //     required this.time,
// // //   });
// // // }

// // // class MyApp871 extends StatelessWidget {
  

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return MaterialApp(
// // //       home: Scaffold(
// // //         appBar: AppBar(
// // //           title: Text('Custom Timeline'),
// // //         ),
// // //        body: BubbleTimeline(
// // //     bubbleDiameter: 120,
// // //     // List of Timeline Bubble Items
// // //     items: [
// // //         TimelineItem(
// // //             title: 'Boat',
// // //             subtitle: 'Travel through Oceans',
// // //             child: Icon(
// // //                 Icons.directions_boat,
// // //                 color: Colors.white,
// // //             ),
// // //             bubbleColor: Colors.grey,
// // //         ),
// // //         TimelineItem(
// // //             title: 'Bike',
// // //             subtitle: 'Road Trips are best',
// // //             child: Icon(
// // //                 Icons.directions_bike,
// // //                 color: Colors.white,
// // //             ),
// // //             bubbleColor: Colors.grey,
// // //         ),
// // //         TimelineItem(
// // //             title: 'Bus',
// // //             subtitle: 'I like to go with friends',
// // //             child: Icon(
// // //                 Icons.directions_bus,
// // //                 color: Colors.white,
// // //             ),
// // //             bubbleColor: Colors.grey,
// // //         ),
// // //     ],
// // //     stripColor: Colors.teal,
// // //     scaffoldColor: Colors.white,
// // // )        ,
// // //       ),
// // //     );
// // //   }
// // // }

// // import 'package:flutter/material.dart';
// // import 'package:timeline_tile/timeline_tile.dart';

// // class TimelineItem {
// //   final String title;
// //   final String description;
// //   final String time;

// //   TimelineItem({
// //     required this.title,
// //     required this.description,
// //     required this.time,
// //   });
// // }



// // class MyApp871 extends StatelessWidget {
// //   final List<TimelineItem> timelineItems = [
// //     TimelineItem(
// //       title: "Boat",
// //       description: "Travel through Oceans",
// //       time: "9:00 AM",
// //     ),
// //     TimelineItem(
// //       title: "Bike",
// //       description: "Road Trips are best",
// //       time: "10:30 AM",
// //     ),
// //     TimelineItem(
// //       title: "Bus",
// //       description: "I like to go with friends",
// //       time: "12:00 PM",
// //     ),
// //     // Add more items as needed
// //   ];

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: Scaffold(
// //         appBar: AppBar(
// //           title: Text('Custom Timeline with Bubbles'),
// //         ),
// //         body: ListView.builder(
// //           itemCount: timelineItems.length,
// //           itemBuilder: (context, index) {
// //             final item = timelineItems[index];
// //             return TimelineTile(
// //               alignment: TimelineAlign.manual,
// //               lineXY: 0.1,
// //               isFirst: index == 0,
// //               isLast: index == timelineItems.length - 1,
// //               indicatorStyle: IndicatorStyle(
// //                 width: 40,
// //                 height: 40,
// //                 indicator: Container(
// //                   decoration: BoxDecoration(
// //                     color: Colors.grey,
// //                     shape: BoxShape.circle,
// //                   ),
// //                   child: Center(
// //                     child: Icon(
// //                       Icons.directions_boat, // Change the icon as needed
// //                       color: Colors.white,
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //               endChild: Card(
// //                 elevation: 3,
// //                 margin: EdgeInsets.symmetric(vertical: 8),
// //                 child: Padding(
// //                   padding: EdgeInsets.all(16),
// //                   child: Column(
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: [
// //                       Text(
// //                         item.title,
// //                         style: TextStyle(
// //                           fontWeight: FontWeight.bold,
// //                           fontSize: 18,
// //                         ),
// //                       ),
// //                       SizedBox(height: 8),
// //                       Text(
// //                         item.description,
// //                         style: TextStyle(fontSize: 16),
// //                       ),
// //                       SizedBox(height: 8),
// //                       Text(
// //                         "Time: ${item.time}",
// //                         style: TextStyle(fontSize: 16),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ),
// //             );
// //           },
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:bubble_timeline/bubble_timeline.dart';

// class TimelineItem {
//   final String title;
//   final String subtitle;
//   final Widget child;
//   final Color bubbleColor;

//   TimelineItem({
//     required this.title,
//     required this.subtitle,
//     required this.child,
//     required this.bubbleColor,
//   });
// }

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Custom Timeline'),
//         ),
//         body: BubbleTimelineExample(),
//       ),
//     );
//   }
// }

// class BubbleTimelineExample extends StatelessWidget {
//   List<TimelineItem> timelineItems = [
//     TimelineItem(
//       title: 'Boat',
//       subtitle: 'Travel through Oceans',
//       child: Icon(
//         Icons.directions_boat,
//         color: Colors.white,
//       ),
//       bubbleColor: Colors.grey,
//     ),
//     TimelineItem(
//       title: 'Bike',
//       subtitle: 'Road Trips are best',
//       child: Icon(
//         Icons.directions_bike,
//         color: Colors.white,
//       ),
//       bubbleColor: Colors.grey,
//     ),
//     TimelineItem(
//       title: 'Bus',
//       subtitle: 'I like to go with friends',
//       child: Icon(
//         Icons.directions_bus,
//         color: Colors.white,
//       ),
//       bubbleColor: Colors.grey,
//     ),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return BubbleTimeline(
//       bubbleDiameter: 120,
//       items: timelineItems,
//       stripColor: Colors.teal,
//       scaffoldColor: Colors.white,
//     );
//   }
// }

