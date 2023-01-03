import 'package:ecommerce/local_database/shared_prefs.dart';
import 'package:ecommerce/logic/cart/bloc/cart_bloc.dart';
import 'package:ecommerce/presentation/base/custom_snackbar.dart';
import 'package:ecommerce/presentation/resources/colors.dart';
import 'package:ecommerce/presentation/resources/fonts.dart';
import 'package:ecommerce/presentation/widgets/detail_widget.dart';
import 'package:ecommerce/presentation/widgets/widgets.dart';
import 'package:ecommerce/routes/route_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(Icons.history),
          )
        ],
        iconTheme: IconThemeData(
         color: ColorManager.buttonColor
        ),
        backgroundColor: Colors.white,
        actionsIconTheme: IconThemeData(
          color: ColorManager.buttonColor
        ),
        title: Center(child: Text("My Cart",style: TextStyle(color: Colors.purple),)),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: BlocConsumer<CartBloc,CartState>(builder: (context,state){
          if(state is CartLoaded){
           return ListView.builder(
          itemCount: state.cartModelDatabase.length,
          itemBuilder: (context,index){
            return Container(
              margin: EdgeInsets.only(top: 5,bottom: 5),
              height: 100,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10)
              ),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 5,right: 5),
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage("https://imagekit.io/blog/content/images/2019/12/image-optimization.jpg"),
                      fit: BoxFit.cover
                      ),
                      borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    width: MediaQuery.of(context).size.width*0.62,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10,),
                        SmallText(text: state.cartModelDatabase[index].title,color: ColorManager.boxText,weight: FontWeightManager.bold,size: 15,),
                        SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SmallText(text: "Rs. ${state.cartModelDatabase[index].price.toString()}",color: ColorManager.boxText,size: 15,weight: FontWeightManager.semibold,),
                           GestureDetector(
                              child: Icon(Icons.delete)),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          
                            Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                            width: MediaQuery.of(context).size.width*0.35,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: [
                                                AddSubtractWidget(icons: Icons.remove,height: 25,width: 25,iSize: 15,tap: (){
                                                  state.cartModelDatabase[index].count<2?context.read<CartBloc>().add(CartDeleteEvent(id: state.cartModelDatabase[index].id)):
                                                  context.read<CartBloc>().add(UpdateCartEvent(id: state.cartModelDatabase[index].id, count: state.cartModelDatabase[index].count-1,image: state.cartModelDatabase[index].image,price: state.cartModelDatabase[index].price,title: state.cartModelDatabase[index].title));
                                                   context.read<CartBloc>().add(LoadCartEvent());
                                       
                                                },),
                                                SmallText(text: state.cartModelDatabase[index].count.toString(),color: ColorManager.boxText,weight: FontWeightManager.semibold,size: 20,),
                                                 AddSubtractWidget(icons: Icons.add,height: 25,width: 25,iSize: 15,
                                                 tap: (){
                                                  state.cartModelDatabase[index].count>9?showCustomSnackbar(context, "You cannot add more than 10 products"):
                                                  context.read<CartBloc>().add(UpdateCartEvent(id: state.cartModelDatabase[index].id, count: state.cartModelDatabase[index].count+1,image: state.cartModelDatabase[index].image,price: state.cartModelDatabase[index].price,title: state.cartModelDatabase[index].title));
                                                  context.read<CartBloc>().add(LoadCartEvent());
                                                 },
                                                 ),
                                              ],
                                            ),
                                          ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        );
          }
          if(state is CartInitial){
            return CircularProgressIndicator();
          }
          if(state is CartError){
            return Center(child: Text("Something went wrong"));
          }
          return Center(child: Text("Something went wrong"));
        }, listener: (context,state){
        })
      ),
      bottomNavigationBar: Container(
        height: 80,
        color: ColorManager.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: MediaQuery.of(context).size.width*0.4,
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  SmallText(text: "Total:",color: ColorManager.boxText,),
                  SizedBox(height: 5,),
                  BlocBuilder<CartBloc,CartState>(builder: (context,state){
                    if(state is CartLoaded){
               
                      return  SmallText(text: "Rs. ${state.total}",color: ColorManager.boxText,weight: FontWeightManager.semibold,);
                    }
                    if(state is CartInitial){
                      return  SmallText(text: "Calculating",color: ColorManager.boxText,weight: FontWeightManager.semibold,);
                    }
                     return  SmallText(text: "Rs. 0",color: ColorManager.boxText,weight: FontWeightManager.semibold,);
                  }),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.4,
              height: 50,
              decoration: BoxDecoration(
                color: ColorManager.buttonColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(child: GestureDetector(
                onTap: (){
                  UserSimplePreferences.userLoggedIn()?Navigator.pushNamed(context, Routes.shippingAddress):Navigator.pushNamed(context, Routes.social);
                },
                child: SmallText(text: "Buy Now",weight: FontWeightManager.semibold,))),
            ),
          ],
        ),
      ),
    );
  }
}