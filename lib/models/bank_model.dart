// To parse this JSON data, do
//
//     final bank = bankFromJson(jsonString);

import 'dart:convert';

List<Bank> bankFromJson(String str) =>
    List<Bank>.from(json.decode(str).map((x) => Bank.fromJson(x)));

String bankToJson(List<Bank> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Bank {
  Bank({
    this.id,
    this.uuid,
    this.code,
    this.name,
    this.description,
    this.slug,
    this.paymentGatewayId,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? uuid;
  String? code;
  String? name;
  dynamic description;
  String? slug;
  String? paymentGatewayId;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Bank.fromJson(Map<String, dynamic> json) => Bank(
        id: json["id"],
        uuid: json["uuid"],
        code: json["code"],
        name: json["name"],
        description: json["description"],
        slug: json["slug"],
        paymentGatewayId: json["payment_gateway_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uuid": uuid,
        "code": code,
        "name": name,
        "description": description,
        "slug": slug,
        "payment_gateway_id": paymentGatewayId,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
      };
}
