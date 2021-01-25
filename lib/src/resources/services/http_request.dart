import 'dart:convert';
import 'package:http/http.dart';

Future getData(url) async {
  Response response = await get(url);
  var responseBody = response.body;
  return jsonDecode(responseBody);
}