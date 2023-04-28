// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDetails _$UserDetailsFromJson(Map<String, dynamic> json) => UserDetails(
      response: (json['response'] as List<dynamic>?)
          ?.map((e) => Response.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserDetailsToJson(UserDetails instance) =>
    <String, dynamic>{
      'response': instance.response?.map((e) => e.toJson()).toList(),
    };

Response _$ResponseFromJson(Map<String, dynamic> json) => Response(
      id: json['id'] as int,
      bdate: json['bdate'] as String?,
      city: json['city'] == null
          ? null
          : City.fromJson(json['city'] as Map<String, dynamic>),
      country: json['country'] == null
          ? null
          : Country.fromJson(json['country'] as Map<String, dynamic>),
      photo_200: json['photo_200'] as String?,
      photo_200_orig: json['photo_200_orig'] as String?,
      photo_400_orig: json['photo_400_orig'] as String?,
      photo_max_orig: json['photo_max_orig'] as String?,
      about: json['about'] as String?,
      mobilePhone: json['mobile_phone'] as String?,
      homePhone: json['home_phone'] as String?,
      status: json['status'] as String?,
      followersCount: json['followers_count'] as int?,
      university: json['university'] as int?,
      universityName: json['university_name'] as String?,
      faculty: json['faculty'] as int?,
      facultyName: json['faculty_name'] as String?,
      graduation: json['graduation'] as int?,
      educationForm: json['education_form'] as String?,
      educationStatus: json['education_status'] as String?,
      universities: (json['universities'] as List<dynamic>?)
          ?.map((e) => Universities.fromJson(e as Map<String, dynamic>))
          .toList(),
      schools: (json['schools'] as List<dynamic>?)
          ?.map((e) => Schools.fromJson(e as Map<String, dynamic>))
          .toList(),
      sex: json['sex'] as int?,
      photo100: json['photo100'] as String?,
      online: json['online'] as int?,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      canAccessClosed: json['can_access_closed'] as bool,
      isClosed: json['is_closed'] as bool,
    );

Map<String, dynamic> _$ResponseToJson(Response instance) => <String, dynamic>{
      'id': instance.id,
      'bdate': instance.bdate,
      'city': instance.city?.toJson(),
      'country': instance.country?.toJson(),
      'photo_200': instance.photo_200,
      'photo_200_orig': instance.photo_200_orig,
      'photo_400_orig': instance.photo_400_orig,
      'photo_max_orig': instance.photo_max_orig,
      'about': instance.about,
      'mobile_phone': instance.mobilePhone,
      'home_phone': instance.homePhone,
      'status': instance.status,
      'followers_count': instance.followersCount,
      'university': instance.university,
      'university_name': instance.universityName,
      'faculty': instance.faculty,
      'faculty_name': instance.facultyName,
      'graduation': instance.graduation,
      'education_form': instance.educationForm,
      'education_status': instance.educationStatus,
      'universities': instance.universities?.map((e) => e.toJson()).toList(),
      'schools': instance.schools?.map((e) => e.toJson()).toList(),
      'sex': instance.sex,
      'photo100': instance.photo100,
      'online': instance.online,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'can_access_closed': instance.canAccessClosed,
      'is_closed': instance.isClosed,
    };

Schools _$SchoolsFromJson(Map<String, dynamic> json) => Schools(
      city: json['city'] as int?,
      classCount: json['class_count'] as String?,
      classId: json['class_id'] as int?,
      country: json['country'] as int?,
      id: json['id'] as String?,
      name: json['name'] as String?,
      type: json['type'] as int?,
      typeStr: json['type_str'] as String?,
      yearFrom: json['year_from'] as int?,
      yearGraduated: json['year_graduated'] as int?,
      yearTo: json['year_to'] as int?,
      speciality: json['speciality'] as String?,
    );

Map<String, dynamic> _$SchoolsToJson(Schools instance) => <String, dynamic>{
      'city': instance.city,
      'class_count': instance.classCount,
      'class_id': instance.classId,
      'country': instance.country,
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'type_str': instance.typeStr,
      'year_from': instance.yearFrom,
      'year_graduated': instance.yearGraduated,
      'year_to': instance.yearTo,
      'speciality': instance.speciality,
    };

Universities _$UniversitiesFromJson(Map<String, dynamic> json) => Universities(
      city: json['city'] as int?,
      country: json['country'] as int?,
      educationForm: json['education_form'] as String?,
      educationFormId: json['education_form_id'] as int?,
      educationStatus: json['education_status'] as String?,
      educationStatusId: json['education_status_id'] as int?,
      faculty: json['faculty'] as int?,
      facultyName: json['faculty_name'] as String?,
      graduation: json['graduation'] as int?,
      id: json['id'] as int?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$UniversitiesToJson(Universities instance) =>
    <String, dynamic>{
      'city': instance.city,
      'country': instance.country,
      'education_form': instance.educationForm,
      'education_form_id': instance.educationFormId,
      'education_status': instance.educationStatus,
      'education_status_id': instance.educationStatusId,
      'faculty': instance.faculty,
      'faculty_name': instance.facultyName,
      'graduation': instance.graduation,
      'id': instance.id,
      'name': instance.name,
    };

Country _$CountryFromJson(Map<String, dynamic> json) => Country(
      id: json['id'] as int?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };

City _$CityFromJson(Map<String, dynamic> json) => City(
      id: json['id'] as int?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$CityToJson(City instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };
