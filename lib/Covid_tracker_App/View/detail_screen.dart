import 'package:api_tutorial/Covid_tracker_App/Services/call_urls.dart';
import 'package:api_tutorial/Widgets/reuseable_row.dart';
import 'package:flutter/material.dart';

import '../Modal/countries_data.dart';

class DetailScreen extends StatelessWidget {
  CountryData country;
  DetailScreen(this.country, {super.key});
  CallUrls callApi = CallUrls();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(country.country.toString()),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ReuseableRow(
                              text: "Cases", value: country.cases.toString()),
                          const SizedBox(
                            height: 20,
                          ),
                          ReuseableRow(
                              text: "Recovered",
                              value: country.recovered.toString()),
                          const SizedBox(
                            height: 20,
                          ),
                          ReuseableRow(
                              text: "Active", value: country.active.toString()),
                          const SizedBox(
                            height: 20,
                          ),
                          ReuseableRow(
                              text: "Death", value: country.deaths.toString()),
                        ],
                      ),
                    ),
                  ),
                ),
                CircleAvatar(
                  radius: 50,
                  backgroundImage:
                      NetworkImage(country.countryInfo!.flag.toString()),
                ),
              ],
            ),
          ],
        ));
  }
}
