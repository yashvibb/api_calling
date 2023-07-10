import 'package:api_calling/api_4/api_4_user_model.dart';
import 'package:flutter/material.dart';

class API4UI extends StatefulWidget {
  final Class4? user;
  const API4UI({Key? key, this.user}) : super(key: key);

  @override
  State<API4UI> createState() => _API4UIState();
}
class _API4UIState extends State<API4UI> {
  @override
  Widget build(BuildContext context) {
    var user;
    return Scaffold(
      body: ListView.builder(
          itemCount: user.length,
          itemBuilder: (context,index){
            return Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("id : ${user.elementAt(index)['id']}"),
                  Text("userId : ${user.elementAt(index)['userId']}"),
                  Text("title : ${user.elementAt(index)['title']}"),
                  Text("completed : ${user.elementAt(index)['completed']}"),
                ],
              ),
            );
          }),
    );
  }
}
