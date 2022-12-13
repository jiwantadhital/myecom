
import 'dart:io';

import 'package:ecommerce/data_provider/data_provider.dart';
import 'package:ecommerce/local_database/shared_prefs.dart';
import 'package:ecommerce/logic/bloc/login_bloc.dart';
import 'package:ecommerce/presentation/bottom_navigation/bottom_navigation_bar.dart';
import 'package:ecommerce/presentation/main_pages/home_pages/home_page.dart';
import 'package:ecommerce/presentation/splash/splash_screen.dart';
import 'package:ecommerce/repository/auth_repository.dart';
import 'package:ecommerce/routes/route_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          bottomSheetTheme: BottomSheetThemeData(
              backgroundColor: Colors.black.withOpacity(0)),
        ),
        home: BottomBarPage(),
        // onGenerateRoute: RouteGenerator.getRoute,
        //   initialRoute: Routes.splashRoute,
      ),
    );
  }
}

