import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Modal/modal_list_2.dart';

class PhotosApi extends StatefulWidget {
  const PhotosApi({Key? key}) : super(key: key);

  @override
  State<PhotosApi> createState() => _PhotosApiState();
}

class _PhotosApiState extends State<PhotosApi> {
  List<ModalDemo> getData = [];
  var data;

  callAPi() async {
    const url = "https://jsonplaceholder.typicode.com/photos";
    final response = await http.get(Uri.parse(url));
    data = jsonDecode(response.body);
    print(data);
    if (response.statusCode == 200) {
      for (var item in data) {
        getData.add(ModalDemo.fromJson(item));
      }
    }
  }

  @override
  void initState() {
    super.initState();
    callAPi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: const Text("API photos"),

      ),
      body: FutureBuilder(
          future: callAPi(),
          builder: (context, snapshot) {
            return ListView.builder(
                itemCount: getData.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            getData[index].url.toString()
                        ) ,
                      ),
                      title: Text(getData[index].id.toString()),
                      subtitle:Text(getData[index].title.toString()),
                    ),
                  );
                });
          }),
    );
  }
}
