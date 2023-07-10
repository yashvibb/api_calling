import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Api_Calling_2 extends StatefulWidget {
  const Api_Calling_2({Key? key}) : super(key: key);

  @override
  State<Api_Calling_2> createState() => _Api_Calling_2State();
}

class _Api_Calling_2State extends State<Api_Calling_2> {
  @override
  void initState() {
    api2Calling();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API - 2"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: api2Calling(),
          builder: (context,AsyncSnapshot<List<Map<String,dynamic>>?> snapshot){
            if(snapshot.hasData){
              return API2UI(
                users: snapshot.data!,
              );
            }
            else if(snapshot.hasError){
              return Text('Error : ${snapshot.error}');
            }
            else{
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
Future<List<Map<String,dynamic>>?> api2Calling()async{
  final Uri uri = Uri.parse("https://jsonPlaceholder.typicode.com/todos");
  try{
    Response response =await get(uri);
    debugPrint("statusCode : ${response.statusCode}");
    debugPrint("headers : ${response.headers}");
    if(response.statusCode == 200) {
      final list = jsonDecode(response.body);
      debugPrint("list -> ${list.runtimeType}");
      final res =List<Map<String,dynamic>>.from(list);
      debugPrint("res -> ${res.runtimeType}");
      return res;
    }else{
      return null;
    }
  }catch (e) {
    debugPrint("CatchError : $e");
    return null;
  }
}

class API2UI extends StatelessWidget {
  final List<Map<String,dynamic>> users;
  const API2UI({Key? key, required this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
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
            Text("id : ${users.elementAt(index)['id']}"),
            Text("userId : ${users.elementAt(index)['userId']}"),
            Text("title : ${users.elementAt(index)['title']}"),
            Text("completed : ${users.elementAt(index)['completed']}"),
          ],
        ),
      );
    });
  }
}

