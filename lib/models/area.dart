// class Area {
//     Area({
//         this.id,
//         this.descripcion,
//         this.nota,
//         this.subAreas,
//     });

//     int id;
//     String descripcion;
//     String nota;
//     List<Area> subAreas;

//     factory Area.fromJson(Map<String, dynamic> json) => Area(
//         id: json["id"],
//         descripcion: json["descripcion"],
//         nota: json["nota"],
//         subAreas: json["subAreas"] == null ? null : List<Area>.from(json["subAreas"].map((x) => Area.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "descripcion": descripcion,
//         "nota": nota,
//         "subAreas": subAreas == null ? null : List<dynamic>.from(subAreas.map((x) => x.toJson())),
//     };
// }

import 'dart:convert';

List<Area> areaFromJson(String str) => List<Area>.from(json.decode(str).map((x) => Area.fromJson(x)));

String areaToJson(List<Area> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Area {
    Area({
        this.id,
        this.descripcion,
        this.nota,
        this.subAreas,
    });

    int id;
    String descripcion;
    String nota;
    List<Area> subAreas;

    factory Area.fromJson(Map<String, dynamic> json) => Area(
        id: json["id"],
        descripcion: json["descripcion"],
        nota: json["nota"],
        subAreas: json["subAreas"] == null ? null : List<Area>.from(json["subAreas"].map((x) => Area.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "descripcion": descripcion,
        "nota": nota,
        "subAreas": subAreas == null ? null : List<dynamic>.from(subAreas.map((x) => x.toJson())),
    };
}
