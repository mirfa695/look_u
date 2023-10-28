import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:look_u/model_class/class_users.dart';
import 'package:look_u/network_failures.dart';
class ApiService{
  Future getUsers()async{
  final  response=await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
  if(response.statusCode==200){
    var decodeData=jsonDecode(response.body);
    List<Users> UserList=await decodeData.map<Users>((data){
      return Users.fromJson(data);
    }).toList();
    return UserList;
  }else{
    throw NetworkFailures.errorHandling(response.statusCode);
  }
  }
  Future searchUsers(String query)async{
    final  response=await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users?query=$query'));
    if(response.statusCode==200){
      var decodeData=jsonDecode(response.body);
      List<Users> UserList=await decodeData.map<Users>((data){
        return Users.fromJson(data);
      }).toList();
      return UserList;
    }else{
      throw 'Error';
    }}
}