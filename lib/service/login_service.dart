class LoginService {
  LoginService();

  static Future<LoginResponse> login(String username, String password) async {
      
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