import 'dart:convert';
import 'dart:io';
import 'dart:async';

import 'package:bloc_learn/bloc/model/posts_model.dart';
import 'package:http/http.dart' as http;

class PostRepository {
  // future fun. bnaye h
  Future<List<PostModel>> fetchPost() async {
    try {
      // api ka link hai
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/comments'))
          .timeout(const Duration(seconds: 10));

      // agr response 200 aayega to thik nhi to handle krna hoga
      if (response.statusCode == 200) {
        final body = json.decode(response.body) as List;
        return body.map((e) {
          return PostModel(
            id: e['id'] as int,
            postId: e['postId'] as int,
            email: e['email'] as String,
            body: e['body'] as String,
          );
        }).toList();
      } else {
        throw Exception('Failed to load data');
      }
    } on SocketException {
      throw Exception('error while fetching data');
    } on TimeoutException {
      throw Exception('error while fetching data');
    }
    throw Exception('error while fetching data');
  }
}
