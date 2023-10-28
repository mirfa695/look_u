import 'package:flutter/material.dart';
import 'package:look_u/Routs/route_names.dart';
import 'package:look_u/Routs/route_navigation.dart';
import 'package:look_u/provider/home_provider.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(
      ChangeNotifierProvider(create: (context)=>HomeProvider(),child: Main()));

}
class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteName.homeRoute,
      onGenerateRoute: RouteNavigation.generateRoute,
      theme: ThemeData(scaffoldBackgroundColor: Colors.deepPurple),
    );
  }
}
