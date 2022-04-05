import 'package:flutter/material.dart';

import '../model/vehicles.dart';

class VehicleList extends StatelessWidget {
  final List<Results> vehicles;

  const VehicleList({Key? key, required this.vehicles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: vehicles.length,
        itemBuilder: (context, index) {
          Results vehicle = vehicles[index];

          return Card(
            child: ListTile(
              title: Text(vehicle.makeName),
            ),
          );
        });
  }
}
