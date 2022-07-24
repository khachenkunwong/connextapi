// To parse this JSON data, do
//
//     final meAll = meAllFromJson(jsonString);

import 'dart:convert';

List<MeAll> meAllFromJson(String str) => List<MeAll>.from(json.decode(str).map((x) => MeAll.fromJson(x)));

String meAllToJson(List<MeAll> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MeAll {
    MeAll({
        this.id,
        this.group,
        this.user,
        this.duty,
        this.v,
    });

    String? id;
    String? group;
    User? user;
    List<Duty>? duty;
    int? v;

    factory MeAll.fromJson(Map<String, dynamic> json) => MeAll(
        id: json["_id"] == null ? null : json["_id"],
        group: json["_group"] == null ? null : json["_group"],
        user: json["_user"] == null ? null : User.fromJson(json["_user"]),
        duty: json["_duty"] == null ? null : List<Duty>.from(json["_duty"].map((x) => Duty.fromJson(x))),
        v: json["__v"] == null ? null : json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "_group": group == null ? null : group,
        "_user": user == null ? null : user!.toJson(),
        "_duty": duty == null ? null : List<dynamic>.from(duty!.map((x) => x.toJson())),
        "__v": v == null ? null : v,
    };
}

class Duty {
    Duty({
        this.id,
        this.user,
        this.year,
        this.month,
        this.day,
        this.group,
        this.morning,
        this.noon,
        this.night,
        this.count,
        this.v,
    });

    String? id;
    String? user;
    String? year;
    String? month;
    String? day;
    String? group;
    int? morning;
    int? noon;
    int? night;
    int? count;
    int? v;

    factory Duty.fromJson(Map<String, dynamic> json) => Duty(
        id: json["_id"] == null ? null : json["_id"],
        user: json["_user"] == null ? null : json["_user"],
        year: json["year"] == null ? null : json["year"],
        month: json["month"] == null ? null : json["month"],
        day: json["day"] == null ? null : json["day"],
        group: json["group"] == null ? null : json["group"],
        morning: json["morning"] == null ? null : json["morning"],
        noon: json["noon"] == null ? null : json["noon"],
        night: json["night"] == null ? null : json["night"],
        count: json["count"] == null ? null : json["count"],
        v: json["__v"] == null ? null : json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "_user": user == null ? null : user,
        "year": year == null ? null : year,
        "month": month == null ? null : month,
        "day": day == null ? null : day,
        "group": group == null ? null : group,
        "morning": morning == null ? null : morning,
        "noon": noon == null ? null : noon,
        "night": night == null ? null : night,
        "count": count == null ? null : count,
        "__v": v == null ? null : v,
    };
}

class User {
    User({
        this.id,
        this.fristName,
        this.lastName,
        this.email,
        this.password,
        this.actor,
        this.location,
        this.tokenVersion,
        this.v,
    });

    String? id;
    String? fristName;
    String? lastName;
    String? email;
    String? password;
    String? actor;
    String? location;
    int? tokenVersion;
    int? v;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"] == null ? null : json["_id"],
        fristName: json["frist_name"] == null ? null : json["frist_name"],
        lastName: json["last_name"] == null ? null : json["last_name"],
        email: json["email"] == null ? null : json["email"],
        password: json["password"] == null ? null : json["password"],
        actor: json["actor"] == null ? null : json["actor"],
        location: json["location"] == null ? null : json["location"],
        tokenVersion: json["tokenVersion"] == null ? null : json["tokenVersion"],
        v: json["__v"] == null ? null : json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "frist_name": fristName == null ? null : fristName,
        "last_name": lastName == null ? null : lastName,
        "email": email == null ? null : email,
        "password": password == null ? null : password,
        "actor": actor == null ? null : actor,
        "location": location == null ? null : location,
        "tokenVersion": tokenVersion == null ? null : tokenVersion,
        "__v": v == null ? null : v,
    };
}
