import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainButton extends StatelessWidget {
  const MainButton({super.key, required this.label, required this.onPress});

 final String label ;

  final Function() onPress;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: ElevatedButton(
          onPressed: onPress,
          child: Text(label,style:TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.white)),
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Colors.grey),
            fixedSize: WidgetStatePropertyAll(Size.fromHeight(48))
          )),
    );
  }
}
