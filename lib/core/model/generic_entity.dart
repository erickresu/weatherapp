class GenericEntity {
  final String message;

  GenericEntity({required this.message});
}

class GenericModel {
  final String message;

  GenericModel({required this.message});

  factory GenericModel.fromJson(Map<String, dynamic> json) {
    return GenericModel(message: json['message']);
  }

  GenericEntity toEntity() {
    return GenericEntity(message: message);
  }
}