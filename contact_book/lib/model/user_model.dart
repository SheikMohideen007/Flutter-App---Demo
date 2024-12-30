class UserModel {
  String? name;
  String? contactNo;
  String? description;
  int? id;

  // UserModel({
  //   required this.name,
  //   required this.contactNo,
  //   required this.description,
  //   // required this.id
  // });

// DeSerialization
  UserModel fromJson(Map<String, dynamic> json) {
    // return UserModel(
    //     id: json['id'],
    //     name: json['name'],
    //     contactNo: json['contactNo'],
    //     description: json['description']);
    UserModel user = UserModel();
    user.id = json['id'];
    user.name = json['name'];
    user.contactNo = json['contactNo'];
    user.description = json['description'];
    return user;
  }

// Serialization
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'contactNo': contactNo,
      'description': description
    };
  }
}
