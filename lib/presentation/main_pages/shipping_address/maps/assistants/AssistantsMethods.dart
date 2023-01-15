import 'package:ecommerce/presentation/main_pages/shipping_address/maps/assistants/RequestAssistants.dart';
import 'package:ecommerce/presentation/main_pages/shipping_address/maps/models/address.dart';
import 'package:ecommerce/presentation/main_pages/shipping_address/maps/models/direction_model.dart';
import 'package:ecommerce/presentation/resources/values.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';



class AssistantMenthods{
  static Future<String> searchCoordinateAddress(position)async{
      String? str1,str2,str3,str4;
      String placeAddress = "";
      String url ="https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=$apiKey";
      var response = await RequestAssistant.getRequest(url);
      if(response != "failed"){
        str1 = response["results"][0]["address_components"][1]["long_name"];
        str2=response["results"][0]["address_components"][5]["long_name"];
        str3=response["results"][0]["address_components"][6]["long_name"];
        str4=response["results"][0]["address_components"][5]["long_name"];
        placeAddress = ("$str1,$str2,$str3,$str4");
        Address userPickUpAddress = new Address(
          latitude: position.latitude,
          longitute: position.longitude,
          placeName: placeAddress,
          );
                }
      return placeAddress;
  }

    static Future<DirectionDetails?> obtainDirectionDetails(LatLng initialPosition, LatLng finalPosition) async{
        String directionUrl = "https://maps.googleapis.com/maps/api/directions/json?origin=${initialPosition.latitude},${initialPosition.longitude}&destination=${finalPosition.latitude},${finalPosition.longitude}&key=$apiKey";
        var res = await RequestAssistant.getRequest(directionUrl);
        if(res=="failed"){
          return null;
        }
        DirectionDetails directionDetails = DirectionDetails();
        directionDetails.encodedPoints = res["routes"][0]["overview_polyline"]["points"];
        //distance
        directionDetails.distanceText = res["routes"][0]["legs"][0]["distance"]["text"];
        directionDetails.distanceValue = res["routes"][0]["legs"][0]["distance"]["value"];

        //duration
         directionDetails.durationText = res["routes"][0]["legs"][0]["duration"]["text"];
        directionDetails.durationValue = res["routes"][0]["legs"][0]["duration"]["value"];

        return directionDetails;
  }
}