import 'dart:io';

import 'package:flutter/material.dart';
import 'package:vehicle/src/vehicle/model/vehicle_model.dart';
import 'package:vehicle/src/vehicle/service.dart';
import 'package:vehicle/src/vehicle/widgets/vehicle_card.dart';

class Vehicle extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _VehicleState();
}

class _VehicleState extends State<Vehicle> {

  List<VehicleModel> vehicles = [];
  var isLoaded = false;
  var error = '';

  @override
  void initState() {
    super.initState();
    getVehicles();
  }

  Future getVehicles() async{
    try {
      final items = await ServiceRequest.fetchVehicleList();
      setState(() {
        vehicles = items;
        isLoaded = true;
      });
    } catch (e) {
      setState(() {
        isLoaded = true;
        error = e.toString();
      });
    }
  }

  Widget _getChildWidget() {
    if (isLoaded) {
      if(vehicles.isNotEmpty) {
        return ListView.builder(
          padding: EdgeInsets.only(top: 10.0),
          itemCount: vehicles.length,
          itemBuilder: (context, index) {
            return VehicleCard(vehicle: vehicles[index]);
          },
        );
      } else {
        return Center(
          child: Text(
            error,
            style: TextStyle(
              color: Colors.red[700],
              fontSize: 16.0
            ),
          ),
        );
      }
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Vehicle Monitor',
          style: TextStyle(
            color: Colors.black
          ),
        ),
        titleSpacing: 0.0,
        leading: IconButton(
          padding: EdgeInsets.only(right: 1.0),
          onPressed: () {
            return exit(0);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          )
        ),
        backgroundColor: Colors.white,
        centerTitle: false,
        actions: <Widget>[
          Container(
            width: 60.0,
            color: Colors.red,
          )
        ],
      ),
      body: _getChildWidget(),
    );
  }
}