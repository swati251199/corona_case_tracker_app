import 'dart:convert';

import 'package:api_tutorial/Covid_tracker_App/Services/utilities/app_urls.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Modal/countries_data.dart';
import '../Modal/world_data.dart';

class CallUrls {
  Future<WorldData> fetchWorldData() async {
    var data;
    final response = await http.get(Uri.parse(AppUrl.worldStatesUrl));
    data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return WorldData.fromJson(data);
    } else {
      return WorldData.fromJson(data);
    }
  }


 Future <List<CountryData>> fetchCountriesData() async {
   List<CountryData> countryDataList = [];
    var data;
    //countryDataList = [];
    final response = await http.get(Uri.parse(AppUrl.countryListUrl));
    data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      for (var item in data) {
        countryDataList.add(CountryData.fromJson(item));
      }
    }
    print("call");
    print(countryDataList.length);
    return countryDataList ;
  }

  // Future<List<CountryData>> fetchCountriesData() async {
  //   var data;
  //   final response = await http.get(Uri.parse(AppUrl.countryListUrl));
  //   data = jsonDecode(response.body);
  //
  //   if(response.statusCode == 200){
  //     countryDataList.add(CountryData.fromJson(data));
  //     return countryDataList;
  //   }
  //   else{
  //     return countryDataList;
  //   }
  // }
}
