import 'package:ecommerce/presentation/resources/fonts.dart';
import 'package:ecommerce/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AddAddress extends StatefulWidget {
  const AddAddress({super.key});

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
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
        child: Icon(Icons.map_rounded),
        )
       ],
      ),
      body: SafeArea(child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            TextFieldHelp(icon: Icons.home, hintText: "Home")
          ],
        ),
      )),
    );
  }
}