import 'package:api_tutorial/Screens/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Covid_tracker_App/Provider/theme_change.dart';
import 'Covid_tracker_App/View/splash_screen.dart';
import 'Screens/complex_api.dart';
import 'Screens/photosApi_screens.dart';
import 'Screens/singup.dart';
import 'Screens/upload_image.dart';

void main() {
  runApp(
      ChangeNotifierProvider(
        create: (_) => ThemeChangeProvider(),
        child: const MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "API Tutorial",

      debugShowCheckedModeBanner: false,
      theme: context.watch<ThemeChangeProvider>().theme,
      home: SplashScreen(),
      //UploadImageScreen(),//PhotosApi   //SingUpScreen (),//ComplexApiScreen()
    );
  }
}
