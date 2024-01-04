import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../Modal/countries_data.dart';
import '../Services/call_urls.dart';
import 'detail_screen.dart';

class CountryScreen extends StatefulWidget {
  const CountryScreen({Key? key}) : super(key: key);

  @override
  State<CountryScreen> createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  CallUrls callUrls = CallUrls();
  TextEditingController searchController = TextEditingController();
  List<CountryData>? dataArr;
  // List  countryDataList = callUrls.countryDataList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      //   iconTheme: const IconThemeData(
      //     color: Colors.black,
      //   ),
      // ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                controller: searchController,
                onChanged: (value) {
                  setState(() {});
                },
                decoration: const InputDecoration(
                    hintText: " Search with country name",
                    border: OutlineInputBorder(
                        // borderSide: BorderSide(width: 5.0,color: Colors.black,),
                        borderRadius: BorderRadius.all(Radius.circular(33.0)))),
              ),
              const SizedBox(
                height: 10,
              ),
              FutureBuilder<List<CountryData>>(
                  future: callUrls.fetchCountriesData(),
                  builder: (context, snapshot) {
                    print("country data ===> ${snapshot.data}");
                    print("country data ===> ${snapshot.data?[0].country}");
                    dataArr = [];
                    dataArr = (searchController.text == ""
                        ? snapshot.data
                        : snapshot.data
                            ?.where((element) =>
                                (element.country?.toLowerCase() ?? "").contains(
                                    searchController.text.toLowerCase()))
                            .toList());

                    return dataArr != null
                        ? Expanded(
                            child: ListView.builder(
                                itemCount: dataArr?.length,
                                itemBuilder: (context, index) {
                                  // String name =
                                  //     dataArr?[index].country.toString() ??
                                  //         " no value ";
                                  // if (searchController.text.isEmpty) {
                                  return ListTile(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailScreen(
                                                    dataArr![index],
                                                  )));
                                    },
                                    leading: SizedBox(
                                        height: 70,
                                        width: 70,
                                        child: Image.network(
                                            dataArr?[index]
                                                    .countryInfo
                                                    ?.flag
                                                    .toString() ??
                                                "null",
                                            fit: BoxFit.cover)),
                                    title: Text(
                                        dataArr?[index].country.toString() ??
                                            "null"),
                                    subtitle: Text(
                                        dataArr?[index].cases.toString() ??
                                            " "),
                                  );
                                  // }
                                  // else if (name.toLowerCase().contains(
                                  //     searchController.text.toLowerCase())) {
                                  //   return ListTile(
                                  //     leading: SizedBox(
                                  //         height: 70,
                                  //         width: 70,
                                  //         child: Image.network(
                                  //             dataArr?[index].countryInfo
                                  //                     ?.flag
                                  //                     .toString() ??
                                  //                 "null",
                                  //             fit: BoxFit.cover)),
                                  //     title: Text(dataArr?[index].country
                                  //             .toString() ??
                                  //         "null"),
                                  //     subtitle: Text(dataArr?[index].cases
                                  //             .toString() ??
                                  //         " "),
                                  //   );
                                  // } else {
                                  //   return Container();
                                  // }
                                }),
                          )
                        : Expanded(
                            child: Shimmer.fromColors(
                              baseColor: Colors.grey.shade700,
                              highlightColor: Colors.grey.shade100,
                              child: ListView.builder(
                                  itemCount: 10,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      leading: Container(
                                        height: 70,
                                        width: 70,
                                        color: Colors.black,
                                      ),
                                      title: Container(
                                        height: 10,
                                        width: 80,
                                        color: Colors.black,
                                      ),
                                      subtitle: Container(
                                        height: 10,
                                        width: 80,
                                        color: Colors.black,
                                      ),
                                    );
                                  }),
                            ),
                          );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
