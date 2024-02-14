class DataCitys {
  String message;
  Map<String, City> data;

  DataCitys({
    required this.message,
    required this.data,
  });

  factory DataCitys.fromJson(Map<String, dynamic> json) => DataCitys(
        message: json["message"],
        data: Map.from(json["data"])
            .map((k, v) => MapEntry<String, City>(k, City.fromJson(v))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": Map.from(data)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
      };
}

class City {
  int id;
  String nombre;
  int departamentoId;

  City({
    required this.id,
    required this.nombre,
    required this.departamentoId,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"],
        nombre: json["nombre"],
        departamentoId: json["departamento_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "departamento_id": departamentoId,
      };
}
