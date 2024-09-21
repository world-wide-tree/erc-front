class RequestTokenModel {
  late final String? refresh;
  late final String? access;

  RequestTokenModel({
    this.refresh,
    this.access,
  });

  factory RequestTokenModel.fromJson(Map<String, dynamic> json) {
    return RequestTokenModel(
      refresh: json['refresh'],
      access: json['access'],
    );
  }

  Map<String, dynamic> toJson() => {
        'refresh': refresh,
        'access': access,
      };
}
