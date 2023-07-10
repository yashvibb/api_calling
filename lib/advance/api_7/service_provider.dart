import 'dart:developer';

import 'package:api_calling/advance/api_7/service_class.dart';
import 'package:api_calling/advance/responce_class.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ServiceProvider extends ChangeNotifier {
  final dio = Dio();
  bool isLodingforServer = false;

  Future<ResponseClass<List<ServiceClass>>> readService() async {
    const uri = "https://garage.logispire.in/api/service/garage/1";

    ResponseClass<List<ServiceClass>> responseClass = ResponseClass(
      message: 'API is Calling',
        success: false);
    try {
      isLodingforServer = true;
      notifyListeners();
      Response response = await dio.get(uri, options: Options(
          validateStatus: (status) {return status == 200 || status == 404 || status == 400 || status == 500;}
      ));
      log("statusCode : ${response.statusCode}");
      log("Msg : ${response.data['msg']}");
      if(response.statusCode==200){
        responseClass.success=true;
        responseClass.message = response.data['msg'];
        responseClass.data=List<ServiceClass>.from(response.data['data'].map(
            (e) => ServiceClass.fromJson(e),
        ));
        isLodingforServer=false;
        notifyListeners();
        return responseClass;
      }else{
        responseClass.success=false;
        responseClass.message="Something went wrong";
        isLodingforServer=false;
        notifyListeners();
        return responseClass;
      }
    }
    on DioException catch(e){
      log("DioCatchError : $e");
      isLodingforServer=false;
      notifyListeners();
      return responseClass;
    }
    catch(e){
      isLodingforServer=false;
      log("CatchError : $e");
      notifyListeners();
      return responseClass;
    }
  }
}