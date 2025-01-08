import 'dart:convert';

import 'package:login_page/config/app_api_config.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart' as http_parser;

abstract class BaseService<T> {
  Future<T> call();

  Uri _getv1Url(String url) => Uri.parse('${AppApiConfig.baseAPI}/$url');

  Future<Map<String, dynamic>> get(String apiUrl) async {
    try {
// MyRequest(token: token)

      return _handleResponse(
        await http.get(
          _getv1Url(
            apiUrl,
            // String? token
          ),
        ),
      );
    } catch (e) {
      throw Exception();
    }
  }

//
//post method
  Future<Map<String, dynamic>> post(
    String apiUrl, {
    Map<String, dynamic>? body,
    // String? token
  }) async {
    try {
      final headers = {
        // 'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      };
// MyRequest(token: token)
      final res = _handleResponse(await http.post(_getv1Url(apiUrl),
          headers: headers, body: jsonEncode(body)));

      return res;
    } catch (e) {
      throw Exception(e);
    }
  }

// upload image
  Future<Map<String, dynamic>> upload(
      String apiUrl, String fileName, String path) async {
    try {
      final client = http.MultipartRequest('POST', _getv1Url(apiUrl));
      // if (token != null) {
      //   client.headers.addAll({
      //     'Authorization': 'Bearer $token',

      //   });
      client.files.add(
        await http.MultipartFile.fromPath(
          fileName,
          path,
          contentType: http_parser.MediaType('image', 'jpg'),
        ),
      );
      return _handleResponse(
          await http.Response.fromStream(await client.send()));
    } catch (e) {
      throw Exception(e);
    }
  }
}

Map<String, dynamic> _handleResponse(http.Response response) {
  if (response.statusCode == 200 || response.statusCode == 201) {
    return jsonDecode(response.body);
  } else {
    throw Exception(
        'Request failed with status code ${response.statusCode}: ${response.body}');
  }
}


// class MyRequest extends http.BaseClient {
//   final String? token;

//   MyRequest({this.token});
//   @override
//   Future<http.StreamedResponse> send(http.BaseRequest request) {
//     if (token != null) {
//       request.headers['Authorization'] = 'Bearer $token';
//     }
//     return request.send();
//   }
// }
