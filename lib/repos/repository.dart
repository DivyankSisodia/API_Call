import 'dart:convert';

import 'package:blocapicall/repos/usermodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Repos {
  String endpoint = 'https://reqres.in/api/users?page=2';

  Future<List<Autogenerated>> getUser() async {
    Response response = await get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((e) => Autogenerated.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
}
