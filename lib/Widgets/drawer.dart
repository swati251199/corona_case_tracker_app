import 'package:flutter/material.dart';

import '../Screens/complex_api.dart';
import '../Screens/hit_api_without _modal.dart';
import '../Screens/photosApi_screens.dart';
import '../Screens/user_screen.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Container(
            width: double.infinity,
            child: DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.blueAccent,
                ),
                child: Center(
                  child: Text(
                    "Select Api ",
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                  ),
                )),
          ),
          TextButton(
              onPressed: () {
                Navigator.pop(context); // to close drawer
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const PhotosApi()));
              },
              child: StyleText("Photos Api Screen")),
          TextButton(
            onPressed: () {
              Navigator.pop(context); // to close drawer
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => UserApi()));
            },
            child: StyleText("User Api Screen"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context); // to close drawer
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const WithoutModal()));
            },
            child: StyleText(
                "Building List with Complex JSON Data WithOut Model "),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context); // to close drawer
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ComplexApiScreen()));
            },
            child: StyleText(
                "fetch data from Complex Api "),
          ),
        ],
      ),
    );
  }
}

class StyleText extends StatelessWidget {
  String text;
  StyleText(@required this.text, {super.key});
  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.blue,
          fontSize: 22,

            ));
  }
}
