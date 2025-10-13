import 'dart:convert';
import 'dart:developer';
import 'dart:concurrent';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/SRC/Data/Models/news_model_art.dart';
import 'package:news_app/SRC/Data/Models/news_model_world.dart';
import 'package:news_app/SRC/Data/repositories/api/api_urls.dart';

class ApiService {
  Future<NewsModel> worldApiResponse() async {
    final response = await http.get(
      Uri.parse(
        'https://api.nytimes.com/svc/topstories/v2/world.json?api-key=CRd67irJ8kAnHDtl79R8Rqcj3ptElrJT',
      ),
    );
    if (response.statusCode == 200) {
      return NewsModel.fromJson(jsonDecode(response.body));
      // return newsModelWorldFromJson(response.body);
      // return [];
    } else {
      print('========== not risponding ========');
      throw Exception(json.decode(response.body)['fault']['faultstring']);
    }
  }
}
