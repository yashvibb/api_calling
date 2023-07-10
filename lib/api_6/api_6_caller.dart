// import 'dart:developer';
//
// import 'package:dio/dio.dart';
// import 'api_6_user_model.dart';
// Future<List<Class6>> api6Call() async{
//   final dio = Dio();
//   const uri ="https://jsonplaceholder.typicode.com/users";
//
//   try{
//     Response response=await dio.get(uri);
//     print("statusCode:${response.statusCode}");
//     print("data:${response.data}");
//     if(response.statusCode==200){
//       final List list=response.data;
//       final result=List<Class6>.from(list.map((e) => Class6.fromJson(e)));
//       return result;
//     }
//     else{
//       return [];
//     }
//   } on  DioException catch(e){
//     log('dioCatchError : $e');
//     return [];
//     }
//
//   catch(e){
//     log('catchError : $e');
//     return [];
//     }
// }