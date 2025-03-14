class LogInResponseEntity {
  LogInResponseEntity({
      this.message, 
      this.user, 
      this.token,});

  String? message;
  LogInUserEntity? user;
  String? token;


}

class LogInUserEntity {
  LogInUserEntity({
      this.name, 
      this.email, 
      this.role,});

  String? name;
  String? email;
  String? role;

}