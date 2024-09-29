import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GoBackButton extends StatelessWidget {
  const GoBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top:10,
      child: IconButton(onPressed: (){
        Navigator.pop(context);
      }, icon: const Icon(Icons.keyboard_arrow_left,
        size: 45,
        color: Colors.blue,)),
    );
  }
}
