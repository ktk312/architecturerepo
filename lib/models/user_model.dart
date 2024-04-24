import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  int id;
  String firstName;
  String middleName;
  String lastName;
  DateTime expiryDate;
  DateTime activateDate;
  bool isAntiPassbackUser;
  bool isAlarmUser;
  bool hasImage;
  List<CustomField> customFields;

  UserModel({
    required this.id,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.expiryDate,
    required this.activateDate,
    required this.isAntiPassbackUser,
    required this.isAlarmUser,
    required this.hasImage,
    required this.customFields,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        firstName: json["firstName"],
        middleName: json["middleName"],
        lastName: json["lastName"],
        expiryDate: DateTime.parse(json["expiryDate"]),
        activateDate: DateTime.parse(json["activateDate"]),
        isAntiPassbackUser: json["isAntiPassbackUser"],
        isAlarmUser: json["isAlarmUser"],
        hasImage: json["hasImage"],
        customFields: List<CustomField>.from(
            json["customFields"].map((x) => CustomField.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "middleName": middleName,
        "lastName": lastName,
        "expiryDate": expiryDate.toIso8601String(),
        "activateDate": activateDate.toIso8601String(),
        "isAntiPassbackUser": isAntiPassbackUser,
        "isAlarmUser": isAlarmUser,
        "hasImage": hasImage,
        "customFields": List<dynamic>.from(customFields.map((x) => x.toJson())),
      };
}

class CustomField {
  int id;
  String value;

  CustomField({
    required this.id,
    required this.value,
  });

  factory CustomField.fromJson(Map<String, dynamic> json) => CustomField(
        id: json["id"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "value": value,
      };
}
