class LoginResponseDto {
  final String? token;
  final String? refresh;
  //final bool success;

  LoginResponseDto({
    this.token,
    this.refresh,
    //  this.success = false,
  });

  /*factory LoginResponseDto.fromJson(Map<String, dynamic> json) {
    return LoginResponseDto(token: json['token'], refresh: json['refresh']);
  }*/

  factory LoginResponseDto.fromJson(Map<String, dynamic> json) {
    return LoginResponseDto(
      token: json['token'],
      refresh: json['refresh'],
      //success: json['success'],);)
    );
  }
}
