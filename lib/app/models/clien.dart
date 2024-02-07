class Clien {
  int id;
  String nombre;

  Clien({
    required this.id,
    required this.nombre,
  });

  factory Clien.fromJson(Map<String, dynamic> json) => Clien(
        id: json["id"],
        nombre: json["nombre"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
      };
}
