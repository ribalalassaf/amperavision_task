class RoomModel {
    final String? id;
    final String? name;

    RoomModel({
        this.id,
        this.name,
    });

    factory RoomModel.fromJson(Map<String, dynamic> json) => RoomModel(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}