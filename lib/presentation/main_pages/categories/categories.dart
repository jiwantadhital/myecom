import 'package:animations/animations.dart';
import 'package:ecommerce/presentation/main_pages/categories/filters.dart';
import 'package:ecommerce/presentation/main_pages/home_pages/details/detail_page.dart';
import 'package:ecommerce/presentation/resources/colors.dart';
import 'package:ecommerce/presentation/resources/fonts.dart';
import 'package:ecommerce/presentation/resources/values.dart';
import 'package:ecommerce/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {

  int myIndex =0;

     bool _slowAnimations = false;
  ContainerTransitionType _transitionType = ContainerTransitionType.fade;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.maxFinite,
          height: MediaQuery.of(context).size.height,
          color: ColorManager.buttonColor,
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 20,right: 10),
                  height: MediaQuery.of(context).size.height*0.1,
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 25.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: Colors.white
                      ),
                      child:   TextField(
                        cursorColor: Color.fromRGBO(255, 141, 13, 1),
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.search,
                            color: ColorManager.primary,
                            size: IconSize.i25,
                            ),
                            border: InputBorder.none,
                            hintText: "Search",
                            hintStyle: TextStyle(color: Colors.black26,fontSize: 10)
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: AppWidth.w10,),
                  Container(
                    width: AppWidth.w50,
                    height: AppHeight.h50,
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: ColorManager.white,
                    ),
                    child:  GestureDetector(
                      onTap: (() {
                        showModalBottomSheet<void>(
                          isScrollControlled: true,
                          enableDrag: true,
                    context: context,
                    builder: (BuildContext context) {
                    return Filters();
                  },
                    );
                      }),
                      child: Icon(
                        Icons.list,
                        color: ColorManager.darkGrey,
                        ),
                    ),
                  ),
                ],
              ),),
              Container(
                height: MediaQuery.of(context).size.height*0.04,
                child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index){
                  return GestureDetector(
                      onTap: (){
                        myIndex=index;
                        setState(() {
                          
                        });
                      },
                    child: Container(
                      margin: EdgeInsets.only(left: 5,right: 5),
                      height: 20,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:index==myIndex? Color.fromARGB(255, 23, 141, 27):ColorManager.white,
                        border: index==myIndex? Border.all(width: 1,color: ColorManager.white,):Border.all(width: 0),
                      ),
                      child: Center(child: SmallText(text: "Clothes",color: index==myIndex? Colors.white:ColorManager.buttonColor,size: 15,weight: FontWeightManager.semibold,)),
                    ),
                  );
                }),
              ),
              SizedBox(height: AppHeight.h10,),
                Container(
                  padding: EdgeInsets.all(10),
                  height: MediaQuery.of(context).size.height*0.75,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: ColorManager.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
                  ),
                  child: SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(
            child: GridView.builder(  
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 10,  
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(  
            crossAxisCount: 2,  
            crossAxisSpacing: 10.0,  
            childAspectRatio: 0.7,
            mainAxisSpacing: 9.0
              ),  
              itemBuilder: (BuildContext con, int index){  
            return OpenContainer(
              transitionDuration: Duration(seconds: 1),
              transitionType: _transitionType,
              closedBuilder: (BuildContext _, VoidCallback openContainer){
              return  Container(
              decoration: BoxDecoration(
              ),
              child: Stack(
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        child: Container(
                          height: AppHeight.h160,
                          decoration: BoxDecoration(
                            border: Border.all(width: 6,color: ColorManager.white),
                            borderRadius: BorderRadius.circular(30),
                            image: DecorationImage(image: NetworkImage("https://www.savethestudent.org/uploads/Online-fashion-retailers.jpg"),fit: BoxFit.cover),
                          ),
                        ),
                      ),
                       SizedBox(height: AppHeight.h5,),
                   Container(
                     width: AppWidth.w150,
                     child: Center(child: SmallText(text: "Super Shiny 32", color: ColorManager.boxText,weight: FontWeightManager.semibold,)),
                   ),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children: [
                       Container(
                         width: AppWidth.w50,
                         child: RichText(text: TextSpan(
                           children: [
                             WidgetSpan(child: Icon(Icons.star, color: Colors.yellow,size: 12,),),
                             WidgetSpan(child: SmallText(text: "3.5",color: ColorManager.boxText,size: 12,))
                           ],
                         )),
                       ),
                       Container(
                         width: AppWidth.w100,
                         child: SmallText(text: "Rs 4400", color: ColorManager.boxText,align: TextAlign.end,size: 15,),
                       ),
                     ],
                   ),
                    ],
                  ),
               
                ],
              ),
            );
              },
               openBuilder: (BuildContext _, VoidCallback __){
                    return DetailPage();
                   });
              }
               ),
          ),
        ],
      ),
    ),
                )
              ],
            ),
          ),
        ),
        ),
    );
  }
  
}