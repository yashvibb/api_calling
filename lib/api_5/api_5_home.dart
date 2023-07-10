import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'api_5_ui.dart';
import 'api_5_user_model.dart';

class API5HOME extends StatefulWidget {
  const API5HOME({Key? key}) : super(key: key);

  @override
  State<API5HOME> createState() => _API5HOMEState();
}

class _API5HOMEState extends State<API5HOME> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: api5(),
          builder: (context,AsyncSnapshot<List<Class5?>> snapshot){
        if(snapshot.hasData){
          return API5UI(users: snapshot.data!);
        }else if(snapshot.hasError){
          throw Exception(Text('${snapshot.error}'));
        }
        return CircularProgressIndicator();
      }
      ),
    );
  }
}

Future<List<Class5?>> api5() async {
  final url = Uri.parse("https://jsonplaceholder.typicode.com/comments");
  try {
    Response response = await http.get(url);
    if(response.statusCode == 200){
      final body = response.body;
      final list = jsonDecode(body);
      final result = List<Class5>.from(list.map((e) => Class5.fromJson(e)));
      return result;
    }
    else{
      return [];
    }
  }catch(e){
    return [];
  }
}