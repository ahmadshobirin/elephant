// https://elephant-api.herokuapp.com/elephants/sex/male

import 'dart:convert';

class Elephant {
  Elephant({
    this.id,
    this.index,
    this.name,
    this.affiliation,
    this.species,
    this.sex,
    this.fictional,
    this.dob,
    this.dod,
    this.wikilink,
    this.image,
    this.note,
  });

  String id;
  int index;
  String name;
  String affiliation;
  String species;
  String sex;
  String fictional;
  String dob;
  String dod;
  String wikilink;
  String image;
  String note;

  Elephant copyWith({
    String id,
    int index,
    String name,
    String affiliation,
    String species,
    String sex,
    String fictional,
    String dob,
    String dod,
    String wikilink,
    String image,
    String note,
  }) =>
      Elephant(
        id: id ?? this.id,
        index: index ?? this.index,
        name: name ?? this.name,
        affiliation: affiliation ?? this.affiliation,
        species: species ?? this.species,
        sex: sex ?? this.sex,
        fictional: fictional ?? this.fictional,
        dob: dob ?? this.dob,
        dod: dod ?? this.dod,
        wikilink: wikilink ?? this.wikilink,
        image: image ?? this.image,
        note: note ?? this.note,
      );

  factory Elephant.fromJson(String str) => Elephant.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Elephant.fromMap(Map<String, dynamic> json) => Elephant(
        id: json["_id"],
        index: json["index"],
        name: json["name"],
        affiliation: json["affiliation"],
        species: json["species"],
        sex: json["sex"],
        fictional: json["fictional"],
        dob: json["dob"],
        dod: json["dod"],
        wikilink: json["wikilink"],
        image: json["image"],
        note: json["note"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "index": index,
        "name": name,
        "affiliation": affiliation,
        "species": species,
        "sex": sex,
        "fictional": fictional,
        "dob": dob,
        "dod": dod,
        "wikilink": wikilink,
        "image": image,
        "note": note,
      };
}
