//DTO significado
//Data Transfer Object
//Objeto de transferência de dados
//VO que significa Value Object
// en dart es una clase que solo tiene propiedades y no tiene métodos
// no tiene lógica de negocio

class LoginResponseDto {
  final String token;
  final String refreshToken;
  final String firstName;
  final String lastName;

  LoginResponseDto(
      {required this.token,
      required this.refreshToken,
      required this.firstName,
      required this.lastName});

  factory LoginResponseDto.fromJson(Map<String, dynamic> json) {
    return LoginResponseDto(
        token: json['token'],
        refreshToken: json['refreshToken'],
        firstName: json['firstName'],
        lastName: json['lastName']);
  }
}
