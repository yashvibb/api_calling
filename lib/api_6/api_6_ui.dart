// import 'package:api_calling/api_6/api_6_user_model.dart';
// import 'package:flutter/material.dart';
//
// class API6UI extends StatelessWidget {
//   final List<Class6> users;
//   const API6UI({Key? key, required this.users}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return  Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: ListView.builder(
//           itemCount: users.length,
//           itemBuilder: (context,index){
//             final Class6 user = users.elementAt(index);
//             return Container(
//               decoration: BoxDecoration(
//                 color: Colors.green.shade50,
//                 borderRadius: BorderRadius.circular(25),
//               ),
//               child: Column(
//                 children: [
//                   Text("id:${user.id}"),
//                 ],
//               ),
//             );
//           }),
//     );
//   }
// }
