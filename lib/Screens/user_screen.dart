import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Modal/user_modal.dart';

class UserApi extends StatefulWidget {
  const UserApi({Key? key}) : super(key: key);

  @override
  State<UserApi> createState() => _UserApiState();
}

class _UserApiState extends State<UserApi> {

  @override
  initState(){
    super.initState();
    callUserApi();
  }
  List<Usermodal> userlist = [];
  var data;
  Future<List<Usermodal>> callUserApi() async {
    const url = "https://jsonplaceholder.typicode.com/users";
    final response = await http.get(Uri.parse(url));
    data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      for (var item in data) {
        userlist.add(Usermodal.fromJson(item));
      }

    }
    return userlist;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Api"),
      ),
      body: FutureBuilder(
        future: callUserApi(),
        builder: (context, AsyncSnapshot<List<Usermodal>> snapshot) {
          return snapshot.hasData
              ? ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(snapshot.data?[index].address?.street.toString() ?? ""),
                  );
                })
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}
