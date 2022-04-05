import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/vehicles.dart';

class NetworkService {
  static Future<Results> fetchAlbum() async {
    final response = await http.get(Uri.parse(
        'https://vpic.nhtsa.dot.gov/api/vehicles/getmodelsformake/honda?format=json#'));

    if (response.statusCode == 200) {
      return Results.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }
}
















// //   Future<Album> _future;
// //   Results _selected;

// //   Future<Album> fetchAlbum() async {
// //     final response = await http.get(
// //         'https://vpic.nhtsa.dot.gov/api/vehicles/getmodelsformake/honda?format=json');

// //     if (response.statusCode == 200) {
// //       return Album.fromJson(jsonDecode(response.body));
// //     } else {
// //       throw Exception('Failed to load album');
// //     }
// //   }

// class dataAPI {
//   String makeName;
//   String modelName;

//   dataAPI({
//     required this.makeName,
//     required this.modelName,
//   });

//   factory dataAPI.createData(Map<String, dynamic> object) {
//     return dataAPI(
//         makeName: object['Make_Name'], modelName: object['Model_Name']);
//   }
//   static Future<List<dataAPI>?> getData() async {
//     String URLapi =
//         'https://vpic.nhtsa.dot.gov/api/vehicles/getmodelsformake/honda?format=json#';
//     var apiResult = await http.get(Uri.parse(URLapi));

//     var jsonObject = json.decode(apiResult.body);
//     List<dynamic> data = (jsonObject as Map<String, dynamic>)['data'];

//     // ((data['softskills'] ?? []) as List)

//     List<dataAPI> listData = [];
//     for (int i = 0; i < data.length; i++) {
//       listData.add(dataAPI.createData(data[i]));
//       print(listData);
//       return listData;
//     }
//   }
// }
