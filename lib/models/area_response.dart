import 'dart:convert';

import 'package:empleador_app/models/area.dart';

AreaResponse areaResponseFromJson(String str) => AreaResponse.fromJson(json.decode(str));

String areaResponseToJson(AreaResponse data) => json.encode(data.toJson());

class AreaResponse {
    AreaResponse({
        this.area,
    });

    List<Area> area;

    factory AreaResponse.fromJson(Map<String, dynamic> json) => AreaResponse(
        area: List<Area>.from(json["area"].map((x) => Area.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "area": List<dynamic>.from(area.map((x) => x.toJson())),
    };
}
