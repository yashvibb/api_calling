import 'package:flutter/material.dart';

class API3UI extends StatelessWidget {
  final Map<String,dynamic>? user;
  const API3UI({Key? key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return user != null ?
        Container(
          width: double.maxFinite,
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          decoration: BoxDecoration(
            color: Colors.green.shade100,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("ID : ${user!["id"]}"),
              Text("Name : ${user!["name"]}"),
              Text("Email : ${user!["email"]}"),
              Text("Phone : ${user!["phone"]}"),
              Text("Website : ${user!["website"]}"),
              SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Company"),
                        Text("Name : ${user!['company']['name']}"),
                        Text("Pharse : ${user!['company']['catchPharse']}"),
                        Text("Bs : ${user!['company']['bs']}"),
                      ],
                    ),
                  )),
                  SizedBox(width: 10),
                  Expanded(child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,vertical: 20,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Address"),
                        Text("Street : ${user!['address']['street']}"),
                        Text("City : ${user!['address']['city']}"),
                        Text("Zipcode : ${user!['address']['zipcode']}"),
                        Text("Landmark"),
                        Text("Latitude : ${user!['address']['geo']['lat']}"),
                        Text("Longitude : ${user!['address']['geo']['lng']}"),
                      ],
                    ),
                  ))
                ],
              )
            ],
          ),
        ) : Center(child: Text("Somethingwentwrong"));
  }
}
