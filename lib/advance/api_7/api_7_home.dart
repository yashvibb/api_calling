import 'package:api_calling/advance/api_7/service_class.dart';
import 'package:api_calling/advance/api_7/service_provider.dart';
import 'package:flutter/material.dart';
import 'api_7_ui.dart';
import 'package:provider/provider.dart';

class API7HOME extends StatefulWidget {
  const API7HOME({Key? key}) : super(key: key);

  @override
  State<API7HOME> createState() => _API7HOMEState();
}

class _API7HOMEState extends State<API7HOME> {
  List<ServiceClass>? services;

  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<ServiceProvider>().readService().then((value) {
        if (value.success && value.data != null) {
          services = value.data;
          setState(() {});
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ServiceProvider>();
    return Scaffold(
      body: provider.isLodingforServer
          ? Center(
              child: CircularProgressIndicator(),
            )
          : services != null
              ? API7UI(services: services!)
              : Center(
                  child: Text("ErrorPage"),
                ),
    );
  }
}
