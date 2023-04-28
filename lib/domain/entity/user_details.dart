import 'package:json_annotation/json_annotation.dart';

part 'user_details.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class UserDetails {
  UserDetails({
      this.response,});

  List<Response>? response;

  factory UserDetails.fromJson(Map<String, dynamic> json) => _$UserDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$UserDetailsToJson(this);

}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Response {
  final int id;
  final String? bdate;
  final City? city;
  final Country? country;
  final String? photo_200;
  final String? photo_200_orig;
  final String? photo_400_orig;
  final String? photo_max_orig;
  final String? about;
  final String? mobilePhone;
  final String? homePhone;
  final String? status;
  final int? followersCount;
  final int? university;
  final String? universityName;
  final int? faculty;
  final String? facultyName;
  final int? graduation;
  final String? educationForm;
  final String? educationStatus;
  final  List<Universities>? universities;
  final List<Schools>? schools;
  final int? sex;
  final String? photo100;
  final int? online;
  final String firstName;
  final String lastName;
  final bool canAccessClosed;
  final bool isClosed;
  Response({
     required  this.id,
      this.bdate, 
      this.city, 
      this.country, 
      this.photo_200,
      this.photo_200_orig,
      this.photo_400_orig,
      this.photo_max_orig,
      this.about, 
      this.mobilePhone, 
      this.homePhone, 
      this.status, 
      this.followersCount, 
      this.university, 
      this.universityName, 
      this.faculty, 
      this.facultyName, 
      this.graduation, 
      this.educationForm, 
      this.educationStatus, 
      this.universities, 
      this.schools, 
      this.sex, 
      this.photo100, 
      this.online,
    required  this.firstName,
    required  this.lastName,
    required this.canAccessClosed,
    required this.isClosed,});

  factory Response.fromJson(Map<String, dynamic> json) => _$ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseToJson(this);

}
@JsonSerializable(fieldRename: FieldRename.snake)
class Schools {
  Schools({
      this.city, 
      this.classCount,
      this.classId, 
      this.country, 
      this.id, 
      this.name, 
      this.type, 
      this.typeStr, 
      this.yearFrom, 
      this.yearGraduated, 
      this.yearTo, 
      this.speciality,});
  int? city;
  String? classCount;
  int? classId;
  int? country;
  String? id;
  String? name;
  int? type;
  String? typeStr;
  int? yearFrom;
  int? yearGraduated;
  int? yearTo;
  String? speciality;

  factory Schools.fromJson(Map<String, dynamic> json) => _$SchoolsFromJson(json);

  Map<String, dynamic> toJson() => _$SchoolsToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Universities {
  Universities({
      this.city, 
      this.country, 
      this.educationForm, 
      this.educationFormId, 
      this.educationStatus, 
      this.educationStatusId, 
      this.faculty, 
      this.facultyName, 
      this.graduation, 
      this.id, 
      this.name,});
  int? city;
  int? country;
  String? educationForm;
  int? educationFormId;
  String? educationStatus;
  int? educationStatusId;
  int? faculty;
  String? facultyName;
  int? graduation;
  int? id;
  String? name;

  factory Universities.fromJson(Map<String, dynamic> json) => _$UniversitiesFromJson(json);

  Map<String, dynamic> toJson() => _$UniversitiesToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Country {
  Country({
      this.id, 
      this.title,});
  int? id;
  String? title;

  factory Country.fromJson(Map<String, dynamic> json) => _$CountryFromJson(json);

  Map<String, dynamic> toJson() => _$CountryToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class City {
  City({
      this.id, 
      this.title,});
  int? id;
  String? title;

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

  Map<String, dynamic> toJson() => _$CityToJson(this);
}