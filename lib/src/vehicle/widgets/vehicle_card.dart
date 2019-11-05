

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vehicle/src/utility/responsive.dart';
import 'package:vehicle/src/vehicle/model/vehicle_model.dart';

class VehicleCard extends StatelessWidget {

  final VehicleModel vehicle;

  VehicleCard({this.vehicle});

  Widget _textWidget(String text, [color]) {
    return Text(
      text,
      style: TextStyle(
        color: color ?? Colors.black87,
        fontSize: Responsive.responsiveSize(Responsive.context, 13.0),
        fontWeight: FontWeight.w500
      ),
    );
  }

  Widget _vehicleTextContent(text, value) {
    return Padding(
      padding: EdgeInsets.all(Responsive.responsiveSize(Responsive.context, 10.0)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: Responsive.responsiveSize(Responsive.context, 130.0),
            child:_textWidget(text)
          ),
          _textWidget(':'),
          Flexible(child: _textWidget(value.toString()))
        ],
      )
    );
  }

  _getTitleContent() {
    return Container(
      color: Color.fromRGBO(255, 30, 30, 1),
      padding: EdgeInsets.all(Responsive.responsiveSize(Responsive.context, 8.0)),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: Responsive.responsiveSize(Responsive.context, 130.0),
            child: _textWidget('Vehicle ID', Colors.white),
          ),
          _textWidget(':', Colors.white),
          _textWidget(vehicle.vehicleID, Colors.white),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: Responsive.responsiveSize(Responsive.context, 20.0),
                height: Responsive.responsiveSize(Responsive.context, 20.0),
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }

  _getBtmContent() {
    return Container(
      padding: EdgeInsets.all(Responsive.responsiveSize(Responsive.context, 8.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Icon(
            Icons.watch_later,
            size: Responsive.responsiveSize(Responsive.context, 14.0),
            color: Colors.white,
          ),
          SizedBox(width: Responsive.responsiveSize(Responsive.context, 3.0)),
          Text(
            '${vehicle.speed.toInt()} km/hr',
            style: TextStyle(
              color: Colors.white,
              fontSize: Responsive.responsiveSize(Responsive.context, 12.0)
            ),
          )
        ],
      ),
      color: Colors.grey[500],
    );
  }

  @override
  Widget build(BuildContext context) {
    Responsive.context = context;
    return Container(
      margin: EdgeInsets.only(
        left: Responsive.responsiveSize(Responsive.context, 8.0),
        right: Responsive.responsiveSize(Responsive.context, 8.0),
        bottom: Responsive.responsiveSize(Responsive.context, 12.0),
      ),
      child: Column(
        children: <Widget>[
          _getTitleContent(),
          Visibility(
            visible: vehicle.currentLocation.isNotEmpty,
            child: _vehicleTextContent('Location', vehicle.currentLocation),
          ),
          Visibility(
            visible: vehicle.driverFullName.isNotEmpty,
            child: _vehicleTextContent('Driver', vehicle.driverFullName),
          ),
          Visibility(
            visible: vehicle.companyName.isNotEmpty,
            child: _vehicleTextContent('Company', vehicle.companyName),
          ),
          Visibility(
            visible: vehicle.locationDateTime.toString().isNotEmpty,
            child: _vehicleTextContent(
              'Date',
              DateFormat("MMM-dd-yyyy hh:mm aaa").format(DateTime.fromMicrosecondsSinceEpoch(
                vehicle.locationDateTime
              ))
            ),
          ),
          Visibility(
            visible: vehicle.lastStatusDuration.toString().isNotEmpty,
            child: _vehicleTextContent('Last Status Duration', vehicle.lastStatusDuration),
          ),
          Visibility(
            visible: vehicle.departmentName.toString().isNotEmpty,
            child: _vehicleTextContent('Department', vehicle.departmentName),
          ),
          Visibility(
            visible: vehicle.driverMobileNumber.toString().isNotEmpty,
            child: _vehicleTextContent('Driver Mobile', vehicle.driverMobileNumber),
          ),
          _getBtmContent(),
        ],
      ),
      color: Colors.white
    );
  }
}