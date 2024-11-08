// import 'package:dochome/utils/helpers/extension.dart';
// import 'package:flutter/material.dart';

// class UpcomingSchedule extends StatelessWidget {
//   const UpcomingSchedule({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 15),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             "About Doctor".tr,
//             style: TextStyle(
//                 fontSize: 18,
//                 fontFamily: 'Outfit',
//                 fontWeight: FontWeight.w500),
//           ),
//           const SizedBox(height: 15),
//           Container(
//             padding: const EdgeInsets.symmetric(vertical: 5),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(10),
//               boxShadow: const [
//                 BoxShadow(
//                   color: Colors.black12,
//                   blurRadius: 4,
//                   spreadRadius: 2,
//                 ),
//               ],
//             ),
//             child: SizedBox(
//               width: MediaQuery.of(context).size.width,
//               child: Column(
//                 children: [
//                   ListTile(
//                     title: const Text(
//                       "Dr. Doctor Name",
//                       style: TextStyle(
//                         fontFamily: 'Outfit',
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     subtitle: const Text("Physical therapy"),
//                     trailing: CircleAvatar(
//                       radius: 20,
//                       child: ElevatedButton.icon(
//                           onPressed: () {},
//                           icon: const Icon(Icons.error_outline),
//                           label: const Text('mo')),
//                       //backgroundImage: AssetImage("assets/images/booking/doctor1.jpg"),
//                     ),
//                   ),
//                   const Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 15),
//                     child: Divider(
//                       // color: Colors.black,
//                       thickness: 1,
//                       height: 20,
//                     ),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       const Row(
//                         children: [
//                           Icon(
//                             Icons.calendar_month,
//                             color: Colors.black54,
//                           ),
//                           SizedBox(width: 5),
//                           Text(
//                             "12/01/2023",
//                             style: TextStyle(
//                               fontFamily: 'Outfit',
//                               color: Colors.black54,
//                             ),
//                           ),
//                         ],
//                       ),
//                       const Row(
//                         children: [
//                           Icon(
//                             Icons.access_time_filled,
//                             color: Colors.black54,
//                           ),
//                           SizedBox(width: 5),
//                           Text(
//                             "10:30 AM",
//                             style: TextStyle(
//                               color: Colors.black54,
//                               fontFamily: 'Outfit',
//                             ),
//                           ),
//                         ],
//                       ),
//                       Row(
//                         children: [
//                           Container(
//                             padding: const EdgeInsets.all(5),
//                             decoration: const BoxDecoration(
//                               color: Colors.green,
//                               shape: BoxShape.circle,
//                             ),
//                           ),
//                           const SizedBox(width: 5),
//                           const Text(
//                             "Confirmed",
//                             style: TextStyle(
//                               fontFamily: 'Outfit',
//                               color: Colors.black54,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 15),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       InkWell(
//                         onTap: () {},
//                         child: Container(
//                           width: 150,
//                           padding: const EdgeInsets.symmetric(vertical: 12),
//                           decoration: BoxDecoration(
//                             color: const Color(0xFFF4F6FA),
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           child: const Center(
//                             child: Text(
//                               "Cancel",
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w500,
//                                 fontFamily: 'Outfit',
//                                 color: Colors.black54,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       InkWell(
//                         onTap: () {},
//                         child: Container(
//                           width: 150,
//                           padding: const EdgeInsets.symmetric(vertical: 12),
//                           decoration: BoxDecoration(
//                             color: const Color(0xFF4D8BBB),
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           child: const Center(
//                             child: Text(
//                               "Reschedule",
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w500,
//                                 fontFamily: 'Outfit',
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 10),
//                 ],
//               ),
//             ),
//           ),
//           /*SizedBox(height: 20),
//           Text(
//             "About Doctor",
//             style: TextStyle(fontSize: 18,fontFamily: 'Outfit', fontWeight: FontWeight.w500),
//           ),
//           SizedBox(height: 15),
//           Container(
//             padding: EdgeInsets.symmetric(vertical: 5),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(10),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black12,
//                   blurRadius: 4,
//                   spreadRadius: 2,
//                 ),
//               ],
//             ),
//             child: SizedBox(
//               width: MediaQuery.of(context).size.width,
//               child: Column(
//                 children: [
//                   ListTile(
//                     title: Text(
//                       "Dr. Doctor Name",
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontFamily: 'Outfit',
//                       ),
//                     ),
//                     subtitle: Text("Nurse"),
//                     trailing: CircleAvatar(
//                       radius: 25,
//                       backgroundImage: AssetImage("assets/images/booking/doctor2.jpg"),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 15),
//                     child: Divider(
//                       // color: Colors.black,
//                       thickness: 1,
//                       height: 20,
//                     ),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       Row(
//                         children: [
//                           Icon(
//                             Icons.calendar_month,
//                             color: Colors.black54,
//                           ),
//                           SizedBox(width: 5),
//                           Text(
//                             "12/01/2023",
//                             style: TextStyle(
//                               color: Colors.black54,
//                               fontFamily: 'Outfit',
//                             ),
//                           ),
//                         ],
//                       ),
//                       Row(
//                         children: [
//                           Icon(
//                             Icons.access_time_filled,
//                             color: Colors.black54,
//                           ),
//                           SizedBox(width: 5),
//                           Text(
//                             "10:30 AM",
//                             style: TextStyle(
//                               color: Colors.black54,
//                               fontFamily: 'Outfit',
//                             ),
//                           ),
//                         ],
//                       ),
//                       Row(
//                         children: [
//                           Container(
//                             padding: EdgeInsets.all(5),
//                             decoration: BoxDecoration(
//                               color: Colors.green,
//                               shape: BoxShape.circle,
//                             ),
//                           ),
//                           SizedBox(width: 5),
//                           Text(
//                             "Confirmed",
//                             style: TextStyle(
//                               color: Colors.black54,
//                               fontFamily: 'Outfit',
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 15),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       InkWell(
//                         onTap: () {},
//                         child: Container(
//                           width: 150,
//                           padding: EdgeInsets.symmetric(vertical: 12),
//                           decoration: BoxDecoration(
//                             color: Color(0xFFF4F6FA),
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           child: Center(
//                             child: Text(
//                               "Cancel",
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w500,
//                                 fontFamily: 'Outfit',
//                                 color: Colors.black54,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       InkWell(
//                         onTap: () {},
//                         child: Container(
//                           width: 150,
//                           padding: EdgeInsets.symmetric(vertical: 12),
//                           decoration: BoxDecoration(
//                             color: Color(0xFF4D8BBB),
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           child: Center(
//                             child: Text(
//                               "Reschedule",
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w500,
//                                 color: Colors.white,
//                                 fontFamily: 'Outfit',
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 10),
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(height: 20),
//           Text(
//             "About Doctor",
//             style: TextStyle(fontSize: 18, fontFamily: 'Outfit',fontWeight: FontWeight.w500),
//           ),
//           SizedBox(height: 15),
//           Container(
//             padding: EdgeInsets.symmetric(vertical: 5),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(10),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black12,
//                   blurRadius: 4,
//                   spreadRadius: 2,
//                 ),
//               ],
//             ),
//             child: SizedBox(
//               width: MediaQuery.of(context).size.width,
//               child: Column(
//                 children: [
//                   ListTile(
//                     title: Text(
//                       "Dr. Doctor Name",
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontFamily: 'Outfit',
//                       ),
//                     ),
//                     subtitle: Text('Nurse'),
//                     trailing: CircleAvatar(
//                       radius: 25,
//                       backgroundImage: AssetImage("assets/images/booking/doctor2.jpg"),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 15),
//                     child: Divider(
//                       // color: Colors.black,
//                       thickness: 1,
//                       height: 20,
//                     ),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       Row(
//                         children: [
//                           Icon(
//                             Icons.calendar_month,
//                             color: Colors.black54,
//                           ),
//                           SizedBox(width: 5),
//                           Text(
//                             "12/01/2023",
//                             style: TextStyle(
//                               fontFamily: 'Outfit',
//                               color: Colors.black54,
//                             ),
//                           ),
//                         ],
//                       ),
//                       Row(
//                         children: [
//                           Icon(
//                             Icons.access_time_filled,
//                             color: Colors.black54,
//                           ),
//                           SizedBox(width: 5),
//                           Text(
//                             "10:30 AM",
//                             style: TextStyle(
//                               fontFamily: 'Outfit',
//                               color: Colors.black54,
//                             ),
//                           ),
//                         ],
//                       ),
//                       Row(
//                         children: [
//                           Container(
//                             padding: EdgeInsets.all(5),
//                             decoration: BoxDecoration(
//                               color: Colors.green,
//                               shape: BoxShape.circle,
//                             ),
//                           ),
//                           SizedBox(width: 5),
//                           Text(
//                             "Confirmed",
//                             style: TextStyle(
//                               color: Colors.black54,
//                               fontFamily: 'Outfit',
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 15),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       InkWell(
//                         onTap: () {},
//                         child: Container(
//                           width: 150,
//                           padding: EdgeInsets.symmetric(vertical: 12),
//                           decoration: BoxDecoration(
//                             color: Color(0xFFF4F6FA),
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           child: Center(
//                             child: Text(
//                               "Cancel",
//                               style: TextStyle(
//                                 fontFamily: 'Outfit',
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w500,
//                                 color: Colors.black54,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       InkWell(
//                         onTap: () {},
//                         child: Container(
//                           width: 150,
//                           padding: EdgeInsets.symmetric(vertical: 12),
//                           decoration: BoxDecoration(
//                             color: Color(0xFF4D8BBB),
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           child: Center(
//                             child: Text(
//                               "Reschedule",
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w500,
//                                 fontFamily: 'Outfit',
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 10),
//                 ],
//               ),
//             ),
//           ),*/
//         ],
//       ),
//     );
//   }
// }
