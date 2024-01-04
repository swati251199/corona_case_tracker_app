import 'package:flutter/material.dart';

class ReuseableRow extends StatelessWidget {
  ReuseableRow({Key? key, required this.text, required this.value})
      : super(key: key);
  String text;
  String value;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,style: TextStyle(fontSize: 18),),

        Text(value,style: TextStyle(fontSize: 18)),
      ],
    );
  }
}
