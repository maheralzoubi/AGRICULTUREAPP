import 'dart:convert';

import 'package:agricultureapp/constants/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../service/url.dart';

class Defaulrrepository {
  // login api ...
  Future DefaultData() async {
    try {
      var headers = {
        "Content-Type": "application/json",
        "Accept": "application/json",
      };

      var response = await http.get(
        Uri.parse(Url.serverUrl +
            '/api/getDailyAverageReadingsForEveryNode/node_pns1'),
        headers: headers,
      );
      final dynamic data = jsonDecode(response.body);

      return data;
    } catch (e) {
      //snakbar error
    }
  }

  Future AverageAllNodes() async {
    dynamic userId = await SharedPreferenceHelper.get("userId");

    print("userId \t $userId");
    try {
      var headers = {
        "Content-Type": "application/json",
        "Accept": "application/json",
      };

      var response = await http.get(
        Uri.parse(Url.serverUrl +
            '/api/getDailyAverageReadingsForAllNodes/user_$userId'),
        headers: headers,
      );
      final dynamic data = jsonDecode(response.body);

      print("maher \t $data");

      return data;
    } catch (e) {
      //snakbar error
    }
  }
}
