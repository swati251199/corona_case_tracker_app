import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WithoutModal extends StatefulWidget {
  const WithoutModal({Key? key}) : super(key: key);

  @override
  State<WithoutModal> createState() => WithoutModalState();
}

class WithoutModalState extends State<WithoutModal> {
  var data;
  Future callApi() async {
    const url = "https://jsonplaceholder.typicode.com/users";
    final response = await http.get(Uri.parse(url));
    data = jsonDecode(response.body.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Hit Api without modal"),
        ),
        body: FutureBuilder(
            future: callApi(),
            builder: (context, snapshot) {
              return
              snapshot.connectionState == ConnectionState.waiting
                  ? const Center(child: Text("LOADING ......"))
                  : ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                         leading: Text(data[index]["username"]),
                            title: Text(data[index]["name"]),
                            subtitle: Text(data[index]["email"]),

                          ),
                        );
                      });
            }));
  }
}
