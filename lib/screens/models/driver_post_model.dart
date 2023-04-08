class DriverPostModel {
    DriverPostModel({
        required this.status,
        required this.message,
    });

    bool status;
    String message;

    factory DriverPostModel.fromJson(Map<String, dynamic> json) => DriverPostModel(
        status: json["status"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
    };
}