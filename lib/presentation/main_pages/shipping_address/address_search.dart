import 'package:ecommerce/presentation/main_pages/shipping_address/address_network.dart';
import 'package:ecommerce/presentation/main_pages/shipping_address/models/auto_complete_predication.dart';
import 'package:ecommerce/presentation/main_pages/shipping_address/models/place_prediction.dart';
import 'package:ecommerce/presentation/resources/values.dart';
import 'package:ecommerce/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_maps_webservice/places.dart';

class AddressSearch extends StatefulWidget {
  const AddressSearch({super.key});

  @override
  State<AddressSearch> createState() => _AddressSearchState();
}

class _AddressSearchState extends State<AddressSearch> {
  bool isLoading = false;
  List<AutocompletePrediction> auto = [];
  var searchController = TextEditingController();
  void placeAutocomplete(String query)async{
    isLoading = true;
    Uri uri = Uri.https(
      "maps.googleapis.com",
      '/maps/api/place/autocomplete/json',
      {
        "input": query,
        "key": apiKey,
      }
    );
    String? response = await AddressNetwork.fetchUrl(uri);
    if(response != null){
    PlaceAutocompleteResponse result = PlaceAutocompleteResponse.parseAutocompleteResult(response);
    if(result.predictions != null){
      auto = result.predictions!;
      isLoading = false;
      setState(() {
        
      });
    }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height*0.9,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
      ),
      child: Column(
        children: [
          SizedBox(height: 20,),
          TextFieldHelp(
            forPassword: (){
              auto = [];
              searchController.text = "";
              setState(() {
                
              });
            },
            backIcon: Icons.remove_circle,
            controller: searchController,
            icon: Icons.search, hintText: "Search your address",changed: (val)async{
              placeAutocomplete("Nepal ${val}");
              setState(() {
                
              });
          },
          
          ),
          SizedBox(height: 10,),
       auto.isEmpty?Center(child: Padding(
         padding: const EdgeInsets.only(top: 100),
         child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/images/search.png"))
          ),
         ),
       )):  isLoading == true? Center(child: Padding(
           padding: const EdgeInsets.only(top: 10,bottom: 5),
           child: SpinKitFadingCircle(
              color: Colors.purple,
            ),
         ),): ListView.builder(
            itemCount: auto.length,
            shrinkWrap: true,
            itemBuilder: (context,index){
            return GestureDetector(
              onTap: (){
                Navigator.pop(context,auto[index].description);
              },
              child: Container(
                height: AppHeight.h60,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Icon(Icons.location_on),
                    SizedBox(width: 10,),
                    Container(
                      width: MediaQuery.of(context).size.width*0.7,
                      child: SmallText(text: auto[index].description??"",color: Colors.black,lines: 2,))
                  ],
                ),
              ),
            );
          }),

        ],
      ),
    );
  }
}