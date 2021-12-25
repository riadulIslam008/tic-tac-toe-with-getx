import 'package:flutter/material.dart';
import 'package:tic_tac_toe/Core/Color.dart';
import 'package:tic_tac_toe/Core/Veriable.dart';

class BoxContainer extends StatelessWidget {
  BoxContainer(
      {Key? key,
      this.bottomWidth = true,
      this.rightWidth = true,
      required this.index, required this.onPressed})
      : super(key: key);

  final bool bottomWidth;
  final bool rightWidth;
  final int index;
  final VoidCallback onPressed;

  final TextStyle _style = TextStyle(
    color: Colors.black,
    fontSize: 50,
    fontWeight: FontWeight.bold,
  );

  final double _width = 5;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 90,
        width: 90,
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(
              color: rightWidth ? BLACK_COLOR : TRANSPARENT,
              width: _width,
            ),
            bottom: BorderSide(
              color: bottomWidth ? BLACK_COLOR : TRANSPARENT,
              width: _width,
            ),
          ),
        ),
        child: itemList[index] == null
            ? Container()
            : Center(child: Text(itemList[index], style: _style)),
      ),
    );
  }
}
