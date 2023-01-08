// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce/presentation/main_pages/payment_page/khalti_payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:ecommerce/presentation/resources/colors.dart';
import 'package:ecommerce/presentation/resources/fonts.dart';
import 'package:ecommerce/presentation/resources/values.dart';
import 'package:ecommerce/presentation/widgets/widgets.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  int met = 1;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            TopSection(tap: (){
              Navigator.pop(context);
            },
            text: "Payment Methods",
            ),
            SizedBox(
              height: 20,
            ),
            Payment_Box(change: (val){
                met == 2? met =1:2;
              setState(() {
                
              });
            },icon: Icons.attach_money_outlined,method: "Cash On Delivery",color: Colors.black,value:met==1?true:false,),
            SizedBox(height: 10,),
             Payment_Box(change: (val){
             met == 1? met=2:1;
             setState(() {
               
             });
             },icon: Icons.wallet,method: "Khalti",color: Colors.blue,value:met==2?true: false,
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
                if(met==2){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return KhaltiPay();
                  }));
                }
                else if(met ==1){
                  print("Cash on Delivery");
                }
              },
              child: Container(
                margin: EdgeInsets.only(left: 10,right: 10),
                height: AppHeight.h60,
              width: MediaQuery.of(context).size.width*0.5,
              decoration: BoxDecoration(
                color: ColorManager.buttonColor,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Center(child: SmallText(text: "Continue",size: 18,weight: FontWeightManager.semibold,),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Payment_Box extends StatelessWidget {
 String method;
 IconData icon;
 Color color;
var change;
bool value;

  Payment_Box({
    Key? key,
    required this.method,
    required this.icon,
    required this.color,
    required this.change,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppHeight.h80,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorManager.boxBorderGrey.withOpacity(0.1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.white
            ),
            child: Center(child: Icon(icon,color: color,),),
          ),
          Container(
            width: MediaQuery.of(context).size.width*0.6,
            child: SmallText(text: method,weight: FontWeightManager.bold,color:Colors.black,),
          ),
          Switch(value: value, onChanged: change)
        ],
      ),
    );
  }
}
