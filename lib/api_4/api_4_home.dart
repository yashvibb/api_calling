import 'dart:convert';
import 'package:api_calling/api_4/api_4_ui.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'api_4_user_model.dart';

class API4HOME extends StatelessWidget {
  const API4HOME({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FutureBuilder(builder: (context,AsyncSnapshot<Class4?> snapshot){
            if(snapshot.hasData){
              return API4UI(user: snapshot.data!,);
            }else if(snapshot.hasError){
              return Text('${snapshot.error}');
            }
            return CircularProgressIndicator();
          }
          )
        ],
      ),
    );
  }
}
Future<Class4?> api4Caller() async {
  final url = Uri.parse("https://jsonplaceholder.typicode.com/todos/1");
  try {
    Response response = await http.get(url);
    if (response.statusCode == 200) {
      final json = response.body;
      final body = jsonDecode(json);
      final result = Class4.fromJson(body);
      return result;
    } else {
      return null;
    }
  } catch (e) {
    print('API-1 Error : $e');
    return null;
  }
}