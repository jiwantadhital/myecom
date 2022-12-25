import 'package:ecommerce/logic/all_products/bloc/all_products_bloc.dart';
import 'package:ecommerce/logic/cart/bloc/cart_bloc.dart';
import 'package:ecommerce/presentation/base/custom_snackbar.dart';
import 'package:ecommerce/presentation/main_pages/cart/cart_page.dart';
import 'package:ecommerce/presentation/main_pages/home_pages/details/description_spec_comment.dart';
import 'package:ecommerce/presentation/main_pages/home_pages/details/extra_details_widgets.dart';
import 'package:ecommerce/presentation/resources/colors.dart';
import 'package:ecommerce/presentation/resources/fonts.dart';
import 'package:ecommerce/presentation/widgets/detail_widget.dart';
import 'package:ecommerce/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class DetailPage extends StatefulWidget {
  int index;
  DetailPage({super.key, required this.index});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  List imageList = [
    "https://www.savethestudent.org/uploads/Online-fashion-retailers.jpg",
    "https://www.dell.com/wp-uploads/2022/01/Isabelle-Boemeke-in-Nuclear-Power-Dress-designed-by-Clara-Daguin-created-by-DRESSX-1.jpg",
    "https://media1.popsugar-assets.com/files/thumbor/IZn6hypi_XqOUTaBTEFCWHY5ALg/404x0:5616x3492/fit-in/728xorig/filters:format_auto-!!-:strip_icc-!!-/2022/05/03/023/n/1922564/9cd00d396271bc05d13587.09341688_/i/What-Clothes-Should-I-Wear-My-20s.jpg",
  ];
  TabController? _tabController;
  int theNumber = 1;
  String networkImage =
      "https://www.savethestudent.org/uploads/Online-fashion-retailers.jpg";
  Color color = Colors.white;
  int currentIndex = 0;
  double bottomHeight = 70;
  @override
  Widget build(BuildContext context) {
    final cart = context
        .read<AllProductsBloc>()
        .productRepository
        .productModel[widget.index];
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: IconWidget(
                              icons: Icons.arrow_back,
                              backgroundColor:
                                  ColorManager.buttonColor.withOpacity(0.6))),
                      Stack(
                        children: [
                          InkWell(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return CartPage();
                                }));
                              },
                              child: IconWidget(
                                  icons: Icons.shopping_cart,
                                  backgroundColor: ColorManager.buttonColor
                                      .withOpacity(0.6))),
                          Positioned(
                              child: Container(
                            margin: const EdgeInsets.only(top: 10, left: 40),
                            height: 15,
                            width: 15,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5)),
                            child: Center(
                                child: BlocBuilder<CartBloc,CartState>(builder: (context,state){
                                 if(state is CartLoaded){
                                   return SmallText(
                              text: state.countTotal.toString(),
                              color: ColorManager.buttonColor,
                              size: 10,
                              weight: FontWeight.bold,
                            );
                                 }
                                 return Container();
                                },)
                            ),
                          ))
                        ],
                      ),
                    ],
                  ),
                  backgroundColor: ColorManager.buttonColor,
                  collapsedHeight: 80,
                  automaticallyImplyLeading: false,
                  expandedHeight: 300.0,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                      background: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          image: DecorationImage(
                              image: NetworkImage(imageList[currentIndex]),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Positioned(
                          top: 200,
                          child: Center(
                            child: Container(
                              height: 50,
                              width: 180,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: imageList.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        networkImage = imageList[index];
                                        currentIndex = index;
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(left: 20),
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                              width:
                                                  currentIndex == index ? 3 : 2,
                                              color: currentIndex == index
                                                  ? Colors.purple
                                                  : Colors.white),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  imageList[index]),
                                              fit: BoxFit.cover)),
                                    ),
                                  );
                                },
                              ),
                            ),
                          )),
                    ],
                  )),
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(20),
                    child: Card(
                      shadowColor: Colors.black,
                      child: TabBar(
                          onTap: (val) {
                            setState(() {
                              val == 2 ? bottomHeight = 0 : bottomHeight = 70;
                            });
                          },
                          controller: _tabController,
                          unselectedLabelColor: Colors.black,
                          indicator: BoxDecoration(
                              color: ColorManager.primary,
                              borderRadius: BorderRadius.circular(4)),
                          tabs: const [
                            Tab(
                              child: Text("Details"),
                            ),
                            Tab(
                              child: Text("Specification"),
                            ),
                            Tab(
                              child: Text("Reviews"),
                            ),
                          ]),
                    ),
                  ),
                ),
              ];
            },
            body: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    DescPart(
                      index: widget.index,
                    ),
                    Specifications(),
                    Reviews(),
                  ]),
            )),
      ),
      bottomNavigationBar: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        padding: EdgeInsets.only(left: 10, right: 10),
        width: double.maxFinite,
        height: bottomHeight,
        decoration: BoxDecoration(color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.35,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AddSubtractWidget(
                    icons: Icons.remove,
                    tap: () {
                      setState(() {
                        theNumber--;
                      });
                    },
                  ),
                  SmallText(
                    text: theNumber.toString(),
                    color: ColorManager.boxText,
                    weight: FontWeightManager.semibold,
                    size: 20,
                  ),
                  AddSubtractWidget(
                    icons: Icons.add,
                    tap: () {
                      setState(() {
                        theNumber++;
                      });
                    },
                  ),
                ],
              ),
            ),
            BlocConsumer<CartBloc, CartState>(
              builder: ((context, state) {
                if (state is CartAdding) {
                  return Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Colors.purple[800],
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                        child: MediumText(
                      text: "Adding...",
                      colors: ColorManager.white,
                    )),
                  );
                }
                return Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                      color: ColorManager.buttonColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(child: BlocBuilder<CartBloc, CartState>(
                      builder: ((context, state) {
                    if (state is CartInitial) {
                    return Center(
                        child: MediumText(
                      text: "Adding...",
                      colors: ColorManager.white,
                    ));
                    }
                    if (state is CartLoaded) {
                      return GestureDetector(
                          onTap: () {
                            final sta = state.cartModelDatabase
                                .map((e) => e.id)
                                .toList();
                            sta.contains(cart.id)
                                ? context.read<CartBloc>().add(UpdateCartEvent(
                                    id: cart.id,
                                    count: theNumber,
                                    image: cart.images[0].imageName,
                                    title: cart.title,
                                    price: cart.price.toDouble()))
                                : context.read<CartBloc>().add(AddToCartEvent(
                                    id: cart.id,
                                    count: theNumber,
                                    image: cart.images[0].imageName,
                                    title: cart.title,
                                    price: cart.price.toDouble()));
                            context.read<CartBloc>().add(LoadCartEvent());
                          },
                          child: MediumText(
                            text: "Add to Cart",
                            colors: ColorManager.white,
                          ));
                    }
                    return MediumText(
                      text: "......",
                      colors: ColorManager.white,
                    );
                  }))),
                );
              }),
              listener: (context, state) {
                if (state is CartError) {
                  print(state.message);
                }
                if (state is CartAdded) {
                  showCustomSnackbar(context, "Added to cart successfully",
                      color: Colors.green);
                }
                if (state is CartUpdated) {}
              },
            )
          ],
        ),
      ),
    );
  }
}
