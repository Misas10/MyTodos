import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:mytodos/app_constants.dart';

void main() async {
  var url = Uri.http(AppConstants.apiUrl, "/");
  var urlPost = Uri.http(AppConstants.apiUrl, "/add");

  try {
    var response = await http.get(url);
    await http.post(urlPost, body: {'name': 'doodle', 'color': 'blue'});

    var jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;
    print("${jsonResponse['nome']}");
  } catch (e) {
    print(e);
  }
}
