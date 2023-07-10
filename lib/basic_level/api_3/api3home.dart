import 'package:api_calling/basic_level/api_3/api3_ui.dart';
import 'package:flutter/material.dart';

import 'api3caller.dart';

class API3HOME extends StatefulWidget {
  const API3HOME({Key? key}) : super(key: key);

  @override
  State<API3HOME> createState() => _API3HOMEState(
  );
}
class _API3HOMEState extends State<API3HOME> {

  // @override
  // void initState() {
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {api3Caller();});
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api 3 home"),
      ),
      body: FutureBuilder(
        future: api3Caller(),
        builder: (context ,AsyncSnapshot<Map<String,dynamic>?> snapshot){
          if(snapshot.hasData){
            return API3UI(user: snapshot.data);
          }
          else if(snapshot.hasError){
            return Text('YourErrorUi : ${snapshot.error}');
          }
          else{
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
