import 'dart:convert';

import "package:flutter/material.dart";
import 'package:http/http.dart' as http;

import '../Modal/complex_modal.dart';

class ComplexApiScreen extends StatefulWidget {
  const ComplexApiScreen({Key? key}) : super(key: key);

  @override
  State<ComplexApiScreen> createState() => _ComplexApiScreenState();
}

class _ComplexApiScreenState extends State<ComplexApiScreen> {
  @override
  void initState() {
    super.initState();
    callComplexApi();
  }

  var data;
  Future<ComplexModal> callComplexApi() async {
    const url = "https://webhook.site/229016be-ca00-4bb3-8234-2c2898adc93a";
    final response = await http.get(Uri.parse(url));
    data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return ComplexModal.fromJson(data);
    } else {
      return ComplexModal.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Complex Api "),
      ),
      body: FutureBuilder<ComplexModal>(
        future: callComplexApi(),
        builder: (context, snapshot) {
          return snapshot.connectionState == ConnectionState.waiting
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: snapshot.data?.data?.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            snapshot.data?.data?[index].shop?.name.toString() ??
                                "null"),
                        Text(snapshot.data?.data?[index].shop?.description
                                .toString() ??
                            "null"),
                        Container(
                          height: 300,
                          width: double.infinity ,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount:
                                  snapshot.data?.data?[index].images?.length,
                              itemBuilder: (context, imgIndex) {
                                return Container(
                                  margin: const EdgeInsets.only(right: 10,bottom: 20,top: 10),
                                  height: 300,
                                  width: 300,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(snapshot
                                                  .data
                                                  ?.data?[index]
                                                  .images?[imgIndex]
                                                  .url
                                                  .toString() ??
                                              " null"))),
                                );
                              }),
                        ),

                      ],
                    );
                  });
        },
      ),
    );
  }
}
