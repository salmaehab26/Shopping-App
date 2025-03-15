
import '../../Domain/entities/LogInResponseEntity.dart';

class LogInResponseDto extends LogInResponseEntity {
  LogInResponseDto({
      super.message,
    super.user,
    super.token,});

  LogInResponseDto.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? LogInUserDto.fromJson(json['user']) : null;
    token = json['token'];
  }




}

class LogInUserDto extends LogInUserEntity {
  LogInUserDto({
    super.name,
    super.email,
    super.role,});

  LogInUserDto.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }



}