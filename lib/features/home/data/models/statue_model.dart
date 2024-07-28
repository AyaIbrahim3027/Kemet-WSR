class StatueModel {
  final String name;
  final String epoch;
  final String image;
  final String civilizationName;
  final String ar;
  final String ai;

  StatueModel({
    required this.name,
    required this.epoch,
    required this.image,
    required this.civilizationName,
    required this.ar,
    required this.ai,
  });

  factory StatueModel.fromJson(Map<String, dynamic> json) {
    return StatueModel(
      name: json['name'] ?? '',
      epoch: json['epoch'] ?? '',
      image: json['image'] ?? '',
      civilizationName: json['civilizationName'] ?? '',
      ar: json['ar'] ?? '',
      ai: json['ai'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'epoch': epoch,
      'image': image,
      'civilizationName': civilizationName,
      'ar': ar,
      'ai': ai,
    };
  }
}
