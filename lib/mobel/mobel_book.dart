class User {
  String? frist_name;
  String? last_name;
  String? email;
  String? password;
  String? actor;

  User(
      { this.frist_name,
       this.last_name,
       this.email,
       this.password,
       this.actor});

  User.fromJSON(Map<String, dynamic> json) {
    this.frist_name = json["frist_name"];
    this.last_name = json["last_name"];
    this.email = json["email"];
    this.password = json["password"];
    this.actor = json["actor"];
  }
}
