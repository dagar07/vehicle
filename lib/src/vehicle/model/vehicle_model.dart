library vehicle_model;

import 'package:json_annotation/json_annotation.dart';

part 'vehicle_model.g.dart';

@JsonSerializable()
class VehicleModel {
  @JsonKey(name: 'VehicleUno')
  int vehicleUno;

  @JsonKey(name: 'VehicleID')
  String vehicleID;

  @JsonKey(name: 'Sl')
  int sl;

  @JsonKey(name: 'DriverUno')
  int driverUno;

  @JsonKey(name: 'DriverFullName', nullable: false)
  String driverFullName;

  @JsonKey(name: 'DriverDetails')
  String driverDetails;

  @JsonKey(name: 'DriverMobileNumber')
  String driverMobileNumber;

  @JsonKey(name: 'CurrentLocation')
  String currentLocation;

  @JsonKey(name: 'CompanyName')
  String companyName;

  @JsonKey(name: 'LocationDateTime')
  int locationDateTime;

  @JsonKey(name: 'LastStatusDuration')
  String lastStatusDuration;

  @JsonKey(name: 'DynamicVehicleStatusName')
  String dynamicVehicleStatusName;

  @JsonKey(name: 'DepartmentName')
  String departmentName;

  @JsonKey(name: 'Speed')
  double speed;
  
  VehicleModel();
  factory VehicleModel.fromJson(Map<String, dynamic> json) => _$VehicleModelFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleModelToJson(this);
}