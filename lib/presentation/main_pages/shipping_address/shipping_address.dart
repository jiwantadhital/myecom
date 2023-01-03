import 'package:ecommerce/presentation/main_pages/shipping_address/add_new_address.dart';
import 'package:ecommerce/presentation/resources/colors.dart';
import 'package:ecommerce/presentation/resources/fonts.dart';
import 'package:ecommerce/presentation/resources/values.dart';
import 'package:ecommerce/presentation/widgets/widgets.dart';
import 'package:ecommerce/routes/route_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ShippingAddress extends StatefulWidget {
  const ShippingAddress({super.key});

  @override
  State<ShippingAddress> createState() => _ShippingAddressState();
}

class _ShippingAddressState extends State<ShippingAddress> {

bool address = false;
int changedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
          child: Column(
            children: [
              TopSection(
                text: "Shipping Address",
                tap: (){
                  Navigator.pop(context);
                },
              ),
              SizedBox(height: AppHeight.h10,),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: ((context, index) {
                  return Container(
                    margin: EdgeInsets.only(top: 5,bottom: 5),
                    height: AppHeight.h100,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: AppHeight.h60,
                          width: AppWidth.w60,
                          child: Icon(Icons.location_history,size: 40,),
                          decoration: BoxDecoration(
                            color: ColorManager.boxBorderGrey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(100)
                    ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10,top: 10,bottom: 10),
                          width: MediaQuery.of(context).size.width*0.65,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SmallText(text: "Home",weight: FontWeightManager.bold,size: 18,color: Colors.black,),
                                                    SizedBox(height: 10,),
                              SmallText(text: "Kathmandu, Narefat, Balkumari",weight: FontWeightManager.light,size: 15,color: Colors.black,lines: 2,),
                            ],
                          ),
                        ),
                        Container(
                          width: AppWidth.w50,
                          child: Switch(value:changedIndex==index? address:false, onChanged: (val){
                            changedIndex = index;
                              address = val;
                            setState(() {    
                            });
                            print(index);
                          }),
                        )
                      ],
                    ),
                  );
                })),
              ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return AddAddress();
                    }));
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 20,right: 20),
                    height: 50,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: ColorManager.boxBorderGrey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(child: SmallText(text: "Add new Address",size: 15,weight: FontWeightManager.semibold,color: Colors.black,),),
                  ),
                )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 100,
        width: double.maxFinite,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: EdgeInsets.only(left: 10,right: 10),
              height: AppHeight.h60,
            width: MediaQuery.of(context).size.width*0.5,
            decoration: BoxDecoration(
              color: ColorManager.buttonColor,
              borderRadius: BorderRadius.circular(10)
            ),
            child: Center(child: SmallText(text: "Continue",size: 18,weight: FontWeightManager.semibold,),),
            ),
          ],
        ),
      ),
    );
  }
}