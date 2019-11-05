import 'dart:io';

import 'package:flutter/material.dart';
import 'package:vehicle/src/commonWidgets/custom_appbar.dart';
import 'package:vehicle/src/utility/responsive.dart';
import 'package:vehicle/src/vehicle/model/vehicle_model.dart';
import 'package:vehicle/src/vehicle/service.dart';
import 'package:vehicle/src/vehicle/widgets/vehicle_card.dart';

class Vehicle extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _VehicleState();
}

class _VehicleState extends State<Vehicle> {

  List<VehicleModel> vehicles = [];
  MediaQueryData queryData;
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
    Responsive.context = context;
    return Scaffold(
      appBar: CustomAppBar(
        height: Responsive.responsiveSize(context, 58.0),
        title: Text(
          'Vehicle Monitor',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: Responsive.responsiveSize(context, 21.0)
          ),
        ),
        leading: IconButton(
          padding: EdgeInsets.only(right: 1.0),
          onPressed: () {
            return exit(0);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: Responsive.responsiveSize(context, 24.0),
          )
        ),
        actions: <Widget>[
          Container(
            width: Responsive.responsiveSize(context, 60.0),
            color: Colors.red,
          )
        ],
      ),
      body: _getChildWidget(),
    );
  }
}