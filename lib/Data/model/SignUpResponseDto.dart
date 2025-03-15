import '../../Domain/entities/SignUpResponseEntity.dart';

class SignUpResponseDto extends SignUpResponseEntity {
  SignUpResponseDto({
    super.message,
    super.user,
    super.token,
    super.statusMessage});

  SignUpResponseDto.fromJson(dynamic json) {
      message = json['message'] ;
      user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
      token = json['token'];
      statusMessage = json['statusMessage'] ;

    }



}

class UserDto extends UserEntity{
  UserDto({
      super.name,
    super.email,
      super.role,});

  UserDto.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }




}