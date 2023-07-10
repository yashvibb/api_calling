import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class ApiCalling1 extends StatelessWidget {
  const ApiCalling1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api - 1"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder(
                future: api1Calling(),
                builder:
                    (context, AsyncSnapshot<Map<String, dynamic>?> snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                      width: double.maxFinite,
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 15,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade100,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("ID:${snapshot.data!["id"]}"),
                          Text("User-ID:${snapshot.data!["userId"]}"),
                          Text("Tital:${snapshot.data!["tital"]}"),
                          Text("Completed:${snapshot.data!["completed"]}"),
                        ],
                      ),
                    );
                  } else if (snapshot.hasError) {
                    throw Exception("Error : ${snapshot.error}");
                  } else {
                    return CircularProgressIndicator();
                  }
                })
          ],
        ),
      ),
    );
  }
}

Future<Map<String, dynamic>?> api1Calling() async {
  final url = Uri.parse("https://jsonplaceholder.typicode.com/todos/1");
  try {
    Response response = await http.get(url);
    print("statusCode : ${response.statusCode}");
    print("body : ${response.body}");
    if (response.statusCode == 200) {
      final Map<String, dynamic> result = jsonDecode(response.body);
      return result;
    } else {
      return null;
    }
  } catch (e) {
    print('API-1 Error : $e');
    return null;
  }
}
