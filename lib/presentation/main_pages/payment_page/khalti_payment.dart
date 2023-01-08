import 'package:ecommerce/presentation/base/custom_snackbar.dart';
import 'package:ecommerce/presentation/resources/colors.dart';
import 'package:ecommerce/presentation/resources/fonts.dart';
import 'package:ecommerce/presentation/resources/values.dart';
import 'package:ecommerce/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:khalti_flutter/khalti_flutter.dart';

class KhaltiPay extends StatefulWidget {
  const KhaltiPay({super.key});

  @override
  State<KhaltiPay> createState() => _KhaltiPayState();
}

class _KhaltiPayState extends State<KhaltiPay> {
  var amount = TextEditingController();
  
  getAmt(){
    return int.parse(amount.text)*100;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            TopSection(tap: (){
              Navigator.pop(context);
            },
            text: "Khalti Payment",
            ),
                        SizedBox(height: 20,),
            TextFieldHelp(icon: Icons.wallet, hintText: "Enter the amount",
            controller: amount,
            ),
            SizedBox(height: 20,),
            GestureDetector(
              onTap: (){
                KhaltiScope.of(context).pay(
      config: PaymentConfig(
        amount: getAmt(),
        productIdentity: 'dell-g5-g5510-2021',
       productName: 'Dell G5 G5510 2021',
          productUrl: 'https://www.khalti.com/#/bazaar',
        additionalData: { 
          'vendor': 'Khalti Bazaar',
          },
         mobile: '9800000001', 
         mobileReadOnly: true, 
        ),
      preferences: [
        PaymentPreference.khalti,
        PaymentPreference.connectIPS,
      ],
      onSuccess: (success){
        showCustomSnackbar(context, "Payment SuccessFul",
                      color: Colors.green);
      },
      onFailure: (failure){
        showCustomSnackbar(context, failure.message,
                      color: Colors.red);
      },
      onCancel: (){},
    );
              },
              child: Container(
                margin: EdgeInsets.only(left: 10,right: 10),
                height: AppHeight.h60,
              width: MediaQuery.of(context).size.width*0.5,
              decoration: BoxDecoration(
                color: ColorManager.buttonColor,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Center(child: SmallText(text: "Pay With Khalti",size: 18,weight: FontWeightManager.semibold,),),
              ),
            ),
          ],
        ),
      )),
    );
  }
}