import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:clinica/_clinica/services/data/remote/network/base_api_service.dart';
import 'package:either_dart/either.dart';
// import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../error/network_error.dart';

class NetworkApiService extends BaseApiService {
  static const int timeOutseconds = 180;

  @override
  Future<Either<NetworkException, dynamic>> putResponse(
      String url, Object jsonBody,
      {Map<String, String> headers = const {}}) async {
    var response = await http
        .put(Uri.parse(url), body: jsonBody, headers: headers)
        .timeout(const Duration(seconds: timeOutseconds));

    return (returnResponse(response, true));
  }

  @override
  Future<Either<NetworkException, dynamic>> getResponse(String url,
      {Map<String, String> headers = const {}}) async {
    final response = await http.get(Uri.parse(url), headers: headers);
    return returnResponse(response, true);
  }

  @override
  Future<Either<NetworkException, dynamic>> postResponse(
      String url, Object jsonBody,
      {Map<String, String> headers = const {}}) async {
    var response = await http
        .post(Uri.parse(url), body: jsonEncode(jsonBody), headers: headers)
        .timeout(const Duration(seconds: timeOutseconds));

    return (returnResponse(response, true));
  }

  @override
  Future<Either<NetworkException, dynamic>> getFile(String url,
      {Map<String, String> headers = const {}}) async {
    var uri = Uri.parse(url);

    final response = await http
        .get(uri, headers: headers)
        .timeout(const Duration(seconds: timeOutseconds));

    return returnResponse(response, false);
  }

  @override
  Future getFileWithPost(String url, Object body) async {
    var uri = Uri.parse(url);
    final response = await http.post(uri,
        body: body,
        headers: {}).timeout(const Duration(seconds: timeOutseconds));

    return returnResponse(response, false);
  }

  Future posDataBase(String url, var body) async {
    var uri = Uri.parse(url);
    final response = await http
        .post(uri, body: body
            //headers: {
            //   'Content-Type': 'application/json-patch+json',
            //   'Accept': "*/*"
            // }
            )
        .timeout(const Duration(seconds: timeOutseconds));

    return returnResponse(response, false);
  }

  Future getDatabase(String url) async {
    var uri = Uri.parse(url);
    final response = await http.get(uri, headers: {
      'Content-Type': 'application/json-patch+json',
      'Accept': "*/*"
    }).timeout(const Duration(seconds: timeOutseconds));

    return returnResponse(response, false);
  }

  @override
  Future uploadPhoto(String url, String filePath,
      {Map<String, String> headers = const {}}) async {
    var uri = Uri.parse(url);

    final file = http.MultipartFile.fromBytes(
        'picture', File(filePath).readAsBytesSync(),
        filename: filePath.split("/").last);

    var request = http.MultipartRequest('POST', uri);
    request.headers.addAll(headers);

    // final file = await http.MultipartFile.fromPath('image', filePath);
    request.files.add(file);

    var response = await request.send();
    var responsed = await http.Response.fromStream(response);

    return returnResponse(responsed, true);
  }

  @override
  Future<Either<NetworkException, dynamic>> postResponseHeaders(
      String url, dynamic jsonBody, Map<String, String> headers) async {
    var response = await http
        .post(Uri.parse(url), body: jsonEncode(jsonBody), headers: headers)
        .timeout(const Duration(seconds: timeOutseconds));

    return (returnResponse(response, true));
  }
}

Either<NetworkException, dynamic> returnResponse(
    http.Response response, bool isJson) {
  if (response.contentLength == 0) {
    return Left(
        FetchDataException('Error occured while communication with server'));
  }
  switch (response.statusCode) {
    case 200:
    case 201:
      if (isJson) {
        Object responseJson = jsonDecode(response.body);
        return Right(responseJson);
      } else {
        return Right(response.bodyBytes);
      }
    case 400:
      dynamic responseJson = jsonDecode(response.body);
      if (isJson) {
        return Left(BadRequestException(responseJson['response']));
      } else {
        var error =
            'Error occured while communication with server with status code : ${response.statusCode}, response: ${response.body}';

        return Left(BadRequestException(error));
      }

    case 401:
    case 403:
      dynamic responseJson = jsonDecode(response.body);
      log(responseJson);

      return Left(BadRequestException(responseJson['response']));
    case 404:
      dynamic responseJson = jsonDecode(response.body);
      log(responseJson.toString());

      return Left(BadRequestException(responseJson['response']));
    case 500:
      dynamic responseJson = jsonDecode(response.body);
      log(responseJson.toString());
      return Left(BadRequestException(responseJson['response']));
    case 502:
      dynamic responseJson = jsonDecode(response.body);
      log(responseJson);
      return Left(BadGateway(
          "Error occured while communication with server with status code : ${response.statusCode}"));
    default:
      return Left(FetchDataException(
          'Error occured while communication with server'
          ' with status code : ${response.statusCode}, response: ${response.body}'));
  }
}
