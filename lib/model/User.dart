class User {
  String id;
  String firstName;
  String lastName;
  String photo50;
  String photo100;
  String status;

  User(this.id, this.firstName, this.lastName, this.photo50, this.photo100);

  factory User.fromJson(dynamic json) {
    return User(
      (json["id"] as int).toString(),
      json["first_name"] as String,
      json["last_name"] as String,
      json["photo_50"] as String,
      json["photo_100"] as String,
    );
  }

  setStatus(String status) {
    this.status = status;
  }
}
