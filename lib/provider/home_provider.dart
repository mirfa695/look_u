import 'package:flutter/material.dart';
import 'package:look_u/services/api_services.dart';
import 'package:look_u/services/location_service.dart';

class HomeProvider extends ChangeNotifier{
  List? users;
Future getUsers(BuildContext context)async{
  try{
    users=await ApiService().getUsers();
  }catch(e){
    print(e);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
  }
}
  Future searchUser(BuildContext context,String query)async{
    try{
      var data=await ApiService().searchUsers(query);
      return data;
    }catch(e){
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
  Future getLocation()async{
  try{
    LocationService().currentLocation();
  }catch(e){
    print(e);
  }
}
}