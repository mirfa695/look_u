import 'package:flutter/material.dart';
import 'package:look_u/Routs/route_names.dart';
import 'package:look_u/custom_widgets/custom_text.dart';
import 'package:look_u/model_class/class_search.dart';
import 'package:look_u/provider/home_provider.dart';
import 'package:provider/provider.dart';
import 'dart:js' as js;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomeProvider>().getUsers(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Users',
            style: TextStyle(
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold,
                fontSize: 25),
          ),
          backgroundColor: Colors.white,
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: Search());
                },
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                ))
          ],
        ),
        body: Consumer<HomeProvider>(
          builder: (BuildContext context, HomeProvider value, Widget? child) {
            return ListView.builder(
                itemCount: value.users?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  return value.users != null
                      ? Card(
                          child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, RouteName.locationRoute);
                          },
                          child: ListTile(
                            trailing: Text(
                              '#$index',
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            leading: const CircleAvatar(
                              backgroundImage: NetworkImage(
                                'https://t4.ftcdn.net/jpg/02/29/75/83/360_F_229758328_7x8jwCwjtBMmC6rgFzLFhZoEpLobB6L8.jpg',
                              ),
                              radius: 20,
                            ),
                            title: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: 'Name: ',
                                  value: value.users![index].name,
                                ),
                                CustomText(
                                  text: 'username: ',
                                  value: value.users![index].username,
                                ),
                                CustomText(
                                  text: 'Email: ',
                                  value: value.users![index].email,
                                ),
                                CustomText(
                                  text: 'phone no:  ',
                                  value: value.users![index].phone,
                                ),
                                Row(
                                  children: [
                                    const Text('Website: ',
                                        style: TextStyle(
                                            color: Colors.deepPurple,
                                            fontWeight: FontWeight.bold)),
                                    InkWell(
                                        onTap: () {
                                          js.context.callMethod('open', [
                                            'https://' +
                                                value.users![index].website
                                          ]);
                                        },
                                        child:
                                            Text(value.users![index].website))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ))
                      : Text('No data');
                });
          },
        ));
  }
}
