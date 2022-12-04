import 'package:macchina_sos/dto/login_response_dto.dart';

class LoginService {
  LoginService();

  static Future<LoginResponseDto> login(
      String username, String password) async {
    if (username == "jpozo" && password == "12345") {
      return LoginResponseDto(
          token: "5d4as5d4as56d45as64d56a4d.adasd",
          refreshToken: "dsa45das54das564d56as4d5as4d5.adasd",
          firstName: "Jose",
          lastName: "Pozo");
    } else {
      throw Exception("Invalid credentials");
    }
  }
}


/*
    var response = await http.post(
      'http://localhost:8080/login',
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
      }),
    );
    if (response.statusCode == 200) {
      return LoginResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to login.');
    }*/