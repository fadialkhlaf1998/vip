// To parse this JSON data, do
//
//     final myData = myDataFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

MyData myDataFromJson(String str) => MyData.fromJson(json.decode(str));

String myDataToJson(MyData data) => json.encode(data.toJson());

class MyData {
  MyData({
    required this.id,
    required this.title,
    required this.image,
    required this.password,
    required this.username,
    required this.companyId,
    required this.category,
    required this.contactPerson,
  });

  int id;
  String title;
  String image;
  String password;
  String username;
  int companyId;
  List<Category> category;
  List<ContactPerson> contactPerson;

  factory MyData.fromJson(Map<String, dynamic> json) => MyData(
    id: json["id"],
    title: json["title"],
    image: json["image"],
    password: json["password"],
    username: json["username"],
    companyId: json["company_id"],
    category: List<Category>.from(json["category"].map((x) => Category.fromJson(x))),
    contactPerson: List<ContactPerson>.from(json["contact_person"].map((x) => ContactPerson.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "image": image,
    "password": password,
    "username": username,
    "company_id": companyId,
    "category": List<dynamic>.from(category.map((x) => x.toJson())),
    "contact_person": List<dynamic>.from(contactPerson.map((x) => x.toJson())),
  };
}

class Category {
  Category({
    required this.id,
    required this.title,
    required this.image,
    required this.companyId,
    required this.cars,
    required this.phone,
  });

  int id;
  String title;
  String image;
  int companyId;
  List<Car> cars;
  String phone;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    title: json["title"],
    image: json["image"],
    companyId: json["company_id"],
    cars: List<Car>.from(json["cars"].map((x) => Car.fromJson(x))),
    phone: json["phone"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "image": image,
    "company_id": companyId,
    "cars": cars == null ? null : List<dynamic>.from(cars.map((x) => x.toJson())),
    "phone": phone == null ? null : phone,
  };
}

class Car {
  Car({
    required this.image,
    required this.title,
    required this.doors,
    required this.seets,
    required this.description,
    required this.id,
    required this.oldPrice,
    required this.price,
    required this.hotelId,
    required this.carId,
  });

  String image;
  String title;
  int doors;
  int seets;
  String description;
  int id;
  int oldPrice;
  int price;
  int hotelId;
  int carId;

  factory Car.fromJson(Map<String, dynamic> json) => Car(
    image: json["image"],
    title: json["title"],
    doors: json["doors"],
    seets: json["seets"],
    description: json["description"],
    id: json["id"],
    oldPrice: json["old_price"],
    price: json["price"],
    hotelId: json["hotel_id"],
    carId: json["car_id"],
  );

  Map<String, dynamic> toJson() => {
    "image": image,
    "title": title,
    "doors": doors,
    "seets": seets,
    "description": description,
    "id": id,
    "old_price": oldPrice,
    "price": price,
    "hotel_id": hotelId,
    "car_id": carId,
  };
}


class ContactPerson {
  ContactPerson({
    required this.id,
    required this.title,
    required this.image,
    required this.companyId,
    required this.phone,
  });

  int id;
  String title;
  String image;
  int companyId;
  String phone;

  factory ContactPerson.fromJson(Map<String, dynamic> json) => ContactPerson(
    id: json["id"],
    title: json["title"],
    image: json["image"],
    companyId: json["company_id"],
    phone: json["phone"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "image": image,
    "company_id": companyId,
    "phone": phone == null ? null : phone,
  };
}


//
// import 'dart:convert';
//
// AllData myDataFromMap(String str) => AllData.fromMap(json.decode(str));
//
// String myDataToMap(AllData data) => json.encode(data.toMap());
//
// class AllData {
//   AllData({
//     required this.id,
//     required this.title,
//     required this.image,
//     required this.password,
//     required this.username,
//     required this.companyId,
//     required this.category,
//     required this.contactPerson,
//   });
//
//   int id;
//   String title;
//   String image;
//   String password;
//   String username;
//   int companyId;
//   List<Category> category;
//   List<ContactPerson> contactPerson;
//
//   factory AllData.fromMap(Map<String, dynamic> json) => AllData(
//     id: json["id"],
//     title: json["title"],
//     image: json["image"],
//     password: json["password"],
//     username: json["username"],
//     companyId: json["company_id"],
//     category: List<Category>.from(json["category"].map((x) => Category.fromMap(x))),
//     contactPerson: List<ContactPerson>.from(json["contact_person"].map((x) => ContactPerson.fromMap(x))),
//   );
//
//   Map<String, dynamic> toMap() => {
//     "id": id,
//     "title": title,
//     "image": image,
//     "password": password,
//     "username": username,
//     "company_id": companyId,
//     "category": List<dynamic>.from(category.map((x) => x.toMap())),
//     "contact_person": List<dynamic>.from(contactPerson.map((x) => x.toMap())),
//   };
// }
//
// class Category {
//   Category({
//     required this.id,
//     required this.title,
//     required this.image,
//     required this.companyId,
//     required this.cars,
//     required this.phone,
//   });
//
//   int id;
//   String title;
//   String image;
//   int companyId;
//   List<Car> cars;
//   String phone;
//
//   factory Category.fromMap(Map<String, dynamic> json) => Category(
//     id: json["id"],
//     title: json["title"],
//     image: json["image"],
//     companyId: json["company_id"],
//     cars: List<Car>.from(json["cars"].map((x) => Car.fromMap(x))),
//     phone: json["phone"] ?? "",
//   );
//
//   Map<String, dynamic> toMap() => {
//     "id": id,
//     "title": title,
//     "image": image,
//     "company_id": companyId,
//     "cars": cars == null ? null : List<dynamic>.from(cars.map((x) => x.toMap())),
//     "phone": phone == null ? null : phone,
//   };
// }
//
// class Car {
//   Car({
//     required this.image,
//     required this.title,
//     required this.doors,
//     required this.seets,
//     required this.description,
//     required this.id,
//     required this.oldPrice,
//     required this.price,
//     required this.hotelId,
//     required this.carId,
//   });
//
//   String image;
//   String title;
//   int doors;
//   int seets;
//   String description;
//   int id;
//   int oldPrice;
//   int price;
//   int hotelId;
//   int carId;
//
//   factory Car.fromMap(Map<String, dynamic> json) => Car(
//     image: json["image"],
//     title: json["title"],
//     doors: json["doors"],
//     seets: json["seets"],
//     description: json["description"],
//     id: json["id"],
//     oldPrice: json["old_price"],
//     price: json["price"],
//     hotelId: json["hotel_id"],
//     carId: json["car_id"],
//   );
//
//   Map<String, dynamic> toMap() => {
//     "image": image,
//     "title": title,
//     "doors": doors,
//     "seets": seets,
//     "description": description,
//     "id": id,
//     "old_price": oldPrice,
//     "price": price,
//     "hotel_id": hotelId,
//     "car_id": carId,
//   };
// }
//
//
// class ContactPerson {
//   ContactPerson({
//     required this.id,
//     required this.title,
//     required this.image,
//     required this.companyId,
//     required this.phone,
//   });
//
//   int id;
//   String title;
//   String image;
//   int companyId;
//   String phone;
//
//   factory ContactPerson.fromMap(Map<String, dynamic> json) => ContactPerson(
//     id: json["id"],
//     title: json["title"],
//     image: json["image"],
//     companyId: json["company_id"],
//     phone: json["phone"] == null ? null : json["phone"],
//   );
//
//   Map<String, dynamic> toMap() => {
//     "id": id,
//     "title": title,
//     "image": image,
//     "company_id": companyId,
//     "phone": phone == null ? null : phone,
//   };
// }
