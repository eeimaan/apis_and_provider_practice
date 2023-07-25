import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:provider_practice/data_source/api_urls.dart';
import 'package:provider_practice/models/user_model.dart';

class DBServices {

  static Future<Album> fetchAlbum() async {
  try {
    var url = '${ApiUrls.baseUrl}${ApiUrls.getUser}';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return Album.fromJson(jsonDecode(response.body));
    }
  } on HttpException catch (httpError) {
    log('HttpException: ${httpError.message}');
    throw httpError; 
  } on TimeoutException catch (timeOutException) {
    log('TimeoutException: ${timeOutException.message}');
    throw timeOutException;
  } catch (error) {
    log('Error: ${error.toString()}');
    throw error; 
  }

  throw Exception('Failed to load album'); 
}


static Future<Album> createAlbum(String title) async {
   var url = '${ApiUrls.baseUrl}${ApiUrls.createUser}';
  final response = await http.post(
     Uri.parse('https://jsonplaceholder.typicode.com/albums'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'title': title,
    }),
  );

  if (response.statusCode == 201) {
    
    return Album.fromJson(jsonDecode(response.body));
  } else {
   
    throw Exception('Failed to create album.');
  }
}

static Future<Album> updateAlbum(String title) async {
   var url = '${ApiUrls.baseUrl}${ApiUrls.updateUser}';
  final response = await http.put(
    Uri.parse(url),
   
    body: jsonEncode(<String, String>{
      'title': title,
    }),
  );

  if (response.statusCode == 200) {
   
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to update album.');
  }
}

static Future<Album> deleteAlbum(String id) async {
     var url = '${ApiUrls.baseUrl}${ApiUrls.deleteUser}';
  final http.Response response = await http.delete(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON. After deleting,
    // you'll get an empty JSON `{}` response.
    // Don't return `null`, otherwise `snapshot.hasData`
    // will always return false on `FutureBuilder`.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a "200 OK response",
    // then throw an exception.
    throw Exception('Failed to delete album.');
  }
}



























}
