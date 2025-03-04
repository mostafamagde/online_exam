class ErrorModel {
  ErrorModel({this.message, this.errors});

  ErrorModel.fromJson(dynamic json) {
    message = json['message'];
    errors = json['errors'] != null ? ErrorData.fromJson(json['errors']) : null;
  }

  String? message;
  ErrorData? errors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (errors != null) {
      map['errors'] = errors?.toJson();
    }
    return map;
  }
}

class ErrorData {
  ErrorData({this.value, this.msg, this.param, this.location});

  ErrorData.fromJson(dynamic json) {
    value = json['value'];
    msg = json['msg'];
    param = json['param'];
    location = json['location'];
  }

  String? value;
  String? msg;
  String? param;
  String? location;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['value'] = value;
    map['msg'] = msg;
    map['param'] = param;
    map['location'] = location;
    return map;
  }
}
