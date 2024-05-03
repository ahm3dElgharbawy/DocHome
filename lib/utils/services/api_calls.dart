import 'dart:io';

import 'package:http/http.dart' as http;

abstract class ApiCalls {
  static Future<http.Response> getData(String url,
      [Map<String, String>? headers]) async {
    http.Response response = await http.get(Uri.parse(url), headers: headers);
    return response;
  }

  static Future<http.Response> postData(String url, Object? body,
      [Map<String, String>? headers]) async {
    return await http.post(Uri.parse(url), body: body, headers: headers);
  }

  static Future<http.Response> putData(String url, Object? body,
      [Map<String, String>? headers]) async {
    return await http.put(Uri.parse(url), body: body, headers: headers);
  }

  static Future<http.Response> postDataWithFiles(
      String url, Map<String, String> body, Map<String, File> files,
      [Map<String, String>? headers]) async {
    http.MultipartRequest request = http.MultipartRequest("post", Uri.parse(url));

    //? Files preparing 
    List<http.MultipartFile> filesToUpload = [];
    for (int i = 0; i < files.length; i++) {
      final file = await http.MultipartFile.fromPath(
        files.keys.elementAt(i), // field name
        files.values.elementAt(i).path, // file path
      );
      filesToUpload.add(file);
    }

    //? Request preparing 
    headers ??= {"Content-Type": "multipart/form-data"}; 
    request.files.addAll(filesToUpload);
    request.fields.addAll(body);

    //? sending the request and getting the response
    http.StreamedResponse streamedResponse = await request.send();
    http.Response response = await http.Response.fromStream(streamedResponse);
    return response;
  }
}
