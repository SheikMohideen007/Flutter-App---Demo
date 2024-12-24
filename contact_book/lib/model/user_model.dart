class UserModel {
  String? name;
  String? contactNo;
  String? description;
  int? id;

  UserModel(
      {required this.name,
      required this.contactNo,
      required this.description,
      required this.id});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'],
        name: json['name'],
        contactNo: json['contactNo'],
        description: json['description']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'contactNo': contactNo,
      'description': description
    };
  }
}
