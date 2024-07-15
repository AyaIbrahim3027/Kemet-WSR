class StatueModel {
  final String name;
  final String epoch;
  // final String image;
  // final String civilizationName;
  final String? ar;
  final String? ai;

  StatueModel({
    required this.name,
    required this.epoch,
    // required this.image,
    // required this.civilizationName,
    this.ar,
    this.ai,
  });

  factory StatueModel.fromJson(Map<String, dynamic> json) {
    return StatueModel(
      name: json['name'] as String,
      epoch: json['epoch'] as String,
      // image: json['image'] as String,
      // civilizationName: json['civilizationName'] as String,
      ar: json['ar'] as String,
      ai: json['ai'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'epoch': epoch,
      // 'image': image,
      // 'civilizationName': civilizationName,
      'ar': ar,
      'ai': ai,
    };
  }
}
