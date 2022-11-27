// ignore_for_file: constant_identifier_names

import 'dart:convert';
import 'package:ecommerce/presentation/resources/colors.dart';
import 'package:ecommerce/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CommentSheet extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
              heightFactor: 0.9,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          padding: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 10),
          // width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.65,
          decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(25.0),
              topRight: const Radius.circular(25.0),
            ),
          ),
          child: Items(
          ),
        ),
      ),
    );
  }
}

class Items extends StatefulWidget {

  @override
  State<Items> createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  TextEditingController _mycontroller = TextEditingController();
  int _value = 1;
  String _comment = " ";
  String submit = "Submit";
  Widget afterSubmit = SmallText(
    text: "Submit",
    color: ColorManager.white,
  );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Container(
              height: 30,
              width: double.maxFinite,
              child: Center(
                  child: MediumText(
                text: "Write A Review",
                colors: ColorManager.darkGrey,
              )),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 80,
              width: double.maxFinite,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                             SmallText(
                          text: "1⭐",
                          color: ColorManager.primary,
                          size: 15,
                        ),
                        Radio(
                            value: 1,
                            groupValue: _value,
                            onChanged: (int? value) {
                              setState(() {
                                _value = value!;
                              });
                            }),
                          ],
                        ),
                        Column(
                          children: [
                                 SmallText(
                          size: 15,
                          text: "2⭐",
                          color: ColorManager.primary,
                        ),
                        Radio(
                            value: 2,
                            groupValue: _value,
                            onChanged: (int? value) {
                              setState(() {
                                _value = value!;
                              });
                            }),
                          ],
                        ),
                        Column(
                          children: [
                                SmallText(
                          size: 15,
                          text: "3⭐",
                          color: ColorManager.primary,
                        ),
                        Radio(
                            value: 3,
                            groupValue: _value,
                            onChanged: (int? value) {
                              setState(() {
                                _value = value!;
                              });
                            }),
                          ],
                        ),
                        Column(
                          children: [
                               SmallText(
                          size: 15,
                          text: "4⭐",
                          color: ColorManager.primary,
                        ),
                        Radio(
                            value: 4,
                            groupValue: _value,
                            onChanged: (int? value) {
                              setState(() {
                                _value = value!;
                              });
                            }),
                          ],
                        ),
                        Column(
                          children: [
                             SmallText(
                          size: 15,
                          text: "5⭐",
                          color: ColorManager.primary,
                        ),
                        Radio(
                            value: 5,
                            groupValue: _value,
                            onChanged: (int? value) {
                              setState(() {
                                _value = value!;
                              });
                            })
                          ],
                        ),
                       
                   
                    
                     
                       
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: _mycontroller,
              onChanged: (String comment) {
                setState(() {
                  _comment = comment;
                });
              },
              maxLines: 4,
              decoration: InputDecoration(
                  hintText: "Write your review",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(height: 20,),
            GestureDetector(
              onTap: ()async {
                setState(() {
                  afterSubmit = Container(
                      height: 25,
                      width: 25,
                      child: CircularProgressIndicator(
                        color: ColorManager.white,
                      ));
                });
                Navigator.pop(context);
              },
              child: Container(
                height: 50,
                width: 120,
                decoration: BoxDecoration(
                  color: ColorManager.primary,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Center(child: GestureDetector(
                  onTap: ()async{
                    setState(() {
                  afterSubmit = Container(
                      height: 25,
                      width: 25,
                      child: CircularProgressIndicator(
                        color: ColorManager.white,
                      ));
                });
                Navigator.pop(context);
                  },
                  child: afterSubmit)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}