// GENERATED CODE - DO NOT MODIFY BY HAND

part of vehicle_model;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleModel _$VehicleModelFromJson(Map<String, dynamic> json) {
  return VehicleModel()
    ..vehicleUno = json['VehicleUno'] as int
    ..vehicleID = json['VehicleID'] as String
    ..sl = json['Sl'] as int
    ..driverUno = json['DriverUno'] as int
    ..driverFullName = json['DriverFullName'] as String
    ..driverDetails = json['DriverDetails'] as String
    ..driverMobileNumber = json['DriverMobileNumber'] as String
    ..currentLocation = json['CurrentLocation'] as String
    ..companyName = json['CompanyName'] as String
    ..locationDateTime = json['LocationDateTime'] as int
    ..lastStatusDuration = json['LastStatusDuration'] as String
    ..dynamicVehicleStatusName = json['DynamicVehicleStatusName'] as String
    ..departmentName = json['DepartmentName'] as String
    ..speed = (json['Speed'] as num)?.toDouble();
}

Map<String, dynamic> _$VehicleModelToJson(VehicleModel instance) =>
    <String, dynamic>{
      'VehicleUno': instance.vehicleUno,
      'VehicleID': instance.vehicleID,
      'Sl': instance.sl,
      'DriverUno': instance.driverUno,
      'DriverFullName': instance.driverFullName,
      'DriverDetails': instance.driverDetails,
      'DriverMobileNumber': instance.driverMobileNumber,
      'CurrentLocation': instance.currentLocation,
      'CompanyName': instance.companyName,
      'LocationDateTime': instance.locationDateTime,
      'LastStatusDuration': instance.lastStatusDuration,
      'DynamicVehicleStatusName': instance.dynamicVehicleStatusName,
      'DepartmentName': instance.departmentName,
      'Speed': instance.speed,
    };
