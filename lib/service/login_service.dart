
import 'dart:convert';

import '../dto/login_response_dto.dart';
import 'package:http/http.dart' as http;

import '../dto/response_dto.dart';

class LoginService {
  static const String backendUrlBase = "http://192.168.250.172:7777";
  static Future<LoginResponseDto> login(
      String username, String passwordd) async {
    LoginResponseDto result;
    var uri = Uri.parse("$backendUrlBase/api/v1/auth/");
    var body = jsonEncode({
      'username': username,
      'passwordd': passwordd,
    });
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    };

    var response = await http.post(uri, headers: headers, body: body);
    if (response.statusCode == 200) {
      var responseDto = ResponseDto.fromJson(jsonDecode(response.body));

      if (responseDto.success) {
        //sacamo el login_dto
        result = LoginResponseDto.fromJson(responseDto.data);
        //return LoginResponseDto.fromJson(responseDto.data);
      } else {
        throw Exception("Error de comunicación con internet");
        // throw Exception('Failed to login.');
      }

      // return LoginResponseDto.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to login.');
    }
    return result;
  }
}
