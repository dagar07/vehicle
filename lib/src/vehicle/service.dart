import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:vehicle/src/vehicle/model/vehicle_model.dart';

class ServiceRequest {
  static Future fetchVehicleList() async{
    try {
      final response = await http.post(
          'http://poc.dt.ae/PocFleetmanMobApi/FleetMan/GetVehicleMonitor',
          headers: {
            HttpHeaders.authorizationHeader: "tFAbh7Z9YcXrnU/xewW5JGpK5m9jBl2yAU8/W0oyeGkx0e+xepQaP2XZj9DcDLiS",
            HttpHeaders.contentTypeHeader: 'application/json',
          },
          body: json.encode({
            "UserUno":808,
            "LanguageUno":1033,
            "CompanyUno":231,
            "RegionUno" :230,
            "DepartmentUno":297,
            "RowIndex":0,
            "RowCount":40,
            "Condition": 2,
            "ProductTypeUno":0
          })
        );
      if (response.statusCode == 200) {
        // If the call to the server was successful, parse the JSON.
        final items = (json.decode(response.body) as List).map((item) => VehicleModel.fromJson(item));
        return items.toList();
      } else {
        // If that call was not successful, throw an error.
        throw Exception('Failed to load post');
      }
    } catch(e) {
      print(e);
      throw Exception('Failed to load post');
      
    }
  }
}
