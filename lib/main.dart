import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/routes.dart';
import 'package:shop_app/screens/splash/splash_screen.dart';
import 'package:shop_app/services/authServices.dart';
import 'package:shop_app/theme.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthServices(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  // final storage = const FlutterSecureStorage();
  // void initState() {
  //   readToken();
  // }
  //
  // void readToken() async {
  //   final token = await storage.read(key: "token");
  //   // Provider.of<Auth>(context, listen: false).tryToken(token: token);
  //   print('This is token :$token');
  // }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      // home: SplashScreen(),
      // We use routeName so that we don't need to remember the name
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
