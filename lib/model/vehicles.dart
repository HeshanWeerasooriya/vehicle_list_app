class Album {
  int count;
  String message;
  String searchCriteria;
  List<Results> results;

  Album(
      {required this.count,
      required this.message,
      required this.searchCriteria,
      required this.results});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      count: json['Count'],
      message: json['Message'],
      searchCriteria: json['SearchCriteria'],
      results: (json['Results'] as List).cast<Results>(),
    );
  }
}

class Results {
  int makeID;
  String makeName;
  int modelID;
  String modelName;
  Results(
      {required this.makeID,
      required this.makeName,
      required this.modelID,
      required this.modelName});

  factory Results.fromJson(Map<String, dynamic> json) {
    return Results(
      makeID: json['Make_ID'],
      makeName: json['Make_Name'],
      modelID: json['Model_ID'],
      modelName: json['Model_Name'],
    );
  }
}
