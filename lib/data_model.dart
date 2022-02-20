import 'dart:convert';
/// form : "1а"
/// monday : "-Математика\n-Русский\n-Английский"
/// tuesday : "-Математика\n-Русский\n-Английский"
/// wednesday : "-Математика\n-Русский\n-Английский"
/// thursday : "-Математика\n-Русский\n-Английский"
/// friday : "-Математика\n-Русский\n-Английский"
/// saturday : "-Математика\n-Русский\n-Английский"

DataModel dataModelFromJson(String str) => DataModel.fromJson(json.decode(str));
String dataModelToJson(DataModel data) => json.encode(data.toJson());
class DataModel {
  DataModel({
      String? form, 
      String? monday, 
      String? tuesday, 
      String? wednesday, 
      String? thursday, 
      String? friday, 
      String? saturday,}){
    _form = form;
    _monday = monday;
    _tuesday = tuesday;
    _wednesday = wednesday;
    _thursday = thursday;
    _friday = friday;
    _saturday = saturday;
}

  DataModel.fromJson(dynamic json) {
    _form = json['form'];
    _monday = json['monday'];
    _tuesday = json['tuesday'];
    _wednesday = json['wednesday'];
    _thursday = json['thursday'];
    _friday = json['friday'];
    _saturday = json['saturday'];
  }
  String? _form;
  String? _monday;
  String? _tuesday;
  String? _wednesday;
  String? _thursday;
  String? _friday;
  String? _saturday;

  String? get form => _form;
  String? get monday => _monday;
  String? get tuesday => _tuesday;
  String? get wednesday => _wednesday;
  String? get thursday => _thursday;
  String? get friday => _friday;
  String? get saturday => _saturday;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['form'] = _form;
    map['monday'] = _monday;
    map['tuesday'] = _tuesday;
    map['wednesday'] = _wednesday;
    map['thursday'] = _thursday;
    map['friday'] = _friday;
    map['saturday'] = _saturday;
    return map;
  }

}