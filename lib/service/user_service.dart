import 'dart:convert';
import 'package:macchina_sos/dto/response_dto.dart';
import 'package:http/http.dart' as http;
import '../dto/user_info.dart';

class UserService {
  static const String backendUrlBase = "http://192.168.250.172:7777";
  Future<UserInfoDto> getUserInfo(String token) async {
    UserInfoDto result;
    var uri = Uri.parse("$backendUrlBase/api/v1/user/");
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Authorization': 'bearer $token',
    };
    // Invocamos al backend
    var response = await http.get(uri, headers: headers);

    if (response.statusCode == 200) {
      // El backend procesó la solicitud entonces decodificamos
      ResponseDto backendResponse =
          ResponseDto.fromJson(jsonDecode(response.body));
      if (backendResponse.success) {
        // Si el backend me envió la información del usuario lo extraemos
        result = UserInfoDto.fromJson(backendResponse.data);
      } else {
        throw Exception(
            "Error al intentar consultar la información del usuario");
      }
    } else {
      throw Exception(
          "Error desonocido al intentar consultar la información del usuario");
    }
    return result;
  }
}
