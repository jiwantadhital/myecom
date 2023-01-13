
import 'dart:io';

import 'package:ecommerce/data_provider/data_provider.dart';
import 'package:ecommerce/data_provider/product_provider.dart';
import 'package:ecommerce/local_database/address/controller/address_controller.dart';
import 'package:ecommerce/local_database/cart/controller/cart_controller.dart';
import 'package:ecommerce/local_database/shared_prefs.dart';
import 'package:ecommerce/logic/address_bloc/bloc/address_bloc_bloc.dart';
import 'package:ecommerce/logic/all_products/bloc/all_products_bloc.dart';
import 'package:ecommerce/logic/bloc/login_bloc.dart';
import 'package:ecommerce/logic/cart/bloc/cart_bloc.dart';
import 'package:ecommerce/logic/order/bloc/order_bloc.dart';
import 'package:ecommerce/logic/user_detail/bloc/user_detail_bloc.dart';
import 'package:ecommerce/presentation/bottom_navigation/bottom_navigation_bar.dart';
import 'package:ecommerce/presentation/main_pages/home_pages/home_page.dart';
import 'package:ecommerce/presentation/main_pages/shipping_address/add_new_address.dart';
import 'package:ecommerce/presentation/main_pages/shipping_address/maps/mark_map.dart';
import 'package:ecommerce/presentation/splash/splash_screen.dart';
import 'package:ecommerce/repository/auth_repository.dart';
import 'package:ecommerce/repository/product_repository.dart';
import 'package:ecommerce/routes/route_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khalti_flutter/khalti_flutter.dart';

import 'presentation/main_pages/payment_page/payment_page.dart';
import 'presentation/main_pages/shipping_address/shipping_address.dart';

 class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
 await UserSimplePreferences.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
            create: (BuildContext context) => LoginBloc(
                authRepository: AuthRepository(dataService: DataProvider())),
          ),
          BlocProvider<OrderBloc>(
            create: (BuildContext context) => OrderBloc(
                productOrder: ProductOrder(orderProvider: OrderProvider())),
          ),
          BlocProvider<AllProductsBloc>(
            create: (BuildContext context) => AllProductsBloc(
              productRepository: ProductRepository(productProvider: ProductProvider()))..add(GetProducts())
          ),
          BlocProvider<CartBloc>(
            create: (BuildContext context) => CartBloc(cartController: CartController())..add(LoadCartEvent())
          ),
          BlocProvider<UserDetailBloc>(
            create: (BuildContext context) => UserDetailBloc(userDetailsRepo: UserDetailsRepo(userAuthenticated: UserAuthenticated()))..add(UserDetailData())
          ),
           BlocProvider<AddressBlocBloc>(
            create: (BuildContext context) => AddressBlocBloc(addressController: AddressController())..add(LoadAddressEvent())
          ),
      ],
      child: KhaltiScope(
  publicKey: "test_public_key_7eeba76e073e4aa1b4bc9d35fb809a19",
  builder: (context, navigatorKey) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('ne', 'NP'),
      ],
      localizationsDelegates: const [
        KhaltiLocalizations.delegate,
      ],
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          bottomSheetTheme: BottomSheetThemeData(
              backgroundColor: Colors.black.withOpacity(0)),
        ),
        // onGenerateRoute: RouteGenerator.getRoute,
        //   initialRoute: Routes.splashRoute,
        home: MarkMap(),
      );
  })
    );
  }
}

