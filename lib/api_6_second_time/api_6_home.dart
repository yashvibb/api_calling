import 'package:flutter/material.dart';
import 'api_6_caller.dart';
import 'api_6_ui.dart';
import 'api_6_user_model.dart';

class API6HOME extends StatefulWidget {
  const API6HOME({Key? key}) : super(key: key);

  @override
  State<API6HOME> createState() => _API6HOMEState();
}
class _API6HOMEState extends State<API6HOME> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: api6Call6(),
          builder: (context,AsyncSnapshot<List<Class6to6>> snapshot){
            if(snapshot.hasData){
              return API6UI(users:snapshot.data!);
            }
            else if(snapshot.hasError){
              return Text("$snapshot.hasError");
            }else{
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
