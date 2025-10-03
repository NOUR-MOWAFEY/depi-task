class PersonalDataModel {
  String? email;
  String? password;
  Name? name;

  PersonalDataModel({this.email, this.password, this.name});

  PersonalDataModel.fromJson(Map<String, dynamic>? json) {
    email = json!['email'];
    password = json['password'];
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    if (name != null) {
      data['name'] = name!.toJson();
    }
    return data;
  }
}

class Name {
  String? firstName;
  String? secondName;
  String? lastName;

  Name({this.firstName, this.secondName, this.lastName});

  Name.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    secondName = json['second_name'];
    lastName = json['last_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first_name'] = firstName;
    data['second_name'] = secondName;
    data['last_name'] = lastName;
    return data;
  }
}
