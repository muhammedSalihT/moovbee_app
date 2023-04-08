class LoginModel {
  LoginModel({
     this.status,
     this.name,
     this.refresh,
     this.access,
     this.message,
     this.urlId,
  });

  bool? status;
  String? name;
  String? refresh;
  String? access;
  String? message;
  String? urlId;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json["status"],
        name: json["name"],
        refresh: json["refresh"],
        access: json["access"],
        message: json["message"],
        urlId: json["url_id"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "name": name,
        "refresh": refresh,
        "access": access,
        "message": message,
        "url_id": urlId,
      };
}
