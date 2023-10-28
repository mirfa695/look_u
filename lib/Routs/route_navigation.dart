import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:look_u/Routs/route_names.dart';
import 'package:look_u/screens/default_page.dart';
import 'package:look_u/screens/home_page.dart';
import 'package:look_u/screens/location_page.dart';

class RouteNavigation{
static Route<dynamic> generateRoute(RouteSettings settings){
  switch(
settings.name
){
    case RouteName.homeRoute:return MaterialPageRoute(builder: (context)=>HomePage());
    case RouteName.locationRoute:return MaterialPageRoute(builder: (context)=>LocationPage());
    default:return MaterialPageRoute(builder: (context)=>DefaultPage());
  }
}
}