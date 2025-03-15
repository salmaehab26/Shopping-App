class SignUpResponseEntity {
  SignUpResponseEntity({
      this.message, 
      this.user, 
      this.token,
  this.statusMessage});


  String? message;
  UserEntity? user;
  String? token;
  String?statusMessage;
}

class UserEntity {
  UserEntity({
      this.name, 
      this.email, 
      this.role,});


  String? name;
  String? email;
  String? role;


}