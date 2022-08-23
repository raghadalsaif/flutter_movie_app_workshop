class CastModel {
  final int id;
  final String name;
  final String? profilePath;

  const CastModel({
    required this.id,
    required this.name,
    required this.profilePath,
  });

  factory CastModel.fromJson(Map<String, dynamic> json) {
    return CastModel(
      id: json['id'],
      name: json['name'],
      profilePath: json['profile_path'],
    );
  }
}
