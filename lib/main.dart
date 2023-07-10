import 'package:api_calling/api_5/api_5_home.dart';
import 'package:api_calling/basic_level/api_3/api3home.dart';
import 'package:api_calling/basic_level/api_calling_1.dart';
import 'package:api_calling/function/navigation_function.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'advance/api_7/api_7_home.dart';
import 'advance/api_7/service_provider.dart';
import 'api_4/api_4_home.dart';
import 'api_6_second_time/api_6_home.dart';
import 'basic_level/api_calling_2.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ServiceProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api Calling"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    nextScreen(context, ApiCalling1());
                  },
                  child: Text("APIcalling")),
              SizedBox(height: 8),
              ElevatedButton(
                  onPressed: () {
                    nextScreen(context, Api_Calling_2());
                  },
                  child: Text("API - 2")),
              SizedBox(height: 8),
              ElevatedButton(
                  onPressed: () {
                    nextScreen(context, API3HOME());
                  },
                  child: Text("API - 3")),
              SizedBox(height: 8),
              ElevatedButton(
                  onPressed: () {
                    nextScreen(context, API4HOME());
                  },
                  child: Text("API - 4")),
              SizedBox(height: 8),
              ElevatedButton(
                  onPressed: () {
                    nextScreen(context, API5HOME());
                  },
                  child: Text("API - 5")),
              SizedBox(height: 8),
              ElevatedButton(
                  onPressed: () {
                    nextScreen(context, API6HOME());
                  },
                  child: Text("API - 6")),
              SizedBox(height: 8),
              ElevatedButton(
                  onPressed: () {
                    nextScreen(context, API7HOME());
                  },
                  child: Text("API - 7")),
            ],
          ),
        ),
      ),
    );
  }
}
