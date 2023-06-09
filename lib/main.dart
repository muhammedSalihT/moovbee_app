import 'package:flutter/material.dart';
import 'package:moovbe_app/screens/view_models/add_driver_viewmodel.dart';
import 'package:moovbe_app/screens/view_models/bus_list_viewmodel.dart';
import 'package:moovbe_app/screens/view_models/bus_seat_viewmodel.dart';
import 'package:moovbe_app/screens/view_models/driver_list_viewmodel.dart';
import 'package:moovbe_app/screens/view_models/login_viewmodel.dart';
import 'package:moovbe_app/screens/views/splash_screen.dart';
import 'package:moovbe_app/utils/constents.dart';
import 'package:moovbe_app/utils/routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoginViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => BusSeatViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => BusListViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => DriverListViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => AddDriverViewModel(),
        )
      ],
      child: MaterialApp(
        navigatorKey: RoutesManager.navigatorKey,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          elevatedButtonTheme: const ElevatedButtonThemeData(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(AppConstents.appPrimeryColor))),
          appBarTheme: const AppBarTheme(color: AppConstents.appSecondryColor),
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
