class UserModel {
  String? name;
  String? id;
  String? email;
  String? profileImage;
  String? biography;
  String? favouriteTeam;
  UserModel(
      {required this.name,
      required this.email,
      required this.id,
      this.profileImage,
      this.biography,
      this.favouriteTeam});

  UserModel.fromFirestore(Map<String, dynamic> data) {
    name = data['name'];
    email = data['id'];
    id = data['email'];
    profileImage = data["profileImage"];
    biography = data['biography'];
    favouriteTeam = data['favouriteTeam'];
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
      if (id != null) "id": id,
      if (email != null) "email": email,
      "profileImage": profileImage,
      "biography": biography,
      "favouriteTeam": favouriteTeam,
    };
  }
}
