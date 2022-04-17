import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/vehicles.dart';
import '../widgets/vehicle_list.dart';

Future<List<Result>> getVehicles() async {
  final response = await http.get(Uri.parse(
      'https://vpic.nhtsa.dot.gov/api/vehicles/getmodelsformake/honda?format=json#'));

  if (response.statusCode == 200) {
    return jsonDecode(response.body).map<Result>((data) {
      return Result.fromJson(data);
    }).toList();
  } else {
    throw Exception('Failed to load album');
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Vehicle List'),
        ),
        body: FutureBuilder<List<Result>>(
            future: getVehicles(),
            builder: (context, snapshot) {
              if (snapshot == ConnectionState.done) {
                List<Result>? results = snapshot.data;
                return Container(
                  child: results != null
                      ? VehicleList(results: results)
                      : const Text('Noooooooooo !'),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('${snapshot.error}'),
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              return const CircularProgressIndicator();
            }));
  }
}
