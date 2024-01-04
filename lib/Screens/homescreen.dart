import 'dart:convert';
import 'package:api_tutorial/Screens/photosApi_screens.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Modal/modelList.dart';
import '../Widgets/drawer.dart';

class HomePage extends StatelessWidget {
   HomePage({Key? key}) : super(key: key);

  var data;

  List<ModelList> arrData = [];

  hitApi() async {
    const url = "https://jsonplaceholder.typicode.com/posts";
    final response = await http.get(Uri.parse(url));
    data = jsonDecode(response.body);

    if (data != null) {
      for (var item in data) {
        arrData.add(modelListFromJson(item));
      }
      for (var x in arrData) {
        //print("Item ===== ${x.body}");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("API Tutorials"),
      ),
      body: FutureBuilder(
        future: hitApi(),
        builder: (context, snapshot) {
          return arrData.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: arrData.length,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: ListTile(
                            //leading: Text(snapshot.data![index].title.toString()),
                              leading: Text(arrData[index].id.toString()),
                              title: Text(arrData[index].title.toString()),
                              subtitle: Text(arrData[index].body.toString()),
                              trailing: Text(
                                arrData[index].userId.toString(),
                              )),
                        ));
                  });
        },
      ),
      drawer: const DrawerWidget(),
    );
  }
}
