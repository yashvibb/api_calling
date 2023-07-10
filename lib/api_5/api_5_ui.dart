import 'package:api_calling/api_5/api_5_user_model.dart';
import 'package:flutter/material.dart';

class API5UI extends StatelessWidget {
  final List<Class5?> users;
  const API5UI({Key? key, required this.users,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context,index){
            final user = users.elementAt(index);
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
                  Text("id : ${user!.id}"),
                  Text("postId : ${user!.postId}"),
                  Text("name : ${user!.name}"),
                  Text("email : ${user!.email}"),
                  Text("body : ${user!.body}"),
                ],
              ),
            );
          }),
    );
  }
}
