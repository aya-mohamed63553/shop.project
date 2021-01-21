// To parse this JSON data, do
//
//     final getShops = getShopsFromJson(jsonString);

import 'dart:convert';

GetShops getShopsFromJson(String str) => GetShops.fromJson(json.decode(str));

String getShopsToJson(GetShops data) => json.encode(data.toJson());

class GetShops {
  GetShops({this.mainCode, this.code, this.data, this.error});

  int mainCode;
  int code;
  List<Datum> data;
  dynamic error;

  factory GetShops.fromJson(Map<String, dynamic> json) => GetShops(
        mainCode: json["mainCode"],
        code: json["code"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        error: json["error"],
      );

  Map<String, dynamic> toJson() => {
        "mainCode": mainCode,
        "code": code,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "error": error,
      };
}

class Datum {
  Datum({
    this.id,
    this.name,
    this.phoneNumber,
    this.countryCode,
    this.photo,
    this.photos,
    this.active,
    this.type,
    this.longitude,
    this.latitude,
    this.address,
    this.details,
    this.cityId,
    this.city,
    this.regionId,
    this.region,
    this.departmentId,
    this.department,
    this.productsNumber,
    this.viewCount,
    this.commissionStatus,
    this.favorite,
    this.apiToken,
    this.createdAt,
  });

  int id;
  String name;
  String phoneNumber;
  int countryCode;
  String photo;
  List<Photo> photos;
  int active;
  int type;
  String longitude;
  String latitude;
  String address;
  String details;
  int cityId;
  String city;
  int regionId;
  String region;
  int departmentId;
  String department;
  int productsNumber;
  int viewCount;
  int commissionStatus;
  int favorite;
  String apiToken;
  DateTime createdAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        phoneNumber: json["phone_number"],
        countryCode: json["country_code"],
        photo: json["photo"],
        photos: json["photos"] == null
            ? null
            : List<Photo>.from(json["photos"].map((x) => Photo.fromJson(x))),
        active: json["active"],
        type: json["type"],
        longitude: json["longitude"],
        latitude: json["latitude"],
        address: json["address"] == null ? null : json["address"],
        details: json["details"] == null ? null : json["details"],
        cityId: json["city_id"],
        city: json["city"],
        regionId: json["region_id"],
        region: json["region"],
        departmentId: json["department_id"],
        department: json["department"],
        productsNumber: json["products_number"],
        viewCount: json["view_count"],
        commissionStatus: json["commission_status"],
        favorite: json["favorite"],
        apiToken: json["api_token"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone_number": phoneNumber,
        "country_code": countryCode,
        "photo": photo,
        "photos": photos == null
            ? null
            : List<dynamic>.from(photos.map((x) => x.toJson())),
        "active": active,
        "type": type,
        "longitude": longitude,
        "latitude": latitude,
        "address": address == null ? null : address,
        "details": details == null ? null : details,
        "city_id": cityId,
        "city": city,
        "region_id": regionId,
        "region": region,
        "department_id": departmentId,
        "department": department,
        "products_number": productsNumber,
        "view_count": viewCount,
        "commission_status": commissionStatus,
        "favorite": favorite,
        "api_token": apiToken,
        "created_at":
            "${createdAt.year.toString().padLeft(4, '0')}-${createdAt.month.toString().padLeft(2, '0')}-${createdAt.day.toString().padLeft(2, '0')}",
      };
}

class Photo {
  Photo({
    this.id,
    this.shopId,
    this.photo,
    this.createdAt,
  });

  int id;
  int shopId;
  String photo;
  DateTime createdAt;

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        id: json["id"],
        shopId: json["shop_id"],
        photo: json["photo"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "shop_id": shopId,
        "photo": photo,
        "created_at":
            "${createdAt.year.toString().padLeft(4, '0')}-${createdAt.month.toString().padLeft(2, '0')}-${createdAt.day.toString().padLeft(2, '0')}",
      };
}
