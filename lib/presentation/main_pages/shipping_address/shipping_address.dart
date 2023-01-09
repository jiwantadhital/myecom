import 'package:ecommerce/logic/address_bloc/bloc/address_bloc_bloc.dart';
import 'package:ecommerce/logic/order/bloc/order_bloc.dart';
import 'package:ecommerce/presentation/base/custom_snackbar.dart';
import 'package:ecommerce/presentation/main_pages/payment_page/payment_page.dart';
import 'package:ecommerce/presentation/main_pages/shipping_address/add_new_address.dart';
import 'package:ecommerce/presentation/resources/colors.dart';
import 'package:ecommerce/presentation/resources/fonts.dart';
import 'package:ecommerce/presentation/resources/values.dart';
import 'package:ecommerce/presentation/widgets/widgets.dart';
import 'package:ecommerce/routes/route_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShippingAddress extends StatefulWidget {
  const ShippingAddress({super.key});

  @override
  State<ShippingAddress> createState() => _ShippingAddressState();
}

class _ShippingAddressState extends State<ShippingAddress> {

bool address = true;
int changedIndex = 0;
bool add=true;
@override
  void initState() {
    context.read<AddressBlocBloc>()..add(LoadAddressEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
        context.read<AddressBlocBloc>().add(LoadAddressEvent());
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
              BlocConsumer<AddressBlocBloc,AddressBlocState>(
                listener: (context,state){
                  if(state is AddressLoaded){
                     state.addressModelDatabase.length>4?add=false:add=true;
                       setState(() {
                      
                    });
                  }
                },
                builder: (context,state){
                  if(state is AddressBlocInitial){
                    return Center(child: CircularProgressIndicator(),);
                  }
                  if(state is AddressLoaded){
                    return state.addressModelDatabase.isNotEmpty? Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.addressModelDatabase.length,
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
                              SmallText(text: state.addressModelDatabase[index].title,weight: FontWeightManager.bold,size: 18,color: Colors.black,),
                                                    SizedBox(height: 10,),
                              SmallText(text: state.addressModelDatabase[index].address,weight: FontWeightManager.light,size: 15,color: Colors.black,lines: 2,),
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
                          }),
                        )
                      ],
                    ),
                  );
                })),
              ):Center(child: SmallText(text: "Please Add Your Address",color: Colors.black,),);
                  }
                  if(state is AddressError){
                    return Center(child: SmallText(text: state.message.toString(),color: Colors.black,),);
                  }
                  return Center(child: SmallText(text: "Wrong",color: Colors.black,),);
                },
              ),
              SizedBox(height: 20,),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return AddAddress();
                    })).whenComplete(() {
                      setState(() {
                        print("done");
                      });
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 20,right: 20),
                    height: 50,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: ColorManager.boxBorderGrey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child:add==true? Center(child: SmallText(text: "Add new Address",size: 15,weight: FontWeightManager.semibold,color: Colors.black,),):Center(child: SmallText(text: "Cannot add more than 5 address",size: 15,weight: FontWeightManager.semibold,color: Colors.black,)),
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
            GestureDetector(
              onTap: (){
          context.read<OrderBloc>().add(OrderPostEvent(
         user_id: 1,
         order_code: "asasas",
         items: 3,
         total_price: 2345,
         discount: 10,
         shipping_cost: 100,
         order: "[1,2,3]",
         address: "asassa",
         order_status_id: 2,
         payment_code: "asas",
          created_by: 1),
          );

              },
              child: BlocConsumer<OrderBloc,OrderState>(builder: ((context, state) {
                if(state is OrderLoading){
                  return Container(
                margin: EdgeInsets.only(left: 10,right: 10),
                height: AppHeight.h60,
              width: MediaQuery.of(context).size.width*0.5,
              decoration: BoxDecoration(
                color: Colors.purpleAccent,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Center(child: SmallText(text: "Continue..",size: 18,weight: FontWeightManager.semibold,),),
              );
                }
                return Container(
                margin: EdgeInsets.only(left: 10,right: 10),
                height: AppHeight.h60,
              width: MediaQuery.of(context).size.width*0.5,
              decoration: BoxDecoration(
                color: ColorManager.buttonColor,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Center(child: SmallText(text: "Continue",size: 18,weight: FontWeightManager.semibold,),),
              );
              }), listener: ((context, state) {
                if(state is OrderError){
                  showCustomSnackbar(context, state.message,
                      color: Colors.red);
                }
                if(state is OrderDone){
                   Navigator.push(context, MaterialPageRoute(builder: (context){
                  return PaymentPage();
                }));
                }
              }))
            ),
          ],
        ),
      ),
    );
  }
}