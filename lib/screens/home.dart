import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/vehicles.dart';
import '../services/services.dart';
import '../widgets/vehicle_list.dart';

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
      body: FutureBuilder(
          future: NetworkService.fetchAlbum(),
          builder: (context, AsyncSnapshot<Results> snapshot) {
            if (snapshot.hasData) {
              List<Results>? results = snapshot.data as List<Results>?;

              return Container(
                child: results != null
                    ? VehicleList(
                        vehicles: results,
                      )
                    : const Text('Noooooooooo !'),
              );
            } else if (snapshot.hasError) {
              print(snapshot.error);
              return Center(
                child: Text('${snapshot.error}'),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
