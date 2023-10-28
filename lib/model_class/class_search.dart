import 'package:flutter/material.dart';
import 'package:look_u/provider/home_provider.dart';
import 'package:provider/provider.dart';

class Search extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
   return FutureBuilder(future: context.read<HomeProvider>().searchUser(context, query),
       builder: (context,snapshot){
     if(snapshot.hasData){
       return ListView.builder(
         itemCount: snapshot.data.length,
           itemBuilder: (BuildContext context,int index){
         return Card(child: ListTile(title: Text(snapshot.data[index].name??'User'),));
       });
     }else if(snapshot.data==null){return Text('No Data');}
     else{return Text('Eror');}
    });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(future: context.read<HomeProvider>().searchUser(context, query),
        builder: (context,snapshot){
          if(snapshot.hasData){
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context,int index){
              return Card(child: ListTile(title: Text(snapshot.data[index].name??'User'),));
            });
          }else if(snapshot.data==null){return Text('No Data');}
          else{return Text('Eror');}
        });
  }
}
