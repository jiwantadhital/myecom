import 'package:ecommerce/presentation/resources/colors.dart';
import 'package:ecommerce/presentation/resources/fonts.dart';
import 'package:ecommerce/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MarkMap extends StatefulWidget {
  const MarkMap({super.key});

  @override
  State<MarkMap> createState() => _MarkMapState();
}

class _MarkMapState extends State<MarkMap> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
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
          mapType: MapType.normal,
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
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
          Container(
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
                      child: SmallText(text: "Address",color: Colors.black,lines: 1,))
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}