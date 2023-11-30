import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../service/url.dart';

class AuthRepository {
  // login api ...
  Future login(email, password) async {
    try {
      var headers = {
        "Content-Type": "application/json",
        "Accept": "application/json",
      };
      var body = jsonEncode(
        {
          "email": email,
          "password": password,
        },
      );

      var response = await http.post(
        Uri.parse(Url.serverUrl + '/auth/loginCognito'),
        body: body,
        headers: headers,
      );
      final dynamic loginResponse = jsonDecode(response.body);

      return loginResponse;
    } catch (e) {
      //snakbar error
      Get.snackbar('faild ...', 'error login  , please try agin ',
          backgroundColor: Colors.red);
    }
  }
}
