import 'package:ecommerce/logic/address_bloc/bloc/address_bloc_bloc.dart';
import 'package:ecommerce/presentation/base/custom_snackbar.dart';
import 'package:ecommerce/presentation/main_pages/shipping_address/address_search.dart';
import 'package:ecommerce/presentation/main_pages/shipping_address/maps/mark_map.dart';
import 'package:ecommerce/presentation/resources/colors.dart';
import 'package:ecommerce/presentation/resources/fonts.dart';
import 'package:ecommerce/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddAddress extends StatefulWidget {
  const AddAddress({super.key});

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
   String ival = "Address";
   Color colorManager = ColorManager.boxText.withOpacity(0.5);
  var homeController = TextEditingController();
  var addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.purple
        ),
        title: Center(child: SmallText(text: "Add Address",color: Colors.black,weight: FontWeightManager.bold,size: 20,),),
       backgroundColor: Colors.white.withOpacity(0.5),
       actions: [
        Padding(padding: EdgeInsets.only(right: 20),
        child: GestureDetector(
          onTap: ()async{
           String? test = await Navigator.push(context, MaterialPageRoute(
              builder: (context){
                return MarkMap();
              }
            ));
            setState(() {
                     this.ival = test?? 'Address';
                     colorManager = ival == "Address"?ColorManager.boxText.withOpacity(0.5): Colors.black;
                     }
                   );
          },
          child: Icon(Icons.map_rounded)),
        )
       ],
      ),
      body: SafeArea(child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            TextFieldHelp(icon: Icons.home, hintText: "Home",controller: homeController,),
            SizedBox(height: 20,),
            GestureDetector(
              onTap: () async{
                  String? test = await Navigator.push(context, MaterialPageRoute(
              builder: (context){
                return MarkMap();
              }
            ));
            setState(() {
                     this.ival = test?? 'Address';
                     colorManager = ival == "Address"?ColorManager.boxText.withOpacity(0.5): Colors.black;
                     }
                   );
              },
              child: Container(
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
                      child: SmallText(text: ival,color: colorManager,lines: 1,))
                  ],
                ),
              ),),
              SizedBox(height: 40,),
             ival == "Address"? AuthenticationWidget(text: "Save",color: ColorManager.boxBorderGrey,textColor: Colors.white,):
             BlocConsumer<AddressBlocBloc,AddressBlocState>(
              builder: (context,state){
                if(state is AddressAdding){
                  return AuthenticationWidget(text: "Saving...",color: Colors.purple[600]!,textColor: Colors.white,);
                }
               return InkWell(
                onTap: (){
                  print("ss");
                  context.read<AddressBlocBloc>().add(AddToAddressEvent( address: ival, title: homeController.text));
                },
                child: AuthenticationWidget(text: "Save",color: Colors.purple,textColor: Colors.white,));
              },
              listener: (context,state){
                if(state is AddressAdded){
                  showCustomSnackbar(context, "Address Added successfully",
                      color: Colors.green);
                      Navigator.pop(context);
                }
                if(state is AddressError){
                  showCustomSnackbar(context, state.message.toString(),
                      color: Colors.green);
                }
              },
             ),
          ],
        ),
      )),
    );
  }
}