import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/SRC/Data/Models/news_model.dart';

class ApiService {
  Future<NewsModel> NewsApiResponse(String type) async {
    try {
      final response = await http.get(
        Uri.parse(
          'https://api.nytimes.com/svc/topstories/v2/$type.json?api-key=CRd67irJ8kAnHDtl79R8Rqcj3ptElrJT',
        ),
      ); //await _response(type = type);
      // print(response.body);
      if (response.statusCode == 200) {
        // print("======= responding Now =======");
        // return newsModelWorldFromJson(response.body);
        return NewsModel.fromJson(jsonDecode(response.body));
      } else if (response.statusCode == 429 ||
          response.body.contains('quota') ||
          response.body.contains('limit exceeded')) {
        // Handle rate limit
        throw Exception('Rate limit exceeded. Please try again later.');
      }else {
        // print('========== not risponding ========');
        throw Exception(json.decode(response.body)['fault']['faultstring']);
      }
    } catch (e) {
      // print('=================');
      // print(e);
      throw Exception("data not loading");
    }
  }

//   Future _response(String type) async {
//     // await Future.delayed(Duration(seconds: 2));
//     await http.get(
//       Uri.parse(
//         'https://api.nytimes.com/svc/topstories/v2/${type}.json?api-key=CRd67irJ8kAnHDtl79R8Rqcj3ptElrJT',
//       ),
//     );
//   }
 }
