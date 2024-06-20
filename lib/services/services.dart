import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:vodafone/models/models.dart';

class ApiServices {
  String endpoint =
      "https://newsapi.org/v2/top-headlines?country=us&apiKey=c0431897f9f844f2b6122393af123ab7";
  Future<List<NewsModel>> getUsers() async {
    Response fetchUsers = await get(Uri.parse(endpoint));
    if (fetchUsers.statusCode == 200) {
      final List data = jsonDecode(fetchUsers.body)['articles'];
      return data.map((e) => NewsModel.fromJson(e)).toList();
    } else {
      throw Exception(fetchUsers.reasonPhrase);
    }
  }
}

final service = Provider<ApiServices>((ref) => ApiServices());
