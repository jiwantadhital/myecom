import 'dart:async';

import 'package:ecommerce/presentation/main_pages/shipping_address/address_search.dart';
import 'package:ecommerce/presentation/main_pages/shipping_address/maps/assistants/AssistantsMethods.dart';
import 'package:ecommerce/presentation/resources/colors.dart';
import 'package:ecommerce/presentation/resources/fonts.dart';
import 'package:ecommerce/presentation/resources/values.dart';
import 'package:ecommerce/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';

class MarkMap extends StatefulWidget {
  const MarkMap({super.key});

  @override
  State<MarkMap> createState() => _MarkMapState();
}

class _MarkMapState extends State<MarkMap> {
  String ival = "Address";
   Color colorManager = ColorManager.boxText.withOpacity(0.5);
   String? placeId;
  Completer<GoogleMapController> _completer = Completer();
  GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: apiKey);
  Position? getCurrentPosition;
  var geoLocator = Geolocator(); 
  late GoogleMapController mapController;
  LatLng? latLangPosition;
  bool serviceEnabled = true;
  var address = "Address";
  LocationPermission? locationPermission;
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(27.699398465012234, 85.34760250046227),
    zoom: 3,
  );
  BitmapDescriptor? pinLocationIcon;

  void locationPosition()async{
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if(!serviceEnabled){
      return Future.error("Location service disabled");
    }
    locationPermission = await Geolocator.checkPermission();
    if(locationPermission== LocationPermission.denied){
      locationPermission = await Geolocator.requestPermission();
      if(locationPermission == LocationPermission.denied){
      return Future.error("Location service denied");
    }
    }
    if(locationPermission == LocationPermission.deniedForever){
            return Future.error("Location service denied forever");

    }
    if(placeId == null){
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    getCurrentPosition = position;
     latLangPosition = LatLng(position.latitude, position.longitude);
    CameraPosition cameraPosition = CameraPosition(target: latLangPosition!,zoom: 18);
    mapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
     address = await AssistantMenthods.searchCoordinateAddress(position);
    setState(() {
      
    });
    }
    else{
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    PlacesDetailsResponse detailsResponse = await _places.getDetailsByPlaceId(placeId!);
    getCurrentPosition = position;
     latLangPosition =LatLng(detailsResponse.result.geometry!.location.lat, detailsResponse.result.geometry!.location.lng);
    CameraPosition cameraPosition = CameraPosition(target: latLangPosition!,zoom: 18);
    mapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
     address = await AssistantMenthods.searchCoordinateAddress(latLangPosition);
    setState(() {
      
    });
    }
  }
  @override
  void initState() {
     BitmapDescriptor.fromAssetImage(
         ImageConfiguration(devicePixelRatio: 2.5),
         'assets/images/appl.png').then((onValue) {
            pinLocationIcon = onValue;
         });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.purple
        ),
        title: Center(child: SmallText(text: "Select Address",color: Colors.black,weight: FontWeightManager.bold,size: 20,),),
       backgroundColor: Colors.white.withOpacity(0.5),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height*0.7,
        width: double.maxFinite,
        child: GoogleMap(
          markers: <Marker>{
            Marker(
              draggable: true,
              markerId: MarkerId("1"),
              position: latLangPosition ?? LatLng(26.262, 87.2121),
              icon: BitmapDescriptor.defaultMarker,
              infoWindow: const InfoWindow(
                title: 'Usted está aquí',
              ),
              onDragEnd: ((newPosition) async{
                print("the po njh $newPosition");
             latLangPosition = LatLng(newPosition.latitude, newPosition.longitude);
           CameraPosition cameraPosition = CameraPosition(target: latLangPosition!,zoom: 18);
           mapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
            address = await AssistantMenthods.searchCoordinateAddress(newPosition);
          setState(() {
      
            });
          })
            )
          },
          
          myLocationEnabled: serviceEnabled,
          mapType: MapType.normal,
          onMapCreated: (GoogleMapController controller){
            _completer.complete(controller);
            mapController = controller;
            locationPosition();
          },
          initialCameraPosition: _kGooglePlex
        ),
      ),
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height*0.3,
        width: double.maxFinite,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
         color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 6.0,
                  ),
                ],
        ),
        child: Column(
          children: [
          GestureDetector(
            onTap: ()async{
                String? test = await showModalBottomSheet<String>(
                          isScrollControlled: true,
                          enableDrag: true,
                    context: context,
                    builder: (BuildContext context) {
                    return AddressSearch();
                  },
                    );
                   placeId = test;
                   setState(() {
                    locationPosition();
                     }
                    
                   );
            },
            child: Container(
              margin: EdgeInsets.only(top: 20,left: 10,right: 10),
                  height: 60,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: ColorManager.textFieldColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 15,),
                      Icon(Icons.location_on),
                      SizedBox(width: 10,),
                      Container(
                        width: MediaQuery.of(context).size.width*0.82,
                        child: SmallText(text: address,color: Colors.black,lines: 1,))
                    ],
                  ),
                ),
          ),
              SizedBox(height: 40,),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context,address);
                },
                child: Container(
                  height: 60,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.purple,
                  ),
                  child: Center(child: SmallText(text: "Save",color: Colors.white,size: 20,weight: FontWeight.w700,)),
                ),
              ),
          ],
        ),
      ),
    );
  }
}