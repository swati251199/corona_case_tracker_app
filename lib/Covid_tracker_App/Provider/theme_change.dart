import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class ThemeChangeProvider extends ChangeNotifier{
   ThemeData _theme = ThemeData(
     brightness: Brightness.dark,

   );

  ThemeData get theme => _theme;

  set theme(ThemeData value) {
    _theme = value;
  }

setTheme(){
  final isLight = _theme == ThemeData.light(
    useMaterial3: true,
  );
  if(isLight){
    _theme = ThemeData.dark(
        useMaterial3: true
    );
  }
  else{
    _theme = ThemeData.light(
      useMaterial3: true
    );
  }
  notifyListeners();
  // if(theme == Brightness.dark){
  //   print("tap on theme change ");
  //   theme =  ThemeData(
  //     brightness: Brightness.light,
  //   );}
  // else {
  //   ThemeData(
  //     brightness: Brightness.dark,
  //   ) ;
  // }
  // notifyListeners();
  }
}


