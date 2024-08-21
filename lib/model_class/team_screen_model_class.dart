class TeamScreenModelClass {
  bool result;
  String message;
  List<TeamScreenModelClassData> teamScreenModelClassData;

  TeamScreenModelClass({
    required this.result,
    required this.message,
    required this.teamScreenModelClassData,
  });

  TeamScreenModelClass.fromJson(Map<String, dynamic> json)
      : result = json['result'] ?? false,
        message = json['message'] ?? '',
        teamScreenModelClassData = (json['data'] as List<dynamic>?)
            ?.map((v) => TeamScreenModelClassData.fromJson(v))
            .toList() ??
            [];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['result'] = result;
    data['message'] = message;
    data['data'] = teamScreenModelClassData.map((v) => v.toJson()).toList();
    return data;
  }
}

class TeamScreenModelClassData {
  String name;
  String image;
  String degination;

  TeamScreenModelClassData({
    required this.name,
    required this.image,
    required this.degination,
  });

  TeamScreenModelClassData.fromJson(Map<String, dynamic> json)
      : name = json['name'] ?? '',
        image = json['image'] ?? '',
        degination = json['degination'] ?? '';

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['image'] = image;
    data['degination'] = degination;
    return data;
  }
}
