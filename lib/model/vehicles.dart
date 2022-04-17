import 'dart:convert';
import '../main.dart';
import 'dart:convert';

Vehicle vehicleFromJson(String str) => Vehicle.fromJson(json.decode(str));

String vehicleToJson(Vehicle data) => json.encode(data.toJson());

class Vehicle {
  Vehicle({
    required this.count,
    required this.message,
    required this.searchCriteria,
    required this.results,
  });

  int count;
  String message;
  String searchCriteria;
  List<Result> results;

  factory Vehicle.fromJson(Map<String, dynamic> json) => Vehicle(
        count: json["Count"],
        message: json["Message"],
        searchCriteria: json["SearchCriteria"],
        results:
            List<Result>.from(json["Results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Count": count,
        "Message": message,
        "SearchCriteria": searchCriteria,
        "Results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    required this.makeId,
    required this.makeName,
    required this.modelId,
    required this.modelName,
  });

  int makeId;
  String makeName;
  int modelId;
  String modelName;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        makeId: json["Make_ID"],
        makeName: json["Make_Name"],
        modelId: json["Model_ID"],
        modelName: json["Model_Name"],
      );

  Map<String, dynamic> toJson() => {
        "Make_ID": makeId,
        "Make_Name": makeName,
        "Model_ID": modelId,
        "Model_Name": modelName,
      };
}
