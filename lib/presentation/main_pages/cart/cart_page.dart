import 'package:ecommerce/presentation/resources/colors.dart';
import 'package:ecommerce/presentation/resources/fonts.dart';
import 'package:ecommerce/presentation/widgets/detail_widget.dart';
import 'package:ecommerce/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

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
        child: ListView.builder(
          itemCount: 3,
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
                      image: DecorationImage(image: NetworkImage("https://in-exstatic-vivofs.vivo.com/gdHFRinHEMrj3yPG/1657192245628/203773b7c46bbb1ba4e7c355fb048842.jpg"),
                      fit: BoxFit.cover
                      ),
                      borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    width: MediaQuery.of(context).size.width*0.55,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10,),
                        SmallText(text: "Vivo G45",color: ColorManager.boxText,weight: FontWeightManager.bold,size: 15,),
                        SizedBox(height: 5,),
                        SmallText(text: "Rs 4400",color: ColorManager.boxText,size: 15,weight: FontWeightManager.semibold,),
                        SizedBox(height: 10,),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                                        width: MediaQuery.of(context).size.width*0.35,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            AddSubtractWidget(icons: Icons.remove,height: 25,width: 25,iSize: 15,),
                                            SmallText(text: "1",color: ColorManager.boxText,weight: FontWeightManager.semibold,size: 20,),
                                             AddSubtractWidget(icons: Icons.add,height: 25,width: 25,iSize: 15),
                                          ],
                                        ),
                                      ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
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
                  SmallText(text: "330000",color: ColorManager.boxText,weight: FontWeightManager.semibold,),
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
              child: Center(child: SmallText(text: "Buy Now",weight: FontWeightManager.semibold,)),
            ),
          ],
        ),
      ),
    );
  }
}